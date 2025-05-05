const express = require('express');
const cors = require('cors');

const rolesRoutes = require('./routes/roles');
const usuariosRoutes = require('./routes/usuarios');
const sedesRoutes = require('./routes/sedes');
const authRoutes = require("./routes/auth");
const empleadosRoutes = require("./routes/empleadosB"); 
const pdfRoutes = require('./routes/pdf');
const formularioRoutes = require('./routes/formularioB')
const formularioVacacionesRoutes = require('./routes/formularioVacaciones');



const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Rutas
app.use('/roles', rolesRoutes);
app.use('/usuarios', usuariosRoutes);
app.use('/sedes', sedesRoutes);
app.use('/auth', authRoutes);
app.use('/empleados', empleadosRoutes); 
app.use('/subir-pdf', pdfRoutes);
app.use('/formulario', formularioRoutes);
app.use('/formulario-vacaciones', formularioVacacionesRoutes);




app.options('*', cors());

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
});
