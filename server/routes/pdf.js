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
    const { nombre, cedula } = req.body;

    const existingPdfBytes = fs.readFileSync(filePath);
    const pdfDoc = await PDFDocument.load(existingPdfBytes);
    const font = await pdfDoc.embedFont(StandardFonts.Helvetica);
    const firstPage = pdfDoc.getPages()[0];

    // Ajusta coordenadas según el diseño del PDF original
    if (nombre) firstPage.drawText(nombre, { x: 100, y: 500, size: 12, font });
    if (cedula) firstPage.drawText(cedula, { x: 100, y: 480, size: 12, font });

    const pdfBytes = await pdfDoc.save();
    fs.unlinkSync(filePath); // limpia el archivo temporal

    res.setHeader('Content-Disposition', 'attachment; filename=pdf-editado.pdf');
    res.setHeader('Content-Type', 'application/pdf');
    res.send(Buffer.from(pdfBytes));

  } catch (error) {
    console.error('❌ Error al procesar PDF:', error.message);
    res.status(500).send('Error interno del servidor');
  }
});

module.exports = router;
