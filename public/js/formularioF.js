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
      document.getElementById('tipo_documento').value = 'CÉDULA';

      // Nuevos campos a completar
      document.getElementById('denominacion_puesto').value = emp.denominacion_puesto || '';
      document.getElementById('canton').value = emp.canton || '';
      document.getElementById('estructura_programatica').value = emp.estructura_programatica || '';
      document.getElementById('grado').value = emp.grado || '';
      document.getElementById('unidad_organica').value = emp.unidad_organica || '';
      document.getElementById('escala_ocupacional').value = emp.escala_ocupacional || '';

      // 🟢 Formatear y mostrar RMU en formato moneda USD
      const rmu = parseFloat(emp.rmu_puesto || 0);
      document.getElementById('rmu_puesto').value = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 2
      }).format(rmu);

    } catch (err) {
      console.error('❌ Error al cargar los datos del empleado:', err);
      alert('No se pudo cargar la información del empleado');
    }
  }

  // ✅ Autoajustar el textarea de motivación si existe
  const textarea = document.getElementById('motivacion');
  if (textarea) {
    textarea.style.height = 'auto';
    textarea.style.height = `${textarea.scrollHeight}px`;
  }
});

window.addEventListener('DOMContentLoaded', () => {
  const hoy = new Date();

  // 📅 Fecha
  const opcionesFecha = { day: '2-digit', month: 'long', year: 'numeric' };
  const fechaFormateada = hoy.toLocaleDateString('es-ES', opcionesFecha);

  // 🕒 Hora
  const horaFormateada = hoy.toLocaleTimeString('es-ES', {
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: true
  });

  // 🛠 Fecha en múltiples inputs
  document.querySelectorAll('input[id="fecha_elaboracion"]').forEach(input => {
    if (input.value.trim() === '') input.value = fechaFormateada;
  });

  // 🛠 Hora en múltiples inputs
  document.querySelectorAll('input[id="hora_actual"]').forEach(input => {
    if (input.value.trim() === '') input.value = horaFormateada;
  });

  // ✅ Número de documento autonumérico
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
  // 🔁 Asegura que todos los textareas se ajusten antes de exportar
// Ajustar altura automáticamente al escribir
document.addEventListener('input', (e) => {
  if (e.target.tagName.toLowerCase() === 'textarea') {
    e.target.style.height = 'auto';
    e.target.style.height = `${e.target.scrollHeight}px`;
  }
});

// También ajusta al cargar
window.addEventListener('DOMContentLoaded', () => {
  const textarea = document.getElementById('motivacion');
  if (textarea) {
    textarea.style.height = 'auto';
    textarea.style.height = `${textarea.scrollHeight}px`;
  }
});


  const paginas = document.querySelectorAll('.pagina');
  const pdf = new jspdf.jsPDF("p", "mm", "a4");
  const pageWidth = pdf.internal.pageSize.getWidth();
  const margin = 10;
  const usableWidth = pageWidth - margin * 2;

  for (let i = 0; i < paginas.length; i++) {
    const pagina = paginas[i];

    const canvas = await html2canvas(pagina, {
      scale: 3,
      useCORS: true
    });

    const imgData = canvas.toDataURL("image/png");
    const imgHeight = (canvas.height * usableWidth) / canvas.width;

    if (i > 0) pdf.addPage();
    pdf.addImage(imgData, "PNG", margin, margin, usableWidth, imgHeight);
  }

  pdf.save("accion-personal.pdf");
}



//  FECHA  CON FORMATO  30 DE ENERO DE 2025
function mostrarFechaLarga(id) {
  const dateInput = document.getElementById(id);
  const displayInput = document.getElementById(id + '_larga');

  if (dateInput.value) {
   // Descomponer manualmente para evitar error de zona horaria
    const partes = dateInput.value.split("-");
    const fecha = new Date(partes[0], partes[1] - 1, partes[2]); // Año, mes (0 indexado), día

    const formateada = fecha.toLocaleDateString('es-ES', {
      day: '2-digit',
      month: 'long',
      year: 'numeric'
    });

    displayInput.value = formateada;
    dateInput.classList.add('oculto');
    displayInput.classList.remove('oculto');
  }
}

function activarFecha(id) {
  const dateInput = document.getElementById(id);
  const displayInput = document.getElementById(id + '_larga');
  dateInput.classList.remove('oculto');
  dateInput.focus();
  displayInput.classList.add('oculto');
}

