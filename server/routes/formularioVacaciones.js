const express = require('express');
const router = express.Router();
const db = require('../config/database');

// Ruta GET para obtener los datos de un documento específico
router.get('/:numeroDocumento', (req, res) => {
  const numeroDocumento = req.params.numeroDocumento;
  console.log(`📥 Consulta recibida para documento: ${numeroDocumento}`);

  const query = `
    SELECT
      e.nombres,
      e.apellidos,
      e.tipo_identificacion,
      e.numero_identificacion,
      e.unidad_organica,
      e.canton,
      ep.nombre AS denominacion_puesto,
      eo.nombre AS escala_ocupacional,
      e.grado,
      e.rmu_puesto,
      epg.codigo_enlace AS estructura_programatica,
      apv.numero_documento,
      apv.fecha_desde,
      apv.fecha_hasta,
      apv.motivacion,
      apv.fecha_generacion
    FROM empleados e
    JOIN accion_personal_vacaciones_pdf apv ON apv.id_empleado = e.id
    JOIN denominacion_puesto ep ON ep.codigo_denom = e.codigo_denom
    JOIN escala_ocupacional eo ON eo.codigo_escala = e.codigo_escala
    JOIN estructura_programatica epg ON epg.codigo_enlace = e.codigo_enlace
    WHERE apv.numero_documento = ?
  `;

  db.query(query, [numeroDocumento], (err, results) => {
    if (err) {
      console.error('❌ Error en la consulta SQL:', err);
      return res.status(500).json({ error: 'Error interno del servidor' });
    }

    if (results.length === 0) {
      console.warn(`⚠️ No se encontró el documento: ${numeroDocumento}`);
      return res.status(404).json({ error: 'Documento no encontrado' });
    }

    console.log('✅ Datos encontrados y enviados al frontend');
    res.json(results[0]);
  });
});

module.exports = router;
