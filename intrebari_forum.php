<?php
session_start();
require_once 'bazaDeDate.php';

if (!isset($_SESSION['utilizator_id'])) {
    header("Location: formular-conectare.html");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $titlu = trim($_POST['titlu'] ?? '');
    $continutIntrebare = trim($_POST['continutIntrebare'] ?? '');
    $id_utilizator = $_SESSION['utilizator_id'];

    if ($titlu && $continutIntrebare) {
        $stmt = $pdo->prepare("
            INSERT INTO intrebareforum (titlu, continutIntrebare, data_intrebare, id_utilizator)
            VALUES (?, ?, NOW(), ?)
        ");
        $stmt->execute([$titlu, $continutIntrebare, $id_utilizator]);

        header("Location: forum.php");
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="ro">
<head>
  <meta charset="UTF-8">
  <title>Adaugă întrebare</title>
  <link rel="stylesheet" href="forum.css">
</head>
<body>
  <div class="container-intrebare">
    <h2>Adaugă o întrebare nouă</h2>
    <form method="POST">
      <label for="titlu">Titlu</label><br>
      <input type="text" name="titlu" id="titlu" required><br><br>

      <label for="continutIntrebare">Conținut</label><br>
      <textarea name="continutIntrebare" id="continutIntrebare" rows="5" required></textarea><br><br>

      <button type="submit">Publică întrebarea</button>
    </form>
  </div>
</body>
</html>
