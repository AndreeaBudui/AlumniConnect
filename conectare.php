<?php
require_once 'bazaDeDate.php';
session_start();

$email = $_POST['email'] ?? '';
$parola = $_POST['parola'] ?? '';

if (!$email || !$parola) {
    header("Location: formular-conectare.html?eroare=campuri");
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM utilizator WHERE email = ?");
$stmt->execute([$email]);
$utilizator = $stmt->fetch(PDO::FETCH_ASSOC);


if (!$utilizator || !password_verify($parola, $utilizator['parola'])) {
    header("Location: formular-conectare.html?eroare=autentificare");
    exit;
}


$_SESSION['utilizator_id'] = $utilizator['id_utilizator'];
$_SESSION['nume'] = $utilizator['nume'];

header("Location: index.html");
exit;
?>
