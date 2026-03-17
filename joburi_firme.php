<?php
require_once "bazaDeDate.php";
header('Content-Type: application/json');

// ======================
// STATISTICI PE JOBURI
// ======================
$joburiStmt = $pdo->query("
    SELECT ld.functie AS job, COUNT(*) AS total
    FROM locdemunca ld
    JOIN utilizator u ON ld.id_utilizator = u.id_utilizator
    WHERE ld.functie IS NOT NULL AND ld.functie <> ''
    GROUP BY ld.functie
    ORDER BY total DESC
    LIMIT 5
");

$joburi = ['labels' => [], 'values' => []];
while ($row = $joburiStmt->fetch(PDO::FETCH_ASSOC)) {
    $joburi['labels'][] = $row['job'];
    $joburi['values'][] = (int)$row['total'];
}

// ======================
// STATISTICI PE FIRME
// ======================
$firmeStmt = $pdo->query("
    SELECT f.denumire AS firma, COUNT(*) AS total
    FROM locdemunca ld
    JOIN firma f ON ld.id_firma = f.id_firma
    JOIN utilizator u ON ld.id_utilizator = u.id_utilizator
    WHERE f.denumire IS NOT NULL AND f.denumire <> ''
    GROUP BY f.denumire
    ORDER BY total DESC
    LIMIT 5
");

$firme = ['labels' => [], 'values' => []];
while ($row = $firmeStmt->fetch(PDO::FETCH_ASSOC)) {
    $firme['labels'][] = $row['firma'];
    $firme['values'][] = (int)$row['total'];
}

// ======================
// RETURNARE CA JSON
// ======================
echo json_encode([
    'joburi' => $joburi,
    'firme' => $firme
]);
