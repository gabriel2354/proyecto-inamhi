const express = require('express');
const router = express.Router();
const db = require('../config/database');

// 🎯 Ruta para traer todos los datos de acción de personal para vacaciones
router.get('/detalle/:numero_documento', async (req, res) => {
  const { numero_documento } = req.params;

  try {
    const [rows] = await db.query(`
      SELECT 
        apv.numero_documento,
        apv.fecha_desde,
        apv.fecha_hasta,
        apv.fecha_generacion AS fecha_elaboracion,
        apv.motivacion,
        e.tipo_identificacion,
        e.numero_identificacion,
        e.nombres,
        e.apellidos,
        e.unidad_organica,
        e.canton,
        e.denominacion_puesto,
        e.escala_ocupacional,
        e.grado,
        e.rmu_puesto,
        e.estructura_programatica,
        e.partida_individual
      FROM inamhi.accion_personal_vacaciones_pdf apv
      INNER JOIN inamhi.empleados e ON apv.id_empleado = e.id
      WHERE apv.numero_documento = ?
      LIMIT 1;
    `, [numero_documento]);

    if (rows.length === 0) {
      return res.status(404).json({ message: 'Documento no encontrado' });
    }

    res.json(rows[0]);
  } catch (error) {
    console.error('❌ Error consultando detalles:', error);
    res.status(500).json({ message: 'Error interno del servidor' });
  }
});

module.exports = router;
