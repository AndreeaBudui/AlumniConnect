<?php
require_once 'bazaDeDate.php';

$email = $_POST['email'] ?? null;

if (!$email || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "❌ Email invalid.";
    exit;
}

// Verifică dacă emailul există deja
$stmt = $pdo->prepare("SELECT id_abonare FROM newsletter WHERE email = ?");
$stmt->execute([$email]);
if ($stmt->fetchColumn()) {
    echo "ℹ️ Ești deja abonat.";
    exit;
}

// Inserare în tabelă
$stmt = $pdo->prepare("INSERT INTO newsletter (email) VALUES (?)");
$stmt->execute([$email]);


// Redirecționează către pagina principală
header("Location: index.html?abonat=1");
exit;

?>
