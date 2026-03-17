<?php
session_start();
require_once 'bazaDeDate.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nume = trim($_POST['nume'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $suma = floatval($_POST['suma'] ?? 0);
    $id_utilizator = $_SESSION['utilizator_id'] ?? null;

    if ($nume && $email && $suma > 0) {
        $stmt = $pdo->prepare("
            INSERT INTO donatie (id_utilizator, email, nume, suma, data_donatie)
            VALUES (?, ?, ?, ?, CURRENT_DATE)
        ");
        $stmt->execute([$id_utilizator, $email, $nume, $suma]);

        // redirecționează cu query parametru
        header("Location: formular-donatie.html?succes=1");
        exit;
    } else {
        header("Location: formular-donatie.html?eroare=1");
        exit;
    }
}
?>
