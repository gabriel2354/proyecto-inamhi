// ✅ Importaciones correctas
const express = require('express');
const router = express.Router();
const db = require('../config/database'); // Asegúrate de que esta ruta esté bien

// ✅ Ruta para guardar una acción de personal (vacaciones)
router.post('/accion-personal', async (req, res) => {
  const {
    numero_documento,
    id_colaborador,
    id_empleado,
    fecha_desde,
    fecha_hasta,
    dias_tomados,
    motivacion // 🔥 Aquí ya lo consideramos
  } = req.body;

  try {
    // Validar campos obligatorios
    if (
      !numero_documento || !id_colaborador || !id_empleado ||
      !fecha_desde || !fecha_hasta || dias_tomados == null
    ) {
      return res.status(400).json({ message: 'Faltan datos obligatorios.' });
    }

    // ✅ Incluyendo motivación ahora
    const sql = `
      INSERT INTO accion_personal_vacaciones_pdf (
        numero_documento,
        id_colaborador,
        id_empleado,
        fecha_desde,
        fecha_hasta,
        dias_tomados,
        motivacion
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    `;

    const valores = [
      numero_documento,
      id_colaborador,
      id_empleado,
      fecha_desde,
      fecha_hasta,
      dias_tomados,
      motivacion || null
    ];

    const [result] = await db.execute(sql, valores);

    res.json({
      success: true,
      message: 'Acción de personal guardada correctamente.',
      insertedId: result.insertId
    });
  } catch (error) {
    console.error('Error al guardar acción de personal:', error);
    res.status(500).json({ error: 'Error al guardar la acción de personal.' });
  }
});

// ✅ Ruta para consultar vacaciones
router.get("/accion-personal/vacaciones/:cedula", async (req, res) => {
  const { cedula } = req.params;

  try {
    const [vacaciones] = await db.query(`
      SELECT 
        apv.fecha_desde, 
        apv.fecha_hasta, 
        apv.dias_tomados,
        apv.numero_documento,
        apv.fecha_generacion,
        apv.motivacion
      FROM inamhi.accion_personal_vacaciones_pdf apv
      INNER JOIN inamhi.empleados e ON apv.id_empleado = e.id
      WHERE e.numero_identificacion = ?
      ORDER BY apv.fecha_generacion DESC;
    `, [cedula]);

    if (vacaciones.length === 0) {
      return res.json({ enVacaciones: false });
    }

    const ultimaVacacion = vacaciones[0];

    res.json({
      enVacaciones: true,
      fechaDesde: ultimaVacacion.fecha_desde,
      fechaHasta: ultimaVacacion.fecha_hasta,
      diasTomados: ultimaVacacion.dias_tomados,
      numeroDocumento: ultimaVacacion.numero_documento,
      motivacion: ultimaVacacion.motivacion, // ✅ Opcional mostrar motivación si quieres
      historial: vacaciones.map(vacacion => ({
        numeroDocumento: vacacion.numero_documento,
        fechaGeneracion: vacacion.fecha_generacion
      }))
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error consultando vacaciones." });
  }
});

// ✅ Exportamos correctamente
module.exports = router;
