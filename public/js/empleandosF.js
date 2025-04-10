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

function buscarEmpleado() {
  const cedula = document.getElementById('buscarCedula').value.trim();
  if (!cedula) return cargarEmpleados();

  fetch(`${API_URL}/buscar?cedula=${cedula}`)
    .then(res => res.ok ? res.json() : Promise.reject())
    .then(data => renderTabla([data]))
    .catch(() => {
      alert('Empleado no encontrado');
      renderTabla([]);
    });
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
      <td class="p-2 border">${emp.apellidos}</td> <!-- NUEVO -->
      <td class="p-2 border">${emp.numero_identificacion}</td>
      <td class="p-2 border">${emp.regimen_laboral || ''}</td>
      <td class="p-2 border">${emp.nivel_ocupacional || ''}</td>
      <td class="p-2 border">${emp.denominacion_puesto || ''}</td>
      <td class="p-2 border">${emp.unidad_organica || ''}</td>
      <td class="p-2 border">${emp.escala_ocupacional || ''}</td>
      <td class="p-2 border">${emp.grado || ''}</td>
      <td class="p-2 border">${emp.estructura_programatica || ''}</td>
      <td class="p-2 border">${emp.canton || ''}</td>
      <td class="p-2 border">$${parseFloat(emp.rmu_puesto || 0).toFixed(2)}</td>
      <td class="p-2 border">${emp.estado_puesto || ''}</td>
      <td class="p-2 border text-center">
        <button onclick="editarEmpleado('${emp.numero_identificacion}')" class="text-blue-600 hover:underline mr-2">Editar</button>
        <button onclick="eliminarEmpleado('${emp.numero_identificacion}')" class="text-red-600 hover:underline">Eliminar</button>
        <button onclick="accionPersonal('${emp.numero_identificacion}')" class="text-green-600 hover:underline">Acción Personal</button>
      </td>
    `;
    tabla.appendChild(fila);
  });
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
  const apellidos = prompt("Apellidos:", data.apellidos || ""); // NUEVO
  const estado_puesto = prompt("Estado del puesto:", data.estado_puesto || "");
  const unidad_organica = prompt("Unidad orgánica:", data.unidad_organica || "");
  const canton = prompt("Cantón:", data.canton || "");
  const grado = prompt("Grado:", data.grado || "");
  const rmu_puesto = prompt("RMU del puesto:", data.rmu_puesto || "");

  if (!cedula || !nombres || !apellidos) {
    alert("Cédula, nombres y apellidos son obligatorios.");
    return;
  }

  const payload = {
    numero_identificacion: cedula,
    nombres,
    apellidos, // NUEVO
    estado_puesto,
    unidad_organica,
    canton,
    grado,
    rmu_puesto
  };

  const metodo = modo === 'agregar' ? 'POST' : 'PUT';
  const url = modo === 'agregar' ? `${API_URL}/crear` : `${API_URL}/editar/${cedula}`;

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

// --- Interfaz UI y autenticación (sin cambios) ---
document.querySelectorAll('.dropdown-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    btn.classList.toggle('active');
    const dropdown = btn.nextElementSibling;
    dropdown.classList.toggle('hidden');
  });
});

const userDropdownBtn = document.getElementById("userDropdownBtn");
const userDropdownMenu = document.getElementById("userDropdownMenu");

userDropdownBtn?.addEventListener("click", () => {
  userDropdownMenu.classList.toggle("hidden");
});

window.addEventListener("click", (e) => {
  if (!userDropdownBtn.contains(e.target) && !userDropdownMenu.contains(e.target)) {
    userDropdownMenu.classList.add("hidden");
  }
});

document.addEventListener("DOMContentLoaded", () => {
  const idColaborador = localStorage.getItem("idColaborador");
  if (!idColaborador) {
    console.warn("⚠️ No se encontró idColaborador en localStorage. Asegúrate de estar logueado.");
    return;
  }

  console.log("✅ idColaborador del usuario logueado:", idColaborador);
  const idColaboradorField = document.getElementById("idColaborador");
  if (idColaboradorField) idColaboradorField.value = idColaborador;

  const userName = localStorage.getItem("userName") || "Usuario";
  const userNameElement = document.getElementById("userName");
  if (userNameElement) userNameElement.textContent = userName;

  const dropdownBtns = document.querySelectorAll('.dropdown-btn');
  dropdownBtns.forEach((btn) => {
    btn.addEventListener('click', function () {
      const container = this.nextElementSibling;
      if (container) container.classList.toggle('show');
    });
  });

  const logoutBtn = document.getElementById("cerrarSesionBtn");
  if (logoutBtn) {
    logoutBtn.addEventListener("click", () => {
      localStorage.clear();
      sessionStorage.clear();
      window.location.href = "index.html";
    });
  }
});
function accionPersonal(cedula) {
  fetch(`${API_URL}/buscar?cedula=${cedula}`)
    .then(res => res.json())
    .then(emp => {
      document.getElementById('numero_identificacion_pdf').value = emp.numero_identificacion;
      document.getElementById('nombres_pdf').value = emp.nombres;
      document.getElementById('apellidos_pdf').value = emp.apellidos;
      document.getElementById('modalAccionPersonal').classList.remove('hidden');
    })
    .catch(() => alert('No se pudo cargar el empleado'));
}

function cerrarModal() {
  document.getElementById('modalAccionPersonal').classList.add('hidden');
}

// Manejo del formulario PDF
document.getElementById('pdfForm').addEventListener('submit', async (e) => {
  e.preventDefault();
  const formData = new FormData(e.target);

  try {
    const res = await fetch('http://localhost:3000/subir-pdf/pdf', {
      method: 'POST',
      body: formData
    });

    if (!res.ok) throw new Error();
    const blob = await res.blob();
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'accion-personal.pdf';
    link.click();

    cerrarModal();
  } catch (err) {
    alert('❌ Error al generar el PDF.');
  }
});

