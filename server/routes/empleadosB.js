const express = require('express');
const router = express.Router();
const db = require('../config/database');

// Obtener todos los empleados
router.get('/listar', async (req, res) => {
  try {
    const [rows] = await db.execute(`
      SELECT 
        e.numero_identificacion,
        e.nombres,
        e.apellidos, -- 🆕 Campo agregado
        e.estado_puesto,
        e.rmu_puesto,
        e.unidad_organica,
        e.canton,
        e.grado,
        (SELECT nombre FROM regimen_laboral WHERE codigo_regimen = e.codigo_regimen) AS regimen_laboral,
        (SELECT nombre FROM nivel_ocupacional WHERE codigo_nivel = e.codigo_nivel) AS nivel_ocupacional,
        (SELECT nombre FROM denominacion_puesto WHERE codigo_denom = e.codigo_denom) AS denominacion_puesto,
        (SELECT nombre FROM escala_ocupacional WHERE codigo_escala = e.codigo_escala) AS escala_ocupacional,
        (SELECT nombre FROM estructura_programatica WHERE codigo_enlace = e.codigo_enlace) AS estructura_programatica
      FROM empleados e
    `);
    res.json(rows);
  } catch (error) {
    console.error('Error al obtener empleados:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// Buscar por cédula
router.get('/buscar', async (req, res) => {
  const { cedula } = req.query;
  try {
    const [rows] = await db.execute(`
      SELECT 
        e.numero_identificacion,
        e.nombres,
        e.apellidos, -- 🆕 Campo agregado
        e.estado_puesto,
        e.rmu_puesto,
        e.unidad_organica,
        e.canton,
        e.grado,
        (SELECT nombre FROM regimen_laboral WHERE codigo_regimen = e.codigo_regimen) AS regimen_laboral,
        (SELECT nombre FROM nivel_ocupacional WHERE codigo_nivel = e.codigo_nivel) AS nivel_ocupacional,
        (SELECT nombre FROM denominacion_puesto WHERE codigo_denom = e.codigo_denom) AS denominacion_puesto,
        (SELECT nombre FROM escala_ocupacional WHERE codigo_escala = e.codigo_escala) AS escala_ocupacional,
        (SELECT nombre FROM estructura_programatica WHERE codigo_enlace = e.codigo_enlace) AS estructura_programatica
      FROM empleados e
      WHERE e.numero_identificacion = ?
    `, [cedula]);

    if (rows.length === 0) {
      return res.status(404).json({ message: 'Empleado no encontrado' });
    }

    res.json(rows[0]);
  } catch (error) {
    console.error('Error al buscar empleado:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// Eliminar
router.delete('/eliminar/:cedula', async (req, res) => {
  const { cedula } = req.params;
  try {
    const [result] = await db.execute(`DELETE FROM empleados WHERE numero_identificacion = ?`, [cedula]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Empleado no encontrado para eliminar' });
    }

    res.json({ message: 'Empleado eliminado correctamente' });
  } catch (error) {
    console.error('Error al eliminar empleado:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

module.exports = router;
