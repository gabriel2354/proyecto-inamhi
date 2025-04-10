const express = require('express');
const multer = require('multer');
const fs = require('fs');
const { PDFDocument, StandardFonts } = require('pdf-lib');

const router = express.Router();
const upload = multer({ dest: 'uploads/' }); // Carpeta temporal

// POST /subir/pdf
router.post('/pdf', upload.single('pdf'), async (req, res) => {
  try {
    if (!req.file) return res.status(400).send('Archivo PDF no recibido');

    const filePath = req.file.path;
    const { nombre, apellidos, cedula } = req.body;

    const existingPdfBytes = fs.readFileSync(filePath);
    const pdfDoc = await PDFDocument.load(existingPdfBytes);
    const font = await pdfDoc.embedFont(StandardFonts.Helvetica);
    const firstPage = pdfDoc.getPages()[0];

    const campos = {
      nombres: { x: 304, y: 80 },
      apellidos: { x: 298, y: 455 },
      cedula:   { x: 79, y: 377 }
    };

    if (nombre)   firstPage.drawText(nombre,    { ...campos.nombres, size: 12, font });
    if (apellidos)firstPage.drawText(apellidos, { ...campos.apellidos, size: 12, font });
    if (cedula)   firstPage.drawText(cedula,    { ...campos.cedula, size: 12, font });

    const pdfBytes = await pdfDoc.save();
    fs.unlinkSync(filePath); // Limpia archivo temporal

    res.setHeader('Content-Disposition', 'attachment; filename=pdf-editado.pdf');
    res.setHeader('Content-Type', 'application/pdf');
    res.send(Buffer.from(pdfBytes));

  } catch (error) {
    console.error('❌ Error al procesar PDF:', error.message);
    res.status(500).send('Error interno del servidor');
  }
});

module.exports = router;
