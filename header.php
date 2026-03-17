<?php
session_start();
require_once 'bazaDeDate.php';

$poza = null;
$nume = null;

if (isset($_SESSION['utilizator_id'])) {
    $stmt = $pdo->prepare("SELECT poza_profil, nume FROM utilizator WHERE id_utilizator = ?");
    $stmt->execute([$_SESSION['utilizator_id']]);
    $rezultat = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($rezultat) {
        $poza = $rezultat['poza_profil'];
        $nume = $rezultat['nume'];
    }
}
?>


<div class="top-bar">
  <div class="container top-links">
    <!-- exemplu: Conexiune reușită! sau linkuri utile -->
  </div>
</div>

<header class="site-header">
  <div class="container nav-container">
    <a href="index.html" class="logo-link">
      <img src="logo.png" alt="Logo" class="logo-img">
      <span class="logo-title">
        <span class="bold-part">Alumni</span><span class="light-part">Connect</span>
      </span>
    </a>

    <nav class="main-nav">
      <a href="forum.php">Forum</a>
      <a href="comunitate.html">Comunitate</a>
      <a href="evenimente.html">Evenimente</a>
      <a href="oportunitati.html">Oportunități de carieră</a>
      <a href="donatii.html">Donații</a>
<?php if ($poza): ?>
  <div class="profil-dropdown">
    <div class="profil-trigger">
      <img src="<?= htmlspecialchars($poza) ?>" class="avatar-menubar" alt="Profil">
      <span class="nume-menubar"><?= htmlspecialchars($nume) ?></span>
    </div>
    <div class="dropdown-content">
      <a href="profil.php">Profil</a>
      <a href="deconectare.php">Deconectează-te</a>
    </div>
  </div>
<?php else: ?>
  <a href="formular-inregistrare.html" class="btn-inregistrare">Înregistrează-te</a>
  <a href="formular-conectare.html" class="btn-conectare">Conectează-te</a>
<?php endif; ?>


      </div>
    </nav>
  </div>
</header>
