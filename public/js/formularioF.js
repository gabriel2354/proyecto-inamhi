document.addEventListener('DOMContentLoaded', async () => {
  const urlParams = new URLSearchParams(window.location.search);
  const cedula = urlParams.get('cedula');

  if (cedula) {
    try {
      const res = await fetch(`http://localhost:3000/empleados/buscar?cedula=${cedula}`);
      if (!res.ok) throw new Error('Empleado no encontrado');
      const emp = await res.json();

      //  Llenar campos del formulario
      document.getElementById('numero_identificacion').value = emp.numero_identificacion || '';
      document.getElementById('nombre').value = emp.nombres || '';
      document.getElementById('apellidos').value = emp.apellidos || '';
      document.getElementById('tipo_documento').value = 'CÉDULA';

      document.getElementById('denominacion_puesto').value = emp.denominacion_puesto || '';
      document.getElementById('canton').value = emp.canton || '';
      document.getElementById('grado').value = emp.grado || '';
      document.getElementById('unidad_organica').value = emp.unidad_organica || '';
      document.getElementById('escala_ocupacional').value = emp.escala_ocupacional || '';


      //  concatenamos estructura programática + partida individual para mostrar en una sola linea 

      const estructura = emp.estructura_programatica || '';
      const partida = emp.partida_individual || '';
      document.getElementById('estructura_programatica').value = `${estructura} - ${partida}`;


      //  Formatear y mostrar RMU en formato moneda USD
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

  // Autoajustar el textarea de motivación si existe
  const textarea = document.getElementById('motivacion');
  if (textarea) {
    textarea.style.height = 'auto';
    textarea.style.height = `${textarea.scrollHeight}px`;
  }
});

window.addEventListener('DOMContentLoaded', () => {
  const hoy = new Date();

  // Fecha
  const opcionesFecha = { day: '2-digit', month: 'long', year: 'numeric' };
  const fechaFormateada = hoy.toLocaleDateString('es-ES', opcionesFecha);

  //  Hora
  const horaFormateada = hoy.toLocaleTimeString('es-ES', {
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: true
  });

  //  Fecha en múltiples inputs
  document.querySelectorAll('input[id="fecha_elaboracion"]').forEach(input => {
    if (input.value.trim() === '') input.value = fechaFormateada;
  });

  //  Hora en múltiples inputs
  document.querySelectorAll('input[id="hora_actual"]').forEach(input => {
    if (input.value.trim() === '') input.value = horaFormateada;
  });

  //  Número de documento autonumérico
  const campoNumeroDoc = document.getElementById('numero_documento');
  if (campoNumeroDoc && campoNumeroDoc.value.trim() === '') {
    let actual = localStorage.getItem('contador_documento') || 1;
    let siguiente = parseInt(actual) + 1;
    const anio = hoy.getFullYear();
    campoNumeroDoc.value = `AP-RH-${siguiente}-${anio}`;
    localStorage.setItem('contador_documento', siguiente);
  }
});


// Exportar a pdf documento Acción de Personal y guardar en BD
async function exportarPDF() {
  document.querySelectorAll('textarea').forEach(textarea => {
    textarea.style.height = 'auto';
    textarea.style.height = `${textarea.scrollHeight}px`;
  });

  const textarea = document.getElementById('motivacion');
  const vista = document.getElementById('motivacionVista');

  if (textarea && vista) {
    vista.innerText = textarea.value;
    textarea.style.display = 'none';
    vista.style.display = 'block';
  }

  await new Promise(resolve => setTimeout(resolve, 300));

  const numeroDocumento = document.getElementById("numero_documento").value;
  const fechaDesde = document.getElementById("fecha_desde").value;
  const fechaHasta = document.getElementById("fecha_hasta").value;
  const motivacion = document.getElementById("motivacion").value;
  const diasLaborales = calcularDiasLaborales(fechaDesde, fechaHasta);
  const diasTomadosProporcionales = parseFloat(convertirALaboralesConFactor(diasLaborales));
  const idColaborador = localStorage.getItem("idColaborador");
  const id_empleado = localStorage.getItem("id_empleado");

  if (!idColaborador || !id_empleado) {
    alert("❌ Faltan datos del usuario o del empleado.");
    return;
  }

  const paginas = document.querySelectorAll('.pagina');
  const pdf = new jspdf.jsPDF("p", "mm", "a4");
  const pageWidth = pdf.internal.pageSize.getWidth();
  const margin = 10;
  const usableWidth = pageWidth - margin * 2;

  for (let i = 0; i < paginas.length; i++) {
    const canvas = await html2canvas(paginas[i], { scale: 3, useCORS: true });
    const imgData = canvas.toDataURL("image/png");
    const imgHeight = (canvas.height * usableWidth) / canvas.width;

    if (i > 0) pdf.addPage();
    pdf.addImage(imgData, "PNG", margin, margin, usableWidth, imgHeight);
  }

  const pdfBlob = pdf.output("blob");
  const formData = new FormData();
  formData.append("numero_documento", numeroDocumento);
  formData.append("id_colaborador", parseInt(idColaborador));
  formData.append("id_empleado", parseInt(id_empleado));
  formData.append("fecha_desde", fechaDesde);
  formData.append("fecha_hasta", fechaHasta);
  formData.append("dias_tomados", diasTomadosProporcionales);
  formData.append("motivacion", motivacion);

  formData.append("archivo_pdf", pdfBlob, "accion-personal.pdf"); // ✅ CORRECTO

  try {
    const res = await fetch("http://localhost:3000/formulario/accion-personal/pdf", {
      method: "POST",
      body: formData
    });

    const result = await res.json();
    if (result.success) {
      pdf.save("accion-personal.pdf");
      alert("✅ Acción guardada y PDF almacenado.");
        // 🔁 Redirigir a empleados.html después del guardado
  window.location.href = "/public/screens/empleados.html";
    } else {
      alert("⚠️ La acción se guardó pero no el PDF.");
    }
  } catch (err) {
    console.error("❌ Error al guardar el PDF:", err);
    alert("❌ Error de red al enviar PDF.");
  }

  if (textarea && vista) {
    textarea.style.display = 'block';
    vista.style.display = 'none';
  }
}



// Convierte la fecha seleccionada en formato largo y oculta el input original
function mostrarFechaLarga(id) {
  const dateInput = document.getElementById(id);
  const displayInput = document.getElementById(id + '_larga');

  if (dateInput.value) {
    const partes = dateInput.value.split("-"); // Divide la fecha en partes [año, mes, día]
    const fecha = new Date(partes[0], partes[1] - 1, partes[2]);

    // Formatea la fecha en formato largo (ej. "22 de abril de 2025")
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


//  Permite volver a editar la fecha haciendo visible el input tipo fecha
function activarFecha(id) {
  const dateInput = document.getElementById(id);
  const displayInput = document.getElementById(id + '_larga');
  dateInput.classList.remove('oculto');
  dateInput.focus();
  displayInput.classList.add('oculto');
}


// ✅ Sincroniza en tiempo real el texto de la motivación con su vista previa
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

//  Calcula los días laborales entre dos fechas (excluye sábados y domingos)

function calcularDiasLaborales(fechaInicio, fechaFin) {
  const inicio = new Date(fechaInicio);
  const fin = new Date(fechaFin);
  let diasLaborales = 0;
  const actual = new Date(inicio);

  while (actual <= fin) {
    const dia = actual.getDay(); // 0 = domingo, 6 = sábado
    if (dia >= 1 && dia <= 5) diasLaborales++; // solo lunes a viernes
    actual.setDate(actual.getDate() + 1);
  }

  return diasLaborales;
}

//  Aplica el factor para convertir a días calendario con precisión

function convertirALaboralesConFactor(diasLaborales) {
  const FACTOR_CALENDARIO = 1.3636; // 1 día laboral = 1.3636 días calendario
  const diasCalendario = diasLaborales * FACTOR_CALENDARIO;
  return diasCalendario.toFixed(2);
}

//  Genera el texto con los días proporcionales

function generarTextoMotivacion(nombreCompleto, fechaDesde, fechaHasta, totalDias) {
  return `La Mgs. Mercy Ivonne Freire Sanchez, Directora de Administración de Talento Humano, en uso de la delegación conferida, mediante Resolución Nro. DEJ-2023-010, de 19 de abril de 2023, conforme al art. 3, literal c): RESUELVE: De conformidad con lo dispuesto en el artículo 29 de la Ley Orgánica del Servicio Público (LOSEP) y artículo 28 de su Reglamento, otorgar ${totalDias} días (calendario) de vacaciones a favor de el/la servidor/ra ${nombreCompleto}. Rige del ${fechaDesde} al ${fechaHasta}.
REFERENCIA: 1) Solicitud aprobada por el Jefe Inmediato; 2) Kardex de vacaciones emitido por el sistema FULLTIME; 3`;
}

//  Actualiza la motivación automáticamente

function actualizarMotivacion() {
  const nombre = document.getElementById('nombre')?.value.trim();
  const apellidos = document.getElementById('apellidos')?.value.trim();
  const fechaDesde = document.getElementById('fecha_desde')?.value;
  const fechaHasta = document.getElementById('fecha_hasta')?.value;

  if (nombre && apellidos && fechaDesde && fechaHasta) {
    const nombreCompleto = `${apellidos.toUpperCase()} ${nombre.toUpperCase()}`;
    const desdeLarga = formatearFecha(fechaDesde);
    const hastaLarga = formatearFecha(fechaHasta);

    const diasLaborales = calcularDiasLaborales(fechaDesde, fechaHasta); 
    const diasCalendario = convertirALaboralesConFactor(diasLaborales);   

    const textoMotivacion = generarTextoMotivacion(
      nombreCompleto,
      desdeLarga,
      hastaLarga,
      diasCalendario
    );

    const motivacion = document.getElementById('motivacion');
    if (!motivacion.dataset.editado) {
      motivacion.value = textoMotivacion;
      sincronizarMotivacion();
    }
  }
}

 