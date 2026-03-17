
 fetch("header.php")
    .then(res => res.text())
    .then(data => {
      document.getElementById("header-placeholder").innerHTML = data;

      // După ce header-ul este adăugat, căutăm linkul curent
      const currentPage = window.location.pathname.split("/").pop();

      document.querySelectorAll("nav a").forEach(link => {
        const href = link.getAttribute("href");

        // Marchează linkul activ
        if (href === currentPage || (href === "index.php" && currentPage === "")) {
          link.classList.add("active");
        }
      });
    });

  fetch("footer.html")
  .then(res => res.text())
  .then(data => {
    document.getElementById("footer-placeholder").innerHTML = data;
  });

 
  
  function afiseazaJoburi() {
    const sectiune = document.getElementById("sectiune-joburi");
    sectiune.style.display = "block";
    sectiune.scrollIntoView({ behavior: "smooth" });
  }



  const inregistrareForm = document.getElementById("inregistrare-form");

if (inregistrareForm) {
  inregistrareForm.addEventListener("submit", function (e) {
    const parola = document.getElementById("parola").value;
    const confirmare = document.getElementById("confirmare-parola").value;

    if (parola !== confirmare) {
      e.preventDefault();
      alert("Parolele nu coincid. Te rog să verifici.");
    } else {
      afiseazaPopupSucces();

    }
  });
}

// evenimente
function filtreazaEvenimente() {
  const input = document.getElementById("searchInput").value.toLowerCase();
  const evenimente = document.querySelectorAll(".eveniment");

  evenimente.forEach(ev => {
    const text = ev.innerText.toLowerCase();
    ev.style.display = text.includes(input) ? "flex" : "none";
  });
}


(function () {
  const div = document.getElementById("mesaj-eroarec");

  // Dacă nu există containerul în pagină, oprim aici
  if (!div) return;

  const params = new URLSearchParams(window.location.search);
  const eroare = params.get("eroare");

  if (!eroare) return;

  const mesaj = document.createElement("p");
  mesaj.classList.add("eroare-mesajc");

  if (eroare === "autentificare") {
    mesaj.textContent = "❌ Email sau parolă incorecte!";
  } else if (eroare === "campuri") {
    mesaj.textContent = "⚠️ Completează toate câmpurile!";
  }

  div.appendChild(mesaj);
})();

document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("newsletter-form");
  const emailInput = document.getElementById("newsletter-email");
  const mesajDiv = document.getElementById("newsletter-mesaj");

  if (form) {
    form.addEventListener("submit", function (e) {
      e.preventDefault();

      const email = emailInput.value;

      fetch("newsletter.php", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: new URLSearchParams({ email })
      })
        .then(res => res.text())
        .then(text => {
          mesajDiv.textContent = text;
          mesajDiv.style.display = "block";
          emailInput.value = "";
          setTimeout(() => {
            mesajDiv.style.display = "none";
          }, 4000);
        })
        .catch(() => {
          mesajDiv.textContent = "A apărut o eroare. Încearcă din nou.";
          mesajDiv.style.display = "block";
        });
    });
  }
});

