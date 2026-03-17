<?php
session_start();
require_once 'bazaDeDate.php';

try {
    // 1. Preluare date din formular
    $nume              = trim($_POST['nume']);
    $email             = trim($_POST['email']);
    $telefon           = trim($_POST['telefon']);
    $adresa            = trim($_POST['adresa']);
    $cod_postal        = trim($_POST['cod_postal']);
    $stare_civila      = trim($_POST['stare-civila']);
    $cariera           = trim($_POST['cariera']);
    $interese          = trim($_POST['interese'] ?? '');

    $universitate      = trim($_POST['universitate']);
    $facultate         = trim($_POST['facultate']);
    $specializare      = trim($_POST['specializare']);
    $anInmatriculare   = trim($_POST['anInmatriculare']);
    $anFinalizare      = trim($_POST['anFinalizare']);

    $tara              = trim($_POST['tara']);
    $judet             = trim($_POST['regiune']);
    $localitate        = trim($_POST['loc']);

    $parola_raw        = $_POST['parola'];
    $confirmare_parola = $_POST['confirmare-parola'];

    if ($parola_raw !== $confirmare_parola) {
        throw new Exception("Parolele nu coincid.");
    }

    $parola = password_hash($parola_raw, PASSWORD_DEFAULT);
    $poza = null;

    if (isset($_FILES['poza']) && $_FILES['poza']['error'] === UPLOAD_ERR_OK) {
        $ext = pathinfo($_FILES['poza']['name'], PATHINFO_EXTENSION);
        $nume_fisier = uniqid('profil_', true) . '.' . $ext;
        $poza = 'uploads/' . $nume_fisier;
        move_uploaded_file($_FILES['poza']['tmp_name'], $poza);
    }

    $pdo->beginTransaction();

    // Tara
    $stmt = $pdo->prepare("SELECT id_tara FROM tara WHERE numeTara = ?");
    $stmt->execute([$tara]);
    $id_tara = $stmt->fetchColumn();
    if (!$id_tara) {
        $stmt = $pdo->prepare("INSERT INTO tara (numeTara) VALUES (?) RETURNING id_tara");
        $stmt->execute([$tara]);
        $id_tara = $stmt->fetchColumn();
    }

    // Judet
    $stmt = $pdo->prepare("SELECT id_judet FROM judet WHERE numeJudet = ? AND id_tara = ?");
    $stmt->execute([$judet, $id_tara]);
    $id_judet = $stmt->fetchColumn();
    if (!$id_judet) {
        $stmt = $pdo->prepare("INSERT INTO judet (numeJudet, id_tara) VALUES (?, ?) RETURNING id_judet");
        $stmt->execute([$judet, $id_tara]);
        $id_judet = $stmt->fetchColumn();
    }

    // Localitate
    $stmt = $pdo->prepare("SELECT id_localitate FROM localitate WHERE numeLocalitate = ? AND id_judet = ?");
    $stmt->execute([$localitate, $id_judet]);
    $id_localitate = $stmt->fetchColumn();
    if (!$id_localitate) {
        $stmt = $pdo->prepare("INSERT INTO localitate (numeLocalitate, id_judet) VALUES (?, ?) RETURNING id_localitate");
        $stmt->execute([$localitate, $id_judet]);
        $id_localitate = $stmt->fetchColumn();
    }

    // Universitate
    $stmt = $pdo->prepare("SELECT id_universitate FROM universitate WHERE numeUniversitate = ?");
    $stmt->execute([$universitate]);
    $id_universitate = $stmt->fetchColumn();
    if (!$id_universitate) {
        $stmt = $pdo->prepare("INSERT INTO universitate (numeUniversitate) VALUES (?) RETURNING id_universitate");
        $stmt->execute([$universitate]);
        $id_universitate = $stmt->fetchColumn();
    }

    // Facultate
    $stmt = $pdo->prepare("SELECT id_facultate FROM facultate WHERE numeFacultate = ? AND id_universitate = ?");
    $stmt->execute([$facultate, $id_universitate]);
    $id_facultate = $stmt->fetchColumn();
    if (!$id_facultate) {
        $stmt = $pdo->prepare("INSERT INTO facultate (numeFacultate, id_universitate) VALUES (?, ?) RETURNING id_facultate");
        $stmt->execute([$facultate, $id_universitate]);
        $id_facultate = $stmt->fetchColumn();
    }

    // Specializare
    $stmt = $pdo->prepare("SELECT id_specializare FROM specializari WHERE numeSpecializare = ? AND id_facultate = ?");
    $stmt->execute([$specializare, $id_facultate]);
    $id_specializare = $stmt->fetchColumn();
    if (!$id_specializare) {
        $stmt = $pdo->prepare("INSERT INTO specializari (numeSpecializare, id_facultate) VALUES (?, ?) RETURNING id_specializare");
        $stmt->execute([$specializare, $id_facultate]);
        $id_specializare = $stmt->fetchColumn();
    }

    // Utilizator
    $sql = "INSERT INTO utilizator (nume, email, telefon, adresa, cod_postal, id_localitate, id_universitate,
              stare_civila, cariera, parola, poza_profil, interese)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING id_utilizator";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        $nume, $email, $telefon, $adresa, $cod_postal, $id_localitate,
        $id_universitate, $stare_civila, $cariera, $parola, $poza, $interese
    ]);
    $id_utilizator = $stmt->fetchColumn();

    // SpecializareUtilizatori
    $stmt = $pdo->prepare("INSERT INTO specializareutilizatori (id_utilizator, id_specializare, anInmatriculare, anFinalizare)
                           VALUES (?, ?, ?, ?)");
    $stmt->execute([$id_utilizator, $id_specializare, $anInmatriculare, $anFinalizare]);

    $pdo->commit();
    $_SESSION['utilizator_id'] = $id_utilizator;
    header("Location: index.html");
    exit;

} catch (Throwable $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    die("Eroare la înregistrare: " . $e->getMessage());
}
