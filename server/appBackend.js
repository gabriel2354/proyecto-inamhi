const express = require('express');
const cors = require('cors');
const rolesRoutes = require('./routes/roles');
const usuariosRoutes = require('./routes/usuarios');
const sedesRoutes = require('./routes/sedes');
const authRoutes = require("./routes/auth");

 
 

 
const app = express();
 
// ✅ Middleware para permitir múltiples orígenes
app.use(cors());
 
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
 
// Rutas
app.use('/roles', rolesRoutes);
app.use('/usuarios', usuariosRoutes);
app.use('/sedes', sedesRoutes);
app.use("/auth", authRoutes);




 
// ✅ Manejo explícito para solicitudes preflight OPTIONS
app.options('*', cors());
 
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
});
 