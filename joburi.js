fetch("joburi_firme.php")
  .then(response => response.json())
  .then(data => {
    const optiuni = {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true,
          ticks: {
            stepSize: 1,
            callback: function(value) {
              return Number.isInteger(value) ? value : null;
            }
          }
        }
      },
      plugins: {
        legend: {
          display: true
        }
      }
    };

    const ctxJoburi = document.getElementById('joburiChart').getContext('2d');
    new Chart(ctxJoburi, {
      type: 'bar',
      data: {
        labels: data.joburi.labels,
        datasets: [{
          label: 'TOP 5 job-uri',
          data: data.joburi.values,
          backgroundColor: '#7a5af5'
        }]
      },
      options: optiuni
    });

    const ctxFirme = document.getElementById('firmeChart').getContext('2d');
    new Chart(ctxFirme, {
      type: 'bar',
      data: {
        labels: data.firme.labels,
        datasets: [{
          label: 'TOP 5 firme',
          data: data.firme.values,
          backgroundColor: '#5e60ce'
        }]
      },
      options: optiuni
    });
  });
const ctxJoburi = document.getElementById('joburiChart').getContext('2d');

new Chart(ctxJoburi, {
  type: 'bar',
  data: {
    labels: [
      'Frontend Developer',
      'Digital Marketing Specialist',
      'Web Developer',
      'Software Tester',
      'Data Analyst' // am ales acest job pentru top 5
    ],
    datasets: [{
      label: 'TOP 5 job-uri',
      data: [13, 12, 8, 7, 3], // valori exemplu (poți schimba)
      backgroundColor: '#7a5af5'
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        display: true
      },
      title: {
        display: true,
        text: 'Cele mai populare joburi în rândul alumni'
      }
    },
    scales: {
      y: {
        beginAtZero: true,
        ticks: {
          stepSize: 10
        },
        title: {
          display: true,
         
        }
      },
      x: {
        title: {
          display: true,
         
        }
      }
    }
  }
});

const ctxFirme = document.getElementById('firmeChart').getContext('2d');

new Chart(ctxFirme, {
  type: 'bar',
  data: {
    labels: [
      'Centric',
      'Codeless',
      'Red Point Software Solutions',
      'RomSoft',
      'OSF DIGITAL'
    ],
    datasets: [{
      label: 'TOP 5 firme',
      data: [9, 8, 6, 6, 4], // valori aproximative după grafic
      backgroundColor: '#7a5af5'
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        display: true
      },
      title: {
        display: false
      }
    },
    scales: {
      x: {
        ticks: {
          maxRotation: 45,
          minRotation: 45,
          color: '#444'
        }
      },
      y: {
        beginAtZero: true,
        ticks: {
          stepSize: 2
        },
        title: {
          display: true,
         
        }
      }
    }
  }
});
