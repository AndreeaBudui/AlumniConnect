
<?php
session_start();
require_once 'bazaDeDate.php';

if (!isset($_SESSION['utilizator_id'])) {
    header("Location: formular-conectare.html");
    exit;
}

$id_utilizator = $_SESSION['utilizator_id'];

// Obține datele principale despre utilizator
$stmt = $pdo->prepare("SELECT u.*, 
         
           r.numeJudet AS regiune,
           t.numeTara AS tara,
           univ.numeUniversitate AS universitate,
           f.denumire AS firma,
           l.numeLocalitate AS loc
    FROM utilizator u
    LEFT JOIN localitate l ON u.id_localitate = l.id_localitate
    LEFT JOIN judet r ON l.id_judet = r.id_judet
    LEFT JOIN tara t ON r.id_tara = t.id_tara
    LEFT JOIN universitate univ ON u.id_universitate = univ.id_universitate
    LEFT JOIN locdemunca lm ON u.id_utilizator = lm.id_utilizator
    LEFT JOIN firma f ON lm.id_firma = f.id_firma
    WHERE u.id_utilizator = ?");
$stmt->execute([$id_utilizator]);
$utilizator = $stmt->fetch(PDO::FETCH_ASSOC);

// Preluare facultate și specializare
$stmt = $pdo->prepare('
    SELECT fa.numeFacultate, sp.numeSpecializare, su.anInmatriculare, su.anFinalizare
    FROM "specializareutilizatori" su
    JOIN "specializari" sp ON su.id_specializare = sp.id_specializare
    JOIN "facultate" fa ON sp.id_facultate = fa.id_facultate
    WHERE su.id_utilizator = ?
');

$stmt->execute([$id_utilizator]);


$rezultat = $stmt->fetch(PDO::FETCH_ASSOC);
$facultate = $rezultat['numefacultate'] ?? '';
$specializare = $rezultat['numespecializare'] ?? '';
$anInmatriculare = $rezultat['aninmatriculare'] ?? '';
$anFinalizare = $rezultat['anfinalizare'] ?? '';

function safe_value($array, $key) {
    return isset($array[$key]) ? htmlspecialchars($array[$key]) : '';
}
?>
<!DOCTYPE html>
<html lang="ro">
<head>
  <meta charset="UTF-8">
  <title>Profilul meu | AlumniConnect</title>
  <link rel="stylesheet" href="profil.css">
</head>
<body>
<section class="inregistrare-section">
  <div class="container">
    <a href="index.html" class="btn-inapoi">← Înapoi în meniul principal</a>
    <h2>Editează-ți profilul</h2>

    <form action="salveaza_profil.php" method="POST" enctype="multipart/form-data" class="formular-inregistrare">

      <div class="profil-avatar">
        <img src="<?= $utilizator['poza_profil'] ? htmlspecialchars($utilizator['poza_profil']) : 'default-avatar.jpg' ?>" alt="Avatar">
        <label for="poza">Actualizează poza de profil</label>
        <input type="file" id="poza" name="poza" accept="image/*" class="hidden-file-input">
      </div>

      <label for="nume">Nume complet</label>
      <input type="text" id="nume" name="nume" value="<?= safe_value($utilizator, 'nume') ?>" required>

      <label for="email">Adresă de email</label>
      <input type="email" id="email" name="email" value="<?= safe_value($utilizator, 'email') ?>" required>

      <label for="telefon">Număr de telefon</label>
      <input type="tel" id="telefon" name="telefon" value="<?= safe_value($utilizator, 'telefon') ?>">

      <fieldset>
        <legend>Adresă</legend>
        <input type="text" name="adresa" placeholder="Adresă (strada, număr)" value="<?= safe_value($utilizator, 'adresa') ?>">
        <input type="text" name="loc" placeholder="Localitate" value="<?= safe_value($utilizator, 'loc') ?>">

        <div class="address-row">
          <input type="text" name="regiune" placeholder="Județ" value="<?= safe_value($utilizator, 'regiune') ?>">
         
        </div>

        <div class="address-row">
          <input type="text" name="cod_postal" placeholder="Cod poștal" value="<?= safe_value($utilizator, 'cod_postal') ?>">
          <input type="text" name="tara" placeholder="Țara" value="<?= safe_value($utilizator, 'tara') ?>">
        </div>
      </fieldset>

      <fieldset>
        <legend>Stare civilă</legend>
        <label><input type="radio" name="stare-civila" value="necăsătorit" <?= ($utilizator['stare_civila'] === 'necăsătorit') ? 'checked' : '' ?>> Necăsătorit(ă)</label>
        <label><input type="radio" name="stare-civila" value="căsătorit" <?= ($utilizator['stare_civila'] === 'căsătorit') ? 'checked' : '' ?>> Căsătorit(ă)</label>
      </fieldset>

      <label for="universitate">Universitatea</label>
      <input type="text" id="universitate" name="universitate" value="<?= safe_value($utilizator, 'universitate') ?>">

      <label for="facultate">Facultatea</label>
      <input type="text" id="facultate" name="facultate" value="<?= htmlspecialchars($facultate) ?>">

      <label for="specializare">Specializarea</label>
      <input type="text" id="specializare" name="specializare" value="<?= htmlspecialchars($specializare) ?>">

      <label for="anInmatriculare">An înmatriculare</label>
      <input type="text" id="anInmatriculare" name="anInmatriculare" value="<?= htmlspecialchars($anInmatriculare) ?>">

      <label for="anFinalizare">An finalizare</label>
      <input type="text" id="anFinalizare" name="anFinalizare" value="<?= htmlspecialchars($anFinalizare) ?>">

      <label for="cariera">Domeniul actual de activitate</label>
      <input type="text" id="cariera" name="cariera" value="<?= safe_value($utilizator, 'cariera') ?>">

      <label for="firma">Firmă</label>
      <input type="text" id="firma" name="firma" value="<?= safe_value($utilizator, 'firma') ?>">

      <label for="interese">Interese ca alumni</label>
      <textarea id="interese" name="interese" rows="4"><?= safe_value($utilizator, 'interese') ?></textarea>

      <button type="submit" class="btn-trimite">Salvează modificările</button>
      <a href="deconectare.php" class="btn-deconectare-mic">Deconectează-te</a>

    </form>
  </div>
</section>
<div id="footer-placeholder"></div>
</body>
</html>