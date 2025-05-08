// 📌 Configuración de URLs
const API_BASE_URL = 'http://localhost:3000';
const API_ROLES = `${API_BASE_URL}/roles/roles`;
const API_SEDES = `${API_BASE_URL}/sedes`;
const API_USUARIOS = `${API_BASE_URL}/usuarios`;

// 🔹 Cargar datos al cargar la página
document.addEventListener('DOMContentLoaded', async () => {
    console.log("📌 Documento cargado. Iniciando carga de datos...");
    await loadRoles();
    await loadSedes();
    await loadColaboradores();

    document.getElementById("create-user-form").addEventListener("submit", saveColaborador);
});

// 🔹 Cargar Roles
async function loadRoles() {
    try {
        // Realiza la solicitud al backend para obtener los roles
        const response = await fetch(API_ROLES);
        if (!response.ok) throw new Error(`Error al cargar roles: ${response.statusText}`);

        // Convierte la respuesta en JSON
        const roles = await response.json();
        console.log("✅ Roles obtenidos:", roles);
       
        // Verifica que el elemento select exista
        const selectElement = document.getElementById('idRol');
        if (!selectElement) {
            console.error("❌ Elemento select con id 'idRol' no encontrado.");
            return;
        }

        // Limpia las opciones anteriores
        selectElement.innerHTML = '<option value="">Seleccione un rol</option>';

        // Rellena el select con los roles
        roles.forEach(role => {
            const option = document.createElement("option");
            option.value = role.idRol;
            option.textContent = role.nombre;
            selectElement.appendChild(option);
        });
    } catch (error) {
        console.error("❌ Error al cargar roles:", error);
    }
}


// 🔹 Cargar Sedes
async function loadSedes() {
    try {
        const response = await fetch(API_SEDES);
        if (!response.ok) throw new Error("Error al cargar sedes.");

        const sedes = await response.json();
        console.log("✅ Sedes obtenidas:", sedes);

        const selectElement = document.getElementById('idSede');
        selectElement.innerHTML = '<option value="">Seleccione una sede</option>';
        sedes.forEach(sede => {
            const option = document.createElement("option");
            option.value = sede.idSede;
            option.textContent = sede.nombre;
            selectElement.appendChild(option);
        });
    } catch (error) {
        console.error("❌ Error al cargar sedes:", error);
    }
}

// 🔹 Cargar Colaboradores
async function loadColaboradores() {
    try {
        const response = await fetch(`${API_USUARIOS}/colaboradores`);
        if (!response.ok) throw new Error("Error al cargar colaboradores.");

        const colaboradores = await response.json();
        console.log("✅ Colaboradores obtenidos:", colaboradores);

        const tableBody = document.getElementById("colaboradores-table-body");
        tableBody.innerHTML = colaboradores.map(colaborador => `
            <tr id="row-${colaborador.idColaborador}">
                <td>${colaborador.nombres}</td>
                <td>${colaborador.apellidos}</td>
                <td>${colaborador.identificacion}</td>
                <td>${colaborador.email}</td>
                <td>${colaborador.usuario}</td>
                <td>${colaborador.cargo}</td>
                <td>${colaborador.rol}</td>
                <td>${colaborador.sede}</td>
                <td>
                    <button onclick="editColaborador(${colaborador.idColaborador})">✏️ Editar</button>
                    <button onclick="deleteColaborador(${colaborador.idColaborador})">🗑️ Eliminar</button>
                </td>
            </tr>
        `).join('');
    } catch (error) {
        console.error("❌ Error al cargar colaboradores:", error);
    }
}

// 🔹 Crear o Editar Colaborador
async function saveColaborador(event) {
    event.preventDefault();

    const form = document.getElementById("create-user-form");
    const id = form.getAttribute("data-editing-id");
    const nombres = document.getElementById("nombres").value;
    const apellidos = document.getElementById("apellidos").value;
    const identificacion = document.getElementById("identificacion").value;
    const email = document.getElementById("email").value;
    const usuario = document.getElementById("usuario").value;
    const cargo = document.getElementById("cargo").value;
    const idRol = document.getElementById("idRol").value;
    const idSede = document.getElementById("idSede").value;
    const password = document.getElementById("password").value;

    try {
        const method = id ? "PUT" : "POST";
        const endpoint = id ? `${API_USUARIOS}/colaborador/${id}` : `${API_USUARIOS}/createColaborador`;
        
        const data = { nombres, apellidos, identificacion, email, usuario, cargo, idRol, idSede };
        if (!id) data.password = password;

        const response = await fetch(endpoint, {
            method,
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        });

        const result = await response.json();
        if (!response.ok) throw new Error(result.message || "Error desconocido");

        alert(id ? "✅ Colaborador actualizado correctamente." : "✅ Colaborador creado correctamente.");
        form.reset();
        form.removeAttribute("data-editing-id");
        await loadColaboradores();
    } catch (error) {
        console.error("❌ Error al guardar colaborador:", error);
        alert(`❌ ${error.message}`);
    }
}

// 🔹 Editar Colaborador
async function editColaborador(id) {
    try {
        const response = await fetch(`${API_USUARIOS}/colaborador/${id}`);
        if (!response.ok) throw new Error("Error al obtener datos del colaborador.");

        const colaborador = await response.json();
        console.log("📝 Datos del colaborador a editar:", colaborador);

        document.getElementById("nombres").value = colaborador.nombres;
        document.getElementById("apellidos").value = colaborador.apellidos;
        document.getElementById("identificacion").value = colaborador.identificacion;
        document.getElementById("email").value = colaborador.email;
        document.getElementById("usuario").value = colaborador.usuario;
        document.getElementById("cargo").value = colaborador.cargo;
        document.getElementById("idRol").value = colaborador.idRol;
        document.getElementById("idSede").value = colaborador.idSede;

        document.getElementById("create-user-form").setAttribute("data-editing-id", id);
    } catch (error) {
        console.error("❌ Error al obtener datos del colaborador:", error);
        alert("Error al obtener datos del colaborador.");
    }
}

// 🔹 Eliminar Colaborador
async function deleteColaborador(id) {
    try {
        const confirmDelete = confirm("¿Estás seguro de que deseas eliminar este colaborador?");
        if (!confirmDelete) return;

        const response = await fetch(`${API_USUARIOS}/colaborador/${id}`, { method: "DELETE" });
        if (!response.ok) throw new Error("Error al eliminar colaborador.");

        alert("✅ Colaborador eliminado correctamente.");
        await loadColaboradores();
    } catch (error) {
        console.error("❌ Error al eliminar colaborador:", error);
        alert("Error al eliminar colaborador.");
    }
}
// Mostrar el nombre del usuario logueado
const generadoPor = localStorage.getItem("userName") || "usuario desconocido";
const userName = localStorage.getItem("userName") || "Usuario";
const userNameElement = document.getElementById("userName");
if (userNameElement) {
  userNameElement.textContent = userName;
}

window.editColaborador = editColaborador;
window.deleteColaborador = deleteColaborador;
