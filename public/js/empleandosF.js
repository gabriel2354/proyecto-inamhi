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
        <button onclick="accionPersonal('${emp.numero_identificacion}')" class="text-green-600 hover:underline">Acción Personal</button>
      </td>
    `;
    tabla.appendChild(fila);
  });
}

function accionPersonal(numeroIdentificacion) {
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

  // Mostrar/ocultar los dropdowns de la barra lateral
  document.querySelectorAll('.dropdown-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      btn.classList.toggle('active');
      const dropdown = btn.nextElementSibling;
      dropdown.classList.toggle('hidden'); // Tailwind "hidden"
    });
  });
