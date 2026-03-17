<?php
session_start();
require_once 'bazaDeDate.php';

$id_utilizator = $_SESSION['utilizator_id'] ?? null;
$id_intrebare = $_GET['id'] ?? null;

if (!$id_intrebare) {
    echo "Întrebarea nu a fost găsită.";
    exit;
}

// Salvare comentariu
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $id_utilizator) {
    $continutComentariu = trim($_POST['continutComentariu'] ?? '');
    if ($continutComentariu !== '') {
        $stmt = $pdo->prepare("INSERT INTO comentariuforum (continutComentariu, data_comentariu, id_utilizator, id_intrebare) VALUES (?, NOW(), ?, ?)");
        $stmt->execute([$continutComentariu, $id_utilizator, $id_intrebare]);
    }
    header("Location: ./comentariu_forum.php?id=" . $id_intrebare . "#comentarii");
exit;

}

// Întrebare
$stmt = $pdo->prepare("SELECT i.*, u.nume FROM intrebareforum i JOIN utilizator u ON i.id_utilizator = u.id_utilizator WHERE id_intrebare = ?");
$stmt->execute([$id_intrebare]);
$intrebare = $stmt->fetch(PDO::FETCH_ASSOC);

// Comentarii
$stmt = $pdo->prepare("SELECT c.*, u.nume, u.poza_profil FROM comentariuforum c JOIN utilizator u ON c.id_utilizator = u.id_utilizator WHERE id_intrebare = ? ORDER BY data_comentariu ASC");
$stmt->execute([$id_intrebare]);
$comentarii = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="ro">
<head>
  <meta charset="UTF-8">
  <title><?= htmlspecialchars($intrebare['titlu']) ?></title>
  <link rel="stylesheet" href="forum.css">
</head>
<body>

  <div class="intrebare-container">
    <h2><?= htmlspecialchars($intrebare['titlu']) ?></h2>
    <p><?= nl2br(htmlspecialchars($intrebare['continutIntrebare'])) ?></p>
    <small class="intrebare-meta">Postat de <strong><?= htmlspecialchars($intrebare['nume']) ?></strong> pe <?= date('d.m.Y H:i', strtotime($intrebare['data_postare'])) ?></small>
  </div>

  <div class="comentarii-container" id="comentarii">
    <h3>Comentarii</h3>
    <?php foreach ($comentarii as $c): ?>
      <div class="comentariu-box">
        <img src="<?= $c['poza_profil'] ?: 'default-avatar.jpg' ?>" alt="Avatar" class="comentariu-avatar">
        <div class="comentariu-content">
          <strong><?= htmlspecialchars($c['nume']) ?></strong>
          <p><?= nl2br(htmlspecialchars($c['continutComentariu'])) ?></p>
          <small><?= date('d.m.Y H:i', strtotime($c['data_comentariu'])) ?></small>
        </div>
      </div>
    <?php endforeach; ?>
  </div>

  <section class="adauga-comentariu">
    <h2>Adaugă un comentariu</h2>
    <form method="POST">
      <textarea name="continutComentariu" placeholder="Scrie comentariul tău..." required></textarea>
      <button type="submit">Trimite comentariul</button>
    </form>
  </section>

</body>
</html>
