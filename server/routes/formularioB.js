const express = require('express');
const router = express.Router();
const db = require('../config/database'); // Asegúrate de tener esta conexión a tu DB

// Ruta para guardar una acción de personal (vacaciones)
router.post('/accion-personal', async (req, res) => {
  const {
    numero_documento,
    id_colaborador,
    id_empleado,
    fecha_desde,
    fecha_hasta,
    dias_tomados
  } = req.body;

  try {
    // Validar campos requeridos
    if (
      !numero_documento || !id_colaborador || !id_empleado ||
      !fecha_desde || !fecha_hasta || dias_tomados == null
    ) {
      return res.status(400).json({ message: 'Faltan datos obligatorios.' });
    }

    const sql = `
      INSERT INTO accion_personal_vacaciones_pdf (

        numero_documento,
        id_colaborador,
        id_empleado,
        fecha_desde,
        fecha_hasta,
        dias_tomados
      ) VALUES (?, ?, ?, ?, ?, ?)
    `;

    const valores = [
      numero_documento,
      id_colaborador,
      id_empleado,
      fecha_desde,
      fecha_hasta,
      dias_tomados
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

module.exports = router;
