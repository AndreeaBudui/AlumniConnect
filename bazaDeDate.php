<?php

$host = 'localhost';
$db = 'LicentaMea'; 
$user = 'postgres';
$pass = '0000'; 
$port = '5432';


try {
    $pdo = new PDO("pgsql:host=$host;port=$port;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   
} catch (PDOException $e) {
    echo "Eroare conexiune: " . $e->getMessage();
    exit();
}
?>
