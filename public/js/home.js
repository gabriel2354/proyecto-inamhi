document.addEventListener("DOMContentLoaded", () => {
  // Mostrar/ocultar los dropdowns de la barra lateral
  document.querySelectorAll('.dropdown-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      btn.classList.toggle('active');
      const dropdown = btn.nextElementSibling;
      dropdown.classList.toggle('hidden'); // Tailwind "hidden"
    });
  });

  // Obtener el id del colaborador logueado desde el localStorage
  const idColaborador = localStorage.getItem("idColaborador");
  if (!idColaborador) {
    console.warn("⚠️ No se encontró idColaborador en localStorage. Redirigiendo a login...");
    window.location.href = "index.html"; // Redirigir si no está logueado
    return;
  } else {
    console.log("✅ idColaborador del usuario logueado:", idColaborador);
    const idColaboradorField = document.getElementById("idColaborador");
    if (idColaboradorField) {
      idColaboradorField.value = idColaborador;
    }
  }

  // Mostrar el nombre del usuario logueado
  const userName = localStorage.getItem("userName") || "Usuario";
  const userNameElement = document.getElementById("userName");
  if (userNameElement) {
    userNameElement.textContent = userName;
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
});
