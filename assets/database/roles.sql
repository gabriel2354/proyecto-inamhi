use inamhi;
/* Creamos la tabla rol  aqui Definimos los roles de usuario ( ejemplo: Administrador, Empleado, Supervisor).
Cada rol agrupa permisos y vistas que ese tipo de usuario puede tener.*/
CREATE TABLE rol (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);


/*Creamos la tabla permisos aqui Definimos los permisos del sistema, como crear_empleado, editar_usuarios.
Los permisos son asignados a roles y/o vistas.*/
CREATE TABLE permiso (
    idPermiso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

/*Tabla intermedia que asocia roles con permisos.
Ejemplo: El rol Administrador puede tener permiso de crear_usuario.*/
CREATE TABLE rol_permiso (
    idRol INT NOT NULL,
    idPermiso INT NOT NULL,
    PRIMARY KEY (idRol, idPermiso),
    FOREIGN KEY (idRol) REFERENCES rol(idRol) ON DELETE CASCADE,
    FOREIGN KEY (idPermiso) REFERENCES permiso(idPermiso) ON DELETE CASCADE
);

/*Define una vista o componente visual (página del frontend).
Ejemplo: Gestión de Empleados, Panel de Control, Reporte por Sede.*/
CREATE TABLE vista (
    idVista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    url VARCHAR(255) NOT NULL UNIQUE, 
    categoria VARCHAR(50) NOT NULL
);

/*Relaciona qué permisos se necesitan para acceder o interactuar con una vista específica.
Ejemplo: Para la vista usuarios.html, necesitas el permiso ver_usuarios.*/
CREATE TABLE vista_permiso (
    idVista INT NOT NULL,
    idPermiso INT NOT NULL,
    PRIMARY KEY (idVista, idPermiso),
    FOREIGN KEY (idVista) REFERENCES vista(idVista) ON DELETE CASCADE,
    FOREIGN KEY (idPermiso) REFERENCES permiso(idPermiso) ON DELETE CASCADE
);

/*Define las acciones específicas que un rol puede hacer dentro de una vista.
Ejemplo: El rol Admin puede "ver, eliminar editar " en la vista  roles y usuarios .*/
CREATE TABLE rol_vista (
    idRol INT NOT NULL,
    idVista INT NOT NULL,
    acciones VARCHAR(255) NOT NULL,
    PRIMARY KEY (idRol, idVista),
    FOREIGN KEY (idRol) REFERENCES rol(idRol) ON DELETE CASCADE,
    FOREIGN KEY (idVista) REFERENCES vista(idVista) ON DELETE CASCADE
);


/*Representa las sedes físicas o administrativas  INAMHI.
Ejemplo: Funder Quito, Funder Guayaquil, etc. para segmentar usuarios y datos.*/
create table sede(
idSede int auto_increment not null primary key,
nombre varchar(30) not null
);

/*Contiene la información de los usuarios que pueden iniciar sesión y usar el sistema.
Cada colaborador está asociado a un rol y a una sede.*/
sedeCREATE TABLE colaborador (
    idColaborador INT AUTO_INCREMENT PRIMARY KEY,
    idRol INT NOT NULL,
    nombres VARCHAR(200) NOT NULL,
    apellidos VARCHAR(200) NOT NULL,
    idSede INT NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    identificacion VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idRol) REFERENCES rol(idRol) ON UPDATE CASCADE,
    FOREIGN KEY (idSede) REFERENCES sede(idSede) ON UPDATE CASCADE
);


/* agregamos datos a la tabla sede */
INSERT INTO sede (nombre) VALUES

(' Quito');