// frontend-empleados.js
const API_URL = 'http://localhost:3000/empleados';

window.onload = () => {
  console.log("🔥 JS cargado correctamente");
  cargarEmpleados();

  const btnAgregar = document.getElementById('btnAgregarEmpleado');
  if (btnAgregar) {
    btnAgregar.addEventListener('click', () => abrirFormulario('agregar'));
  }
};

function cargarEmpleados() {
  fetch(`${API_URL}/listar`)
    .then(res => res.json())
    .then(data => {
      console.log("📦 Empleados cargados:", data);
      renderTabla(data);
    })
    .catch(err => console.error('Error al cargar empleados:', err));
}

async function buscarEmpleado() {
  const cedula = document.getElementById('buscarCedula').value.trim();
  if (!cedula) return cargarEmpleados();

  try {
    const res = await fetch(`${API_URL}/buscar?cedula=${cedula}`);
    if (!res.ok) throw new Error('Empleado no encontrado');

    const data = await res.json();
    renderTabla([data]);

    // 💥 Además consultamos si está de vacaciones
    await consultarVacaciones(cedula);

  } catch (error) {
    alert('Empleado no encontrado');
    renderTabla([]);
  }
}

function renderTabla(lista) {
  const tabla = document.getElementById('tabla-empleados');
  tabla.innerHTML = '';
  lista.forEach((emp, i) => {
    const fila = document.createElement('tr');
    fila.classList.add('border-b', 'hover:bg-gray-100');
    fila.innerHTML = `
      <td class="p-2 border text-center">${i + 1}</td>
      <td class="p-2 border">${emp.nombres}</td>
      <td class="p-2 border">${emp.apellidos}</td>
      <td class="p-2 border">${emp.numero_identificacion}</td>
      <td class="p-2 border">${emp.regimen_laboral || ''}</td>
      <td class="p-2 border">${emp.nivel_ocupacional || ''}</td>
      <td class="p-2 border">${emp.denominacion_puesto || ''}</td>
      <td class="p-2 border">${emp.unidad_organica || ''}</td>
      <td class="p-2 border">${emp.escala_ocupacional || ''}</td>
      <td class="p-2 border">${emp.grado || ''}</td>
      <td class="p-2 border">
        <span class="font-mono text-xs">${emp.estructura_programatica || ''}</span>
        <span class="font-semibold"> - ${emp.partida_individual || ''}</span>
      </td>
      <td class="p-2 border">${emp.canton || ''}</td>
      <td class="p-2 border">$${parseFloat(emp.rmu_puesto || 0).toFixed(2)}</td>
      <td class="p-2 border">${emp.estado_puesto || ''}</td>
      <td class="p-2 border text-center">
        <button onclick="editarEmpleado('${emp.numero_identificacion}')" class="text-blue-600 hover:underline mr-2">Editar</button>
        <button onclick="eliminarEmpleado('${emp.numero_identificacion}')" class="text-red-600 hover:underline">Eliminar</button>
        <button onclick="accionPersonal('${emp.numero_identificacion}', ${emp.id_empleado})" class="text-green-600 hover:underline">Acción Personal</button>
      </td>
    `;
    tabla.appendChild(fila);
  });
}

function accionPersonal(numeroIdentificacion, idEmpleado) {
  localStorage.setItem("id_empleado", idEmpleado);
  window.location.href = `formulario1.html?cedula=${numeroIdentificacion}`;
}

function eliminarEmpleado(cedula) {
  if (confirm('¿Confirma eliminar al empleado?')) {
    fetch(`${API_URL}/eliminar/${cedula}`, { method: 'DELETE' })
      .then(res => {
        if (res.ok) {
          alert('Empleado eliminado correctamente');
          cargarEmpleados();
        } else {
          alert('No se pudo eliminar');
        }
      })
      .catch(err => console.error('Error al eliminar:', err));
  }
}

function abrirFormulario(modo, data = {}) {
  const cedula = prompt("Número de identificación:", data.numero_identificacion || "");
  const nombres = prompt("Nombres:", data.nombres || "");
  const apellidos = prompt("Apellidos:", data.apellidos || "");
  const estado_puesto = prompt("Estado del puesto:", data.estado_puesto || "");
  const unidad_organica = prompt("Unidad orgánica:", data.unidad_organica || "");
  const canton = prompt("Cantón:", data.canton || "");
  const grado = prompt("Grado:", data.grado || "");
  const rmu_puesto = prompt("RMU del puesto:", data.rmu_puesto || "");
  const partida_individual = prompt("Partida individual:", data.partida_individual || "");

  if (!cedula || !nombres || !apellidos) {
    alert("Cédula, nombres y apellidos son obligatorios.");
    return;
  }

  const payload = {
    numero_identificacion: cedula,
    nombres,
    apellidos,
    estado_puesto,
    unidad_organica,
    canton,
    grado,
    rmu_puesto,
    partida_individual
  };

  const metodo = modo === 'agregar' ? 'POST' : 'PUT';
  const url = modo === 'agregar'
    ? `${API_URL}/crear`
    : `${API_URL}/editar/${cedula}`;

  fetch(url, {
    method: metodo,
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(payload)
  })
    .then(res => {
      if (res.ok) {
        alert(modo === 'agregar' ? 'Empleado agregado' : 'Empleado actualizado');
        cargarEmpleados();
      } else {
        alert('Error al guardar');
      }
    })
    .catch(err => console.error('Error al guardar empleado:', err));
}

