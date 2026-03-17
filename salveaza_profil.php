<?php
session_start();
require_once 'bazaDeDate.php';

if (!isset($_SESSION['utilizator_id'])) {
    header("Location: formular-conectare.html");
    exit;
}

$id = $_SESSION['utilizator_id'];

// Preluare date din formular
$nume = $_POST['nume'] ?? '';
$email = $_POST['email'] ?? '';
$telefon = $_POST['telefon'] ?? '';
$adresa = $_POST['adresa'] ?? '';
$cod_postal = $_POST['cod_postal'] ?? '';
$stare_civila = $_POST['stare-civila'] ?? '';
$cariera = $_POST['cariera'] ?? '';
$interese = $_POST['interese'] ?? '';

$tara = $_POST['tara'] ?? '';
$regiune = $_POST['regiune'] ?? '';
$localitate = $_POST['loc'] ?? '';

$universitate = $_POST['universitate'] ?? '';
$facultate = $_POST['facultate'] ?? '';
$specializare = $_POST['specializare'] ?? '';
$anInmatriculare = isset($_POST['anInmatriculare']) ? (int)$_POST['anInmatriculare'] : null;
$anFinalizare = isset($_POST['anFinalizare']) ? (int)$_POST['anFinalizare'] : null;

$firma = $_POST['firma'] ?? '';

// Upload poza de profil
$stmt = $pdo->prepare("SELECT poza_profil FROM utilizator WHERE id_utilizator = ?");
$stmt->execute([$id]);
$poza_profil = $stmt->fetchColumn();

if (!empty($_FILES['poza']['name'])) {
    $target_dir = "uploads/";
    if (!is_dir($target_dir)) mkdir($target_dir);
    $target_file = $target_dir . uniqid('profil_', true) . '_' . basename($_FILES["poza"]["name"]);
    move_uploaded_file($_FILES["poza"]["tmp_name"], $target_file);
    $poza_profil = $target_file;
}

function getOrInsert($pdo, $table, $column, $value) {
    $id_map = [
        'tara' => 'id_tara',
        'judet' => 'id_judet',
        'localitate' => 'id_localitate',
        'universitate' => 'id_universitate',
        'facultate' => 'id_facultate',
        'specializari' => 'id_specializare',
        'firma' => 'id_firma'
    ];
    $id_column = $id_map[$table];

    $stmt = $pdo->prepare("SELECT $id_column FROM $table WHERE $column = ?");
    $stmt->execute([$value]);
    $id = $stmt->fetchColumn();

    if (!$id) {
        $stmt = $pdo->prepare("INSERT INTO $table ($column) VALUES (?) RETURNING $id_column");
        $stmt->execute([$value]);
        $id = $stmt->fetchColumn();
    }

    return $id;
}

// Inserare ierarhie locație
$id_tara = getOrInsert($pdo, 'tara', 'numeTara', $tara);
$id_judet = getOrInsert($pdo, 'judet', 'numeJudet', $regiune);
$pdo->prepare("UPDATE judet SET id_tara = ? WHERE numeJudet = ?")->execute([$id_tara, $regiune]);

$id_localitate = getOrInsert($pdo, 'localitate', 'numeLocalitate', $localitate);
$pdo->prepare("UPDATE localitate SET id_judet = ? WHERE numeLocalitate = ?")->execute([$id_judet, $localitate]);

// Universitate - Facultate - Specializare
$id_universitate = getOrInsert($pdo, 'universitate', 'numeUniversitate', $universitate);
$id_facultate = getOrInsert($pdo, 'facultate', 'numeFacultate', $facultate);
$pdo->prepare("UPDATE facultate SET id_universitate = ? WHERE numeFacultate = ?")->execute([$id_universitate, $facultate]);

$id_specializare = getOrInsert($pdo, 'specializari', 'numeSpecializare', $specializare);
$pdo->prepare("UPDATE specializari SET id_facultate = ? WHERE numeSpecializare = ?")->execute([$id_facultate, $specializare]);

// Firma + Loc de munca
$id_firma = getOrInsert($pdo, 'firma', 'denumire', $firma);
$stmt = $pdo->prepare("INSERT INTO locdemunca (functie, id_utilizator, id_firma) VALUES (?, ?, ?) RETURNING id_locMunca");
$stmt->execute([$cariera, $id, $id_firma]);

// UPDATE tabel utilizator
$stmt = $pdo->prepare("UPDATE utilizator SET 
    nume = ?, email = ?, telefon = ?, adresa = ?, cod_postal = ?, 
    stare_civila = ?, cariera = ?, interese = ?, poza_profil = ?, 
    id_localitate = ?, id_universitate = ?
    WHERE id_utilizator = ?");
$stmt->execute([
    $nume, $email, $telefon, $adresa, $cod_postal,
    $stare_civila, $cariera, $interese, $poza_profil,
    $id_localitate, $id_universitate, $id
]);

// UPDATE specializareutilizatori doar dacă există ani validați
$pdo->prepare("DELETE FROM specializareutilizatori WHERE id_utilizator = ?")->execute([$id]);

if ($id_specializare && $anInmatriculare && $anFinalizare) {
    $pdo->prepare("INSERT INTO specializareutilizatori (id_utilizator, id_specializare, anInmatriculare, anFinalizare)
                   VALUES (?, ?, ?, ?)")
        ->execute([$id, $id_specializare, $anInmatriculare, $anFinalizare]);
}

header("Location: profil.php");
exit;
?>
