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
  // 🔄 Ajustar altura de todos los textareas (por si hay otros también)
  document.querySelectorAll('textarea').forEach(textarea => {
    textarea.style.height = 'auto';
    textarea.style.height = `${textarea.scrollHeight}px`;
  });

  // ✅ Sincronizar el contenido del textarea al div visible para PDF
  const textarea = document.getElementById('motivacion');
  const vista = document.getElementById('motivacionVista');

  if (textarea && vista) {
    vista.innerText = textarea.value;

    // Mostrar el div y ocultar el textarea
    textarea.style.display = 'none';
    vista.style.display = 'block';
  }

  // 🔄 Pequeño delay para asegurar que DOM se actualice
  await new Promise(resolve => setTimeout(resolve, 300));

  // 📄 Generar PDF desde todas las páginas visibles
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

  // ♻️ Restaurar estado: mostrar el textarea de nuevo
  if (textarea && vista) {
    textarea.style.display = 'block';
    vista.style.display = 'none';
  }
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

function sincronizarMotivacion() {
  const valor = document.getElementById('motivacion').value;
  document.getElementById('motivacionVista').innerText = valor;
}

function formatearFecha(fecha) {
  const partes = fecha.split("-");
  const fechaObj = new Date(partes[0], partes[1] - 1, partes[2]);
  return fechaObj.toLocaleDateString('es-ES', {
    day: '2-digit',
    month: 'long',
    year: 'numeric'
  });
}

function sincronizarMotivacion() {
  const valor = document.getElementById('motivacion').value;
  document.getElementById('motivacionVista').innerText = valor;
}

function formatearFecha(fecha) {
  const partes = fecha.split("-");
  const fechaObj = new Date(partes[0], partes[1] - 1, partes[2]);
  return fechaObj.toLocaleDateString('es-ES', {
    day: '2-digit',
    month: 'long',
    year: 'numeric'
  });
}

function calcularDiasCalendario(fechaInicio, fechaFin) {
  const inicio = new Date(fechaInicio);
  const fin = new Date(fechaFin);
  const diferenciaEnMs = fin - inicio;
  const dias = diferenciaEnMs / (1000 * 60 * 60 * 24) + 1;
  return dias.toFixed(2);
}

function generarTextoMotivacion(nombreCompleto, fechaDesde, fechaHasta, totalDias) {
  return `La Mgs. Mercy Ivonne Freire Sanchez, Directora de Administración de Talento Humano, en uso de la delegación conferida, mediante Resolución Nro. DEJ-2023-010, de 19 de abril de 2023, conforme al art. 3, literal c): RESUELVE: De conformidad con lo dispuesto en el artículo 29 de la Ley Orgánica del Servicio Público (LOSEP) y artículo 28 de su Reglamento, otorgar ${totalDias} días (calendario) de vacaciones a favor de el/la servidor/ra ${nombreCompleto}. Rige del ${fechaDesde} al ${fechaHasta}.
REFERENCIA: 1) Solicitud aprobada por el Jefe Inmediato; 2) Kardex de vacaciones emitido por el sistema FULLTIME; 3)`;
}

function actualizarMotivacion() {
  const nombre = document.getElementById('nombre')?.value.trim();
  const apellidos = document.getElementById('apellidos')?.value.trim();
  const fechaDesde = document.getElementById('fecha_desde')?.value;
  const fechaHasta = document.getElementById('fecha_hasta')?.value;

  if (nombre && apellidos && fechaDesde && fechaHasta) {
    const nombreCompleto = `${apellidos.toUpperCase()} ${nombre.toUpperCase()}`;
    const desdeLarga = formatearFecha(fechaDesde);
    const hastaLarga = formatearFecha(fechaHasta);
    const dias = calcularDiasCalendario(fechaDesde, fechaHasta);

    const textoMotivacion = generarTextoMotivacion(nombreCompleto, desdeLarga, hastaLarga, dias);
    
    const motivacion = document.getElementById('motivacion');
    
    // Solo sobreescribe si el usuario no ha cambiado nada
    if (!motivacion.dataset.editado) {
      motivacion.value = textoMotivacion;
      sincronizarMotivacion();
    }
  }
}

// Detectar si el usuario ha modificado manualmente el texto
document.getElementById('motivacion').addEventListener('input', () => {
  document.getElementById('motivacion').dataset.editado = 'true';
  sincronizarMotivacion();
});
