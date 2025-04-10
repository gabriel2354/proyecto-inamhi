window.addEventListener("DOMContentLoaded", function () {
    const { jsPDF } = window.jspdf;
  
    window.exportarPDF = function () {
      const doc = new jsPDF('p', 'pt', 'a4');
      const elementHTML = document.getElementById("formulario");
  
      doc.html(elementHTML, {
        callback: function (doc) {
          doc.save("accion_personal.pdf");
        },
        x: 10,
        y: 10,
        autoPaging: 'text',
        width: 580,
        windowWidth: 1000
      });
    };
  });
  