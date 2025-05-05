window.onload = async () => {
  const numeroDocumento = localStorage.getItem("numero_documento");

  if (!numeroDocumento) {
    alert("No se encontró el número de documento en localStorage.");
    return;
  }

  try {
    const res = await fetch(`http://localhost:3000/formulario-vacaciones/${numeroDocumento}`);

    if (!res.ok) {
      throw new Error("No se pudo obtener la información del formulario.");
    }

    const data = await res.json();
    console.log("✅ Datos recibidos del backend:", data);

    // 🧩 Llenar campos del formulario
    document.getElementById("numero_documento").value = data.numero_documento || "";
    document.getElementById("fecha_elaboracion").value = formatFechaInput(data.fecha_generacion);
    document.getElementById("apellidos").value = data.apellidos || "";
    document.getElementById("nombre").value = data.nombres || "";
    document.getElementById("tipo_documento").value = data.tipo_identificacion || "";
    document.getElementById("numero_identificacion").value = data.numero_identificacion || "";
    document.getElementById("fecha_desde").value = data.fecha_desde || "";
    document.getElementById("fecha_hasta").value = data.fecha_hasta || "";
    document.getElementById("fecha_desde_larga").value = formatearFechaLarga(data.fecha_desde);
    document.getElementById("fecha_hasta_larga").value = formatearFechaLarga(data.fecha_hasta);
    document.getElementById("motivacion").value = data.motivacion || "";

    document.getElementById("unidad_organica").value = data.unidad_organica || "";
    document.getElementById("canton").value = data.canton || "";
    document.getElementById("denominacion_puesto").value = data.denominacion_puesto || "";
    document.getElementById("escala_ocupacional").value = data.escala_ocupacional || "";
    document.getElementById("grado").value = data.grado || "";
    document.getElementById("rmu_puesto").value = data.rmu_puesto || "";
    document.getElementById("estructura_programatica").value = data.estructura_programatica || "";

  } catch (err) {
    console.error("❌ Error al cargar los datos del formulario:", err);
    alert("Error al cargar el formulario.");
  }
};

function formatearFechaLarga(fechaStr) {
  if (!fechaStr) return "";
  const fecha = new Date(fechaStr);
  const opciones = { day: '2-digit', month: 'long', year: 'numeric' };
  return fecha.toLocaleDateString('es-ES', opciones);
}

function formatFechaInput(fechaStr) {
  if (!fechaStr) return "";
  return new Date(fechaStr).toISOString().split("T")[0];
}
