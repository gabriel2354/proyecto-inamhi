

document.addEventListener('DOMContentLoaded', async () => {
  const urlParams = new URLSearchParams(window.location.search);
  const cedula = urlParams.get('cedula');

  if (cedula) {
    try {
      const res = await fetch(`http://localhost:3000/empleados/buscar?cedula=${cedula}`);
      if (!res.ok) throw new Error('Empleado no encontrado');
      const emp = await res.json();

      // 💾 Llenar campos del formulario
      document.getElementById('numero_identificacion').value = emp.numero_identificacion || '';
      document.getElementById('nombre').value = emp.nombres || '';
      document.getElementById('apellidos').value = emp.apellidos || '';
      document.getElementById('tipo_documento').value = 'CÉDULA'; // asumiendo siempre cédula

      // Puedes continuar asignando más campos aquí según el ID de cada input
      // document.getElementById('campoX').value = emp.propiedadX;

    } catch (err) {
      console.error('❌ Error al cargar los datos del empleado:', err);
      alert('No se pudo cargar la información del empleado');
    }
  }
});



window.addEventListener('DOMContentLoaded', () => {
  // 📅 Obtener la fecha actual en formato "14 de abril de 2025"
  const hoy = new Date();
  const opcionesFecha = { day: '2-digit', month: 'long', year: 'numeric' };
  const fechaFormateada = hoy.toLocaleDateString('es-ES', opcionesFecha);

  // 🕒 Obtener hora actual en formato "11:03:00 a. m." o "04:25:01 p. m."
  const horaFormateada = hoy.toLocaleTimeString('es-ES', {
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: true
  });

  // 🛠 Rellenar TODOS los campos de fecha (mismo ID, varios inputs)
  document.querySelectorAll('input[id="fecha_elaboracion"]').forEach(input => {
    if (input.value.trim() === '') input.value = fechaFormateada;
  });

  // 🛠 Rellenar TODOS los campos de hora (mismo ID, varios inputs)
  document.querySelectorAll('input[id="hora_actual"]').forEach(input => {
    if (input.value.trim() === '') input.value = horaFormateada;
  });

  // ✅ Autonumerar el campo "Nro. de Documento" si no está llenado aún
  const campoNumeroDoc = document.getElementById('numero_documento');
  if (campoNumeroDoc && campoNumeroDoc.value.trim() === '') {
    let actual = localStorage.getItem('contador_documento') || 1;
    let siguiente = parseInt(actual) + 1;
    const anio = hoy.getFullYear();
    campoNumeroDoc.value = `AP-RH-${siguiente}-${anio}`;
    localStorage.setItem('contador_documento', siguiente);
  }
});
async function exportarPDF() {
  const elemento = document.getElementById("formulario");

  if (!elemento) {
    alert("No se encontró el contenido a exportar.");
    return;
  }

  // Captura el contenido como imagen
  const canvas = await html2canvas(elemento, {
    scale: 2, // Mejor calidad
    useCORS: true
  });

  const imgData = canvas.toDataURL("image/png");

  // Configura el PDF
  const pdf = new jspdf.jsPDF("p", "mm", "a4");
  const pageWidth = pdf.internal.pageSize.getWidth();
  const pageHeight = pdf.internal.pageSize.getHeight();

  const margin = 10;
  const usableWidth = pageWidth - margin * 2;
  const imgHeight = (canvas.height * usableWidth) / canvas.width;

  let position = 0;

  if (imgHeight <= pageHeight - margin * 2) {
    // Si cabe en una página
    pdf.addImage(imgData, "PNG", margin, margin, usableWidth, imgHeight);
  } else {
    // Si necesita más páginas
    let heightLeft = imgHeight;
    let y = margin;

    while (heightLeft > 0) {
      pdf.addImage(imgData, "PNG", margin, y, usableWidth, imgHeight);
      heightLeft -= pageHeight - margin * 2;
      if (heightLeft > 0) {
        pdf.addPage();
        y = -heightLeft + margin;
      }
    }
  }

  pdf.save("accion-personal.pdf");
}