function editarEmpleado(cedula) {
  fetch(`${API_URL}/buscar?cedula=${cedula}`)
    .then(res => res.json())
    .then(data => abrirFormulario('editar', data))
    .catch(() => alert('No se pudo cargar el empleado'));
}

// Dropdowns barra lateral
document.querySelectorAll('.dropdown-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    btn.classList.toggle('active');
    const dropdown = btn.nextElementSibling;
    dropdown.classList.toggle('hidden');
  });
});

// Mostrar el nombre del usuario logueado
const generadoPor = localStorage.getItem("userName") || "usuario desconocido";
const userName = localStorage.getItem("userName") || "Usuario";
const userNameElement = document.getElementById("userName");
if (userNameElement) {
  userNameElement.textContent = userName;
}

// 1. Función para mostrar el modal
function mostrarModal(mensaje, tipo = "info") {
  const modal = document.getElementById('miModal');
  const modalContent = document.getElementById('modal-content');

  if (!modal || !modalContent) {
    console.error("❌ Modal no encontrado en el HTML.");
    return;
  }

  const modalBox = modal.querySelector('div');

  if (tipo === "success") {
    modalBox.style.backgroundColor = "#e6ffed"; // verde
    modalBox.style.border = "2px solid #2ecc71";
  } else if (tipo === "info") {
    modalBox.style.backgroundColor = "#ebf5ff"; // azul
    modalBox.style.border = "2px solid #3498db";
  } else if (tipo === "error") {
    modalBox.style.backgroundColor = "#ffe6e6"; // rojo
    modalBox.style.border = "2px solid #e74c3c";
  } else {
    modalBox.style.backgroundColor = "white";
    modalBox.style.border = "none";
  }

  modalContent.innerHTML = mensaje;
  modal.style.display = "block";
}

function verFormularioVacaciones(numeroDocumento) {
  // Guardamos el número de documento en el localStorage
  localStorage.setItem("numero_documento", numeroDocumento);

  // Redirigimos a la página que quieres
  window.location.href = "/public/screens/formularioVacaciones.html";
}

// 2. Función para cerrar el modal
function cerrarModal() {
  const modal = document.getElementById('miModal');
  if (modal) modal.style.display = "none";
}

// 3. Función para formatear la fecha bonito tipo "28 de abril de 2025"
function formatearFechaLarga(fechaStr) {
  const fecha = new Date(fechaStr);
  const opciones = { day: '2-digit', month: 'long', year: 'numeric' };
  return fecha.toLocaleDateString('es-ES', opciones);
}

async function consultarVacaciones(cedula) {
  try {
    const res = await fetch(`http://localhost:3000/formulario/accion-personal/vacaciones/${cedula}`);

    if (!res.ok) {
      throw new Error("Servidor no respondió correctamente.");
    }

    const data = await res.json();

    if (!data || !data.enVacaciones) {
      mostrarModal("🔍 El empleado NO tiene vacaciones registradas.", "info");
    } else {
      const hoy = new Date();
      const desde = new Date(data.fechaDesde);
      const hasta = new Date(data.fechaHasta);

      let estado = "";

      if (hoy < desde) {
        estado = "🔜 El empleado tiene vacaciones programadas.";
      } else if (hoy >= desde && hoy <= hasta) {
        estado = "🌴 El empleado está actualmente de vacaciones.";
      } else {
        estado = "✅ El empleado ya culminó sus vacaciones recientes.";
      }

      // 🔥 Modificamos aquí el historial para incluir el botón "Ver Formulario"
      let historialHTML = "";
      if (data.historial && data.historial.length > 0) {
        historialHTML = `
          <br><br>
          📋 <strong>Historial de documentos generados:</strong><br>
          <ul style="margin-top:8px; padding-left:20px;">
            ${data.historial.map(doc => `
              <li style="margin-bottom:10px;">
                ➔ <strong>${doc.numeroDocumento}</strong> - ${formatearFechaLarga(doc.fechaGeneracion)}
                <button onclick="verFormularioVacaciones('${doc.numeroDocumento}')" style="margin-left:10px; background-color:#3498db; color:white; border:none; padding:4px 8px; border-radius:4px; cursor:pointer;">
                  visualizar acción
                </button>
                <span style="margin-left:8px; font-style:italic; color:#555;"> Documento generado por: <strong>${doc.generadoPor}</strong></span>
              </li>
            `).join("")}
          </ul>
        `;
      }


      mostrarModal(`
        ${estado}<br><br>
        ➔ Documento: <strong>${data.numeroDocumento}</strong><br>
        ➔ Desde: <strong>${formatearFechaLarga(data.fechaDesde)}</strong><br>
        ➔ Hasta: <strong>${formatearFechaLarga(data.fechaHasta)}</strong><br>
        ➔ Días tomados: <strong>${data.diasTomados}</strong> Días calendario.
        ${historialHTML}
             `, "success");
    }
  } catch (error) {
    console.error("❌ Error al consultar vacaciones:", error);
    mostrarModal("❌ No se pudo conectar con el servidor. Intenta más tarde.", "error");
  }
}

 // Acción de cerrar sesión
  const logoutBtn = document.getElementById("cerrarSesionBtn");
  if (logoutBtn) {
    logoutBtn.addEventListener("click", () => {
      localStorage.clear();
      sessionStorage.clear();
      window.location.href = "index.html";
    });
  }






