<?php
session_start();
require_once 'bazaDeDate.php';

$id_utilizator = $_SESSION['utilizator_id'] ?? null;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['continutComentariu'], $_POST['id_intrebare'])) {
    $continutComentariu = trim($_POST['continutComentariu']);
    $id_intrebare = $_POST['id_intrebare'];

    if ($continutComentariu !== '' && $id_utilizator) {
        $stmt = $pdo->prepare("INSERT INTO comentariuforum (continutComentariu, data_comentariu, id_utilizator, id_intrebare) VALUES (?, NOW(), ?, ?)");
        $stmt->execute([$continutComentariu, $id_utilizator, $id_intrebare]);
    }

   header("Location: forum.php#intrebare-" . $id_intrebare);
exit;
$data_comentariu = date('Y-m-d H:i:s');
$stmt = $pdo->prepare("INSERT INTO comentariuforum (continutComentariu, data_comentariu, id_utilizator, id_intrebare) VALUES (?, ?, ?, ?)");
$stmt->execute([$continutComentariu, $data_comentariu, $id_utilizator, $id_intrebare]);


}
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['titlu'], $_POST['continutIntrebare']) && $id_utilizator) {
    $titlu = trim($_POST['titlu']);
    $continutIntrebare = trim($_POST['continutIntrebare']);

    if ($titlu !== '' && $continutIntrebare !== '') {
        $stmt = $pdo->prepare("INSERT INTO intrebareforum (titlu, continutIntrebare, data_intrebare, id_utilizator) VALUES (?, ?, NOW(), ?)");
        $stmt->execute([$titlu, $continutIntrebare, $id_utilizator]);
        header("Location: forum.php");
        exit;
    }
}

$intrebari = $pdo->query("
    SELECT i.id_intrebare, i.titlu, i.continutIntrebare, i.data_intrebare, u.nume AS autor
    FROM intrebareforum i
    JOIN utilizator u ON i.id_utilizator = u.id_utilizator
    ORDER BY i.data_intrebare DESC
")->fetchAll(PDO::FETCH_ASSOC);

$comentarii_pe_intrebare = [];
foreach ($intrebari as $i) {
    $stmt = $pdo->prepare("
        SELECT c.continutComentariu, c.data_comentariu, u.nume, u.poza_profil
        FROM comentariuforum c
        JOIN utilizator u ON c.id_utilizator = u.id_utilizator
        WHERE c.id_intrebare = ?
        ORDER BY c.data_comentariu ASC
    ");
    $stmt->execute([$i['id_intrebare']]);
    $comentarii_pe_intrebare[$i['id_intrebare']] = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html lang="ro">
<head>

  <meta charset="UTF-8">
  <title>Forum AlumniConnect</title>
  <link rel="stylesheet" href="forum.css">
  </head>
  <button id="scrollTopBtn" title="Sus">⬆️</button>
<script>
  const scrollTopBtn = document.getElementById("scrollTopBtn");

  window.onscroll = function () {
    scrollTopBtn.style.display = window.scrollY > 300 ? "block" : "none";
  };

  scrollTopBtn.addEventListener("click", function () {
    window.scrollTo({
      top: 0,
      behavior: "smooth"
    });
  });
</script>

<body>
  
<section class="forum-background">
  <div class="hero-overlay"></div>

  <!-- mutat aici, în afara .hero-content -->
  <a href="index.html" class="btn-principal">🏠 Înapoi în meniul principal</a>

  <div class="hero-content">
    <h2></h2>
    <p class="intro-text">
 Acest forum este locul unde foștii studenți se pot reconecta, pot pune întrebări, împărtăși experiențe sau oferi sfaturi utile celor din generațiile următoare. 
 Fii parte din comunitate și spune-ți părerea!      </p>
   
 <button id="toggleIntrebare" class="btn-intrebare"> Adaugă o întrebare</button>
 </div>
</section>




<form id="formIntrebare" method="POST" class="form-intrebare" style="display:none;">
  <input type="text" name="titlu" placeholder="Titlul întrebării" required><br>
  <textarea name="continutIntrebare" placeholder="Conținutul întrebării" rows="5" required></textarea><br>
  <button type="submit">Publică întrebarea</button>
</form>
<div class="bara-cautare-forum">
  <input type="text" id="searchForumInput" placeholder="Caută în forum..." onkeyup="filtreazaForum()">
</div>

  <div class="lista-intrebari">
  <?php foreach ($intrebari as $intrebare): ?>
    <div class="forum-alumni-row intrebare-forum">

      <div class="forum-alumni-topic">
        <h3 class="titlu"><?= htmlspecialchars($intrebare['titlu']) ?></h3>
        <small>
          Deschis de <strong><?= htmlspecialchars($intrebare['autor']) ?></strong>
          pe <?= date('d.m.Y', strtotime($intrebare['data_intrebare'])) ?>
        </small>
        <p><?= nl2br(htmlspecialchars($intrebare['continutintrebare'])) ?></p>
      </div>

      <div class="forum-alumni-comentarii">
        <?php foreach ($comentarii_pe_intrebare[$intrebare['id_intrebare']] as $c): ?>
          <div class="comentariu-box">
            <img src="<?= $c['poza_profil'] ?: 'default-avatar.jpg' ?>" alt="avatar" class="comentariu-avatar">
            <div class="comentariu-content">
              <strong><?= htmlspecialchars($c['nume']) ?></strong>
              <p><?= nl2br(htmlspecialchars($c['continutcomentariu'])) ?></p>
              <small><?= date('d.m.Y H:i', strtotime($c['data_comentariu'])) ?></small>
            </div>
          </div>
        <?php endforeach; ?>
      </div>

      <form method="POST" class="form-comentariu">
        <input type="hidden" name="id_intrebare" value="<?= $intrebare['id_intrebare'] ?>">
        <textarea name="continutComentariu" placeholder="Scrie un comentariu..." required></textarea>
        <button type="submit">Comentează</button>
      </form>
    </div>
  <?php endforeach; ?>
  <script>
  const toggleIntrebareBtn = document.getElementById("toggleIntrebare");
  const formIntrebare = document.getElementById("formIntrebare");

  toggleIntrebareBtn.addEventListener("click", () => {
    formIntrebare.style.display = (formIntrebare.style.display === "none") ? "block" : "none";
  });
</script>
<script>
function filtreazaForum() {
  const input = document.getElementById("searchForumInput").value.toLowerCase();
  const intrebari = document.querySelectorAll(".intrebare-forum");

  intrebari.forEach(intrebare => {
    const titlu = intrebare.querySelector(".titlu")?.innerText.toLowerCase() || "";
    const continutIntrebare = intrebare.querySelector(".continutIntrebare")?.innerText.toLowerCase() || "";
    const autor = intrebare.querySelector(".autor")?.innerText.toLowerCase() || "";
    const comentarii = intrebare.querySelector(".comentarii")?.innerText.toLowerCase() || "";

    const text = `${titlu} ${continutComentariu} ${autor} ${comentarii}`;
    intrebare.style.display = text.includes(input) ? "block" : "none";
  });
}
</script>


</body>
</html>
