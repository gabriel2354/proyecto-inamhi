const express = require('express');
const router = express.Router();
const db = require('../config/database');
const multer = require('multer');

// 📂 Configuración de multer en memoria
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

// ✅ Guardar PDF y datos
router.post('/accion-personal/pdf', upload.single('archivo_pdf'), async (req, res) => {
  try {
    const {
      numero_documento,
      id_colaborador,
      id_empleado,
      fecha_desde,
      fecha_hasta,
      dias_tomados,
      motivacion
    } = req.body;

    if (!numero_documento || !id_colaborador || !id_empleado || !fecha_desde || !fecha_hasta || dias_tomados == null || !req.file) {
      return res.status(400).json({ message: 'Faltan datos o archivo PDF.' });
    }

    const archivoPDF = req.file.buffer;

    const sql = `
      INSERT INTO accion_personal_vacaciones_pdf (
        numero_documento,
        id_colaborador,
        id_empleado,
        fecha_desde,
        fecha_hasta,
        dias_tomados,
        motivacion,
        archivo_pdf
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const valores = [
      numero_documento,
      parseInt(id_colaborador),
      parseInt(id_empleado),
      fecha_desde,
      fecha_hasta,
      dias_tomados,
      motivacion,
      archivoPDF
    ];

    const [result] = await db.execute(sql, valores);

    res.json({
      success: true,
      message: '✅ Acción y PDF guardados correctamente.',
      insertedId: result.insertId
    });

  } catch (error) {
    console.error("❌ Error al guardar acción y PDF:", error);
    res.status(500).json({ message: 'Error al guardar acción y PDF.' });
  }
});

// ✅ Consultar historial de vacaciones con nombre del colaborador
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
        apv.motivacion,
        c.nombres AS nombres_colaborador,
        c.apellidos AS apellidos_colaborador
      FROM accion_personal_vacaciones_pdf apv
      INNER JOIN empleados e ON apv.id_empleado = e.id
      INNER JOIN colaborador c ON apv.id_colaborador = c.idColaborador
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
      motivacion: ultimaVacacion.motivacion,
      historial: vacaciones.map(v => ({
        numeroDocumento: v.numero_documento,
        fechaGeneracion: v.fecha_generacion,
        generadoPor: `${v.nombres_colaborador} ${v.apellidos_colaborador}`
      }))
    });

  } catch (error) {
    console.error("❌ Error al consultar vacaciones:", error);
    res.status(500).json({ message: "Error consultando vacaciones." });
  }
});

// ✅ Obtener PDF generado
router.get("/accion-personal/pdf/:numeroDocumento", async (req, res) => {
  const { numeroDocumento } = req.params;

  try {
    const [result] = await db.query(`
      SELECT archivo_pdf 
      FROM accion_personal_vacaciones_pdf 
      WHERE numero_documento = ?
    `, [numeroDocumento]);

    if (result.length === 0 || !result[0].archivo_pdf) {
      return res.status(404).send("PDF no encontrado.");
    }

    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', `inline; filename="${numeroDocumento}.pdf"`);
    res.send(result[0].archivo_pdf);
  } catch (error) {
    console.error("❌ Error al obtener el PDF:", error);
    res.status(500).send("Error al obtener el PDF.");
  }
});

module.exports = router;
