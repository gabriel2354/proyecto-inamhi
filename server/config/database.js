const mysql = require('mysql2');

const pool = mysql.createPool({
    host: '127.0.0.1',         // Tu servidor local
    user: 'root',              // Usuario root que aparece en Workbench
    database: 'inamhi',     // <- Reemplaza esto con el nombre real de tu base de datos
    password: '1234',              // <- Si no tiene contraseña, déjalo vacío. Si tiene, ponla aquí.
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});





    module.exports = pool.promise(); // Exporta el pool para usarlo en otros módulos



//host: '178.63.7.242',
// user: 'funderedu_cnig',
//password: 'c.b2s.25.nig',
//database: 'funderedu_cnig',
//100.121.64.34 