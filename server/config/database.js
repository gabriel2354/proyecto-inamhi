const mysql = require('mysql2');

const pool = mysql.createPool({
    host: '127.0.0.1',         // Tu servidor local
    user: 'root',              // Usuario root que aparece en Workbench
    database: 'inamhi',     // <- Reemplaza esto con el nombre real de tu base de datos
    password: '12345',              // <- Si no tiene contraseña, déjalo vacío. Si tiene, ponla aquí.
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});





    module.exports = pool.promise(); // Exporta el pool para usarlo en otros módulos



