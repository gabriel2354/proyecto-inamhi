/*cremaos la base de datos con el nombre Inamhi*/
create database inamhi;
use inamhi

/*Tabla Regimen Laboral*/
CREATE TABLE regimen_laboral (
  codigo_regimen VARCHAR(10) PRIMARY KEY,
  nombre VARCHAR(100)
);

/*agregamos  datos proporcionados por la empresa a la tabla Regimen laboral */
INSERT INTO regimen_laboral (codigo_regimen, nombre) VALUES
('1', '1.SERVICIO CIVIL PUBLICO (LOSEP)'),
('2', '2.CODIGO DEL TRABAJO'),
('99', '99.JUBILADOS PATRONALES'),
('77', '77.PASIVOS');


/*Tabla estructura Programtica */
CREATE TABLE estructura_programatica (
  codigo_enlace VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(150)
);

/*Agregamos datos a la tabla  estructura Programatatica*/
INSERT INTO estructura_programatica (codigo_enlace, nombre)
VALUES
('1', '202542200000000010000000100051170000100000000'),
('2', '202542200000000550000100200071170020288888888'),
('3', '202542200000000010000000100058170000100000000');


/*Creamos la tabla Nivel Ocupacional*/
CREATE TABLE nivel_ocupacional (
  codigo_nivel VARCHAR(10) PRIMARY KEY,
  nombre VARCHAR(100)
);

/*Agregamos datos a la tabla nivel Ocupacional proporciaonado por la empresa */
INSERT INTO nivel_ocupacional (codigo_nivel, nombre) VALUES
('8', '8 NIVEL SUPERIOR DECRETO 624'),
('2', '2 NIVEL OPERATIVO'),
('1A', '1.CODIGO DE TRABAJO'),
('1B', '1 ESCALA JUBILADOS'),
('1C', '1 PASIVOS CORRIENTE'),
('2B', '2 PASIVOS INVERSION');

/*Creamos la tabla Modalidad laboral*/

CREATE TABLE modalidad_laboral (
  codigo_modalidad VARCHAR(10) PRIMARY KEY,
  nombre VARCHAR(100)
);

/*Agregamos datos a la tabla Modalidad laboral ,datos proporcionados por la empresa */
INSERT INTO modalidad_laboral (codigo_modalidad, nombre) VALUES
('1', 'NOMBRAMIENTO'),
('2', 'CONTRATOS OCASIONALES'),
('22', 'CONTRATO CODIGO TRABAJO INDEFINIDO'),
('27', 'PERSONAL JUBILADO');


/*Creamos la tabla Escala Ocupacional*/
CREATE TABLE escala_ocupacional (
  codigo_escala VARCHAR(10) PRIMARY KEY,
  nombre VARCHAR(100)
);

/*Agregamos datos a la tabla Escala Ocupacional , datos proporcionados por la empresa */
INSERT INTO escala_ocupacional (codigo_escala, nombre) VALUES
('NSD2', 'NIVEL JERARQUICO SUPERIOR 2 DEC. 601'),
('NSD3', 'NIVEL JERARQUICO SUPERIOR 3 DEC. 135'),
('NO03', 'SERVIDOR PUBLICO DE APOYO 1'),
('NO04', 'SERVIDOR PUBLICO DE APOYO 2'),
('NO05', 'SERVIDOR PUBLICO DE APOYO 3'),
('NO06', 'SERVIDOR PUBLICO DE APOYO 4'),
('NO07', 'SERVIDOR PUBLICO 1'),
('NO08', 'SERVIDOR PUBLICO 2'),
('NO09', 'SERVIDOR PUBLICO 3'),
('NO10', 'SERVIDOR PUBLICO 4'),
('NO11', 'SERVIDOR PUBLICO 5'),
('NO12', 'SERVIDOR PUBLICO 6'),
('NO13', 'SERVIDOR PUBLICO 7'),
('NO16', 'SERVIDOR PUBLICO 10'),
('CT3', 'NIVEL 3'),
('CT1', 'NIVEL 1'),
('JS2', 'JUBILADOS POR LEY'),
('PAS2', 'VALOR ASIGNAR PARA PAGO A TERCEROS (INVERSION)'),
('PAS1', 'VALOR ASIGNAR PARA PAGO A TERCEROS (CORRIENTE)');

/*cremaos la tabla Denominacion del Puesto*/
CREATE TABLE denominacion_puesto (
  codigo_denom VARCHAR(10) PRIMARY KEY,
  nombre VARCHAR(100)
);

/*Agregamos datos a la tabla denominacion del puesto,estos datos proporciono la empresa */
INSERT INTO denominacion_puesto (codigo_denom, nombre) VALUES
('AC2', 'ANALISTA DE CONTABILIDAD 1'),
('AC5', 'ANALISTA DE CONTABILIDAD 2'),
('AP5', 'ANALISTA DE PLANIFICACION 1'),
('ATTHH1', 'ANALISTA DE TALENTO HUMANO 1'),
('CO169', 'GUARDALMACEN'),
('CO2036', 'CHOFER'),
('CO2051', 'SECRETARIA'),
('CO61', 'OFICINISTA'),
('CO7', 'CONSERJE'),
('CONSEP-010', 'ANALISTA DE TICS 2'),
('CONSEP-011', 'ANALISTA 3 DE TALENTO HUMANO'),
('COV10', 'SERVIDOR PUBLICO 4'),
('COV4', 'SERVIDOR PUBLICO DE APOYO 2'),
('COV5', 'SERVIDOR PUBLICO DE APOYO 3'),
('COV6', 'SERVIDOR PUBLICO DE APOYO 4'), 
('DADFI', 'DIRECTOR ADMINISTRATIVO FINANCIERO'),
('DASJU', 'DIRECTOR DE ASESORIA JURIDICA'),
('DP100', 'ABOGADO 2'),
('DPLA', 'DIRECTOR DE PLANIFICACION'),
('HCN8', 'ESPECIALISTA 1'),
('INAMHI001', 'ASISTENTE DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICAS'),
('INAMHI002', 'ASISTENTE EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA'),
('INAMHI005', 'DIRECTOR DE PRONOSTICO Y ALERTAS HIDROMETEREOLOGICOS'),
('INAMHI010', 'DIRECTOR DE LA RED NACIONAL DE OBSERVACION HIDROMETEOROLOGICA'),
('INAMHI013', 'ANALISTA EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA'),
('INAMHI014', 'ANALISTA EN CALIBRACION Y MANTENIMIENTO DE INSTRUMENTAL HIDROMETEORLOGICO'),
('INAMHI018', 'ESPECIALISTA EN GESTION DE LA INFORMACION HIDROMETEOROLOGICA 2'),
('INAMHI021', 'ANALISTA EN SISTEMAS INFORMATICOS HIDROMETEOROLOGICOS'),
('INAMHI025', 'ESPECIALISTA EN PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICAS 2'),
('INAMHI026', 'ANALISTA EN PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICAS'),
('INAMHI027', 'DIRECTOR DE ESTUDIOS INVESTIGACION Y DESARROLLO HIDROMETEOROLOGICO'),
('INAMHI029', 'ESPECIALISTA EN HIDROMETEOROLOGIA 2'),
('INAMHI031', 'ESPECIALISTA EN HIDROGEOLOGIA 2'),
('INAMHI033', 'ESPECIALISTA EN CLIMATOLOGIA 2'),
('INAMHI042', 'ANALISTA EN INNOVACION Y DESARROLLO TECNOLOGICO'),
('INAMHI046', 'ESPECIALISTA EN CALIDAD DE AGUA Y SEDIMENTOS 2'),
('INAMHI047', 'ANALISTA EN CALIDAD DE AGUA Y SEDIMENTOS'),
('INAMHI048', 'ASISTENTE DE AGUA Y SEDIMENTOS'),
('INAMHI050', 'ESPECIALISTA REGIONAL HIDROMETEOROLOGICO 3'),
('INAMHI051', 'ESPECIALISTA REGIONAL EN OPERACION Y MANTENIMIENTO DE LA RED DE OBSERVACION HIDROMETEOROLOGICA 2'),
('INAMHI052', 'ANALISTA REGIONAL EN OPERACION Y MANTENIMIENTO DE LA RED DE OBSERVACION HIDROMETEOROLOGICA'),
('INAMHI053', 'ESPECIALISTA REGIONAL EN LA GESTION PRIMARIA DE LA INFORMACION HIDROMETEOROLOGICA 2'),
('INAMHI055', 'ESPECIALISTA REGIONAL EN ESTUDIOS Y PRONOSTICOS HIDROMETEOROLOGICOS 3'),
('INAMHI057', 'ANALISTA REGIONAL EN ESTUDIOS Y PRONOSTICOS HIDROMETEOROLOGICOS'),
('INAMHI060', 'ASISTENTE EN CALIDAD DE AGUA Y SEDIMENTOS'),
('INIAP002', 'INVESTIGADOR AUXILIAR 1'),
('INIAP006', 'INVESTIGADOR AGREGADO 2'),
('INM001', 'ASISTENTE DE DOCUMENTACION Y ARCHIVO .'),
('INM002', 'ESPECIALISTA EN CALIDAD DE AGUA Y SEDIMENTOS 3'),
('INM003', 'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA'),
('INM004', 'TECNICO EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA'),
('INM005', 'ESPECIALISTA EN AGROMETEOROLOGIA 2'),
('JS2', 'JUBILADO POR LEY'),
('ME224', 'ANALISTA DE COMPRAS PUBLICAS 2'),
('ME228', 'ANALISTA DE PRESUPUESTO 2'),
('MF209', 'ANALISTA 1 DE ADMINISTRACION DE TALENTO HUMANO,'),
('MRE109', 'DIRECTOR/A DE ADMINISTRACION DE TALENTO HUMANO .'),
('NS3012', 'DIRECTOR EJECUTIVO'),
('PNG015', 'ASISTENTE CONTABILIDAD'),
('PROCU-074', 'ASISTENTE DE COMUNICACION SOCIAL'),
('PROCU-080', 'AUXILIAR DE SERVICIOS'),
('SGR031', 'ASISTENTE ADMINISTRATIVA'),
('TC62', 'TESORERO GENERAL'),
('UEP383', 'ANALISTA DE COMPRAS PUBLICAS');


/*Creamos la tabla empleados */
CREATE TABLE empleados (
  id INT AUTO_INCREMENT PRIMARY KEY,

  codigo_regimen VARCHAR(10),
  codigo_nivel VARCHAR(10),
  codigo_modalidad VARCHAR(10),
  codigo_escala VARCHAR(10),
  codigo_denom VARCHAR(10),
  codigo_enlace VARCHAR(20),

  fecha_inicio DATE,
  fecha_fin DATE,
  partida_individual VARCHAR(50),
  estado_puesto VARCHAR(50),
  grado VARCHAR(10),
  rmu_escala DECIMAL(10,2),
  rmu_puesto DECIMAL(10,2),
  rmu_sobrevalorado DECIMAL(10,2),

  ruc_patronal VARCHAR(20),
  codigo_sucursal VARCHAR(10),
  tipo_identificacion VARCHAR(20),
  numero_identificacion VARCHAR(30),
  nombres VARCHAR(200),
  apellidos VARCHAR(200), 

  provincia VARCHAR(100),
  canton VARCHAR(100),
  codigo_canton VARCHAR(10),

  codigo_puesto_adicional VARCHAR(10),
  puesto_adicional VARCHAR(100),
  codigo_unidad_organica VARCHAR(10),
  unidad_organica VARCHAR(100),

  aporte_individual DECIMAL(10,2),
  aporte_patronal DECIMAL(10,2),

  comision_servicios VARCHAR(10),
  estado_servidor VARCHAR(50),
  fondos_reserva VARCHAR(10),
  acumulacion_decimo_tercero VARCHAR(10),
  acumulacion_decimo_cuarto VARCHAR(10),



  -- Relaciones
  FOREIGN KEY (codigo_regimen) REFERENCES regimen_laboral(codigo_regimen),
  FOREIGN KEY (codigo_nivel) REFERENCES nivel_ocupacional(codigo_nivel),
  FOREIGN KEY (codigo_modalidad) REFERENCES modalidad_laboral(codigo_modalidad),
  FOREIGN KEY (codigo_escala) REFERENCES escala_ocupacional(codigo_escala),
  FOREIGN KEY (codigo_denom) REFERENCES denominacion_puesto(codigo_denom),
  FOREIGN KEY (codigo_enlace) REFERENCES estructura_programatica(codigo_enlace)
);

-- accion personal pdf 

CREATE TABLE accion_personal_vacaciones_pdf (
  id INT AUTO_INCREMENT PRIMARY KEY,
  
  numero_documento VARCHAR(50) NOT NULL,
  
  id_empleado INT NOT NULL,
  id_colaborador INT NOT NULL,
  
  fecha_desde DATE NOT NULL,
  fecha_hasta DATE NOT NULL,
  dias_tomados INT NOT NULL,

  fecha_generacion DATETIME DEFAULT CURRENT_TIMESTAMP,

--Agregamos  una nueva columna  motivacion

  ALTER TABLE inamhi.accion_personal_vacaciones_pdf
ADD COLUMN motivacion TEXT;

  -- Claves foráneas
  FOREIGN KEY (id_empleado) REFERENCES empleados(id),
  FOREIGN KEY (id_colaborador) REFERENCES colaborador(idColaborador)
);

--Consultas 
SELECT * FROM inamhi.empleados;
use inamhi;
/*--Empleado 1*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
)
VALUES (
  '1', '8', '1', 'NSD2', 'DPLA', '1',
  '2025-01-01', '2025-12-31', '245', 'OCUPADO', '2',
  2368.00, 2368.00, 0.00,
  '1768045130001', '0001', 'CÉDULA', '0201471562', 'SHINA SHULIANA','CAMACHO MONTOYA',
  'PICHINCHA', 'QUITO', '1701',
  '', 'DIRECTOR DE PLANIFICACION', '3.1.2', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA ESMERALDAS - MIRA',
  11.45, 9.15,
  '', 'NOMBRAMIENTO', '1', 'SI', 'SI'
);
/*--Empleado 2*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES (
  '1', '8', '1', 'NSD2', 'INAMHI027', '1','2025-01-01', '2025-12-31', '260', 'OCUPADO', '2',
  2368.00, 2368.00, 0.00,'1768045130001', '0001', 'CÉDULA', '1712624608', 'DAVID FERNANDO', 'GALARZA MUÑOZ ',
  'PICHINCHA', 'QUITO', '1701','','', '2.1.4','DIRECCION DE ESTUDIOS, INVESTIGACION Y DESARROLLO HIDROMETEOROLOGICO',
  11.45, 9.15,
  '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'NO'
);

/*EMPLEADO 3*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
  '1','8', '1', 'NSD2' , 'INAMHI010', '1', '2025-01-01' , '2025-12-31', '410' , 'OCUPADO', '2', 
  2368.00, 2368.00 , '0.00', '1768045130001' , '001', 'CÉDULA', '1713140836','JOHN SEBASTIAN', 'BOLAÑOS ABAD',
  'PICHINCHA', 'QUITO' , '1701' , '' , '' , '2.1.1', 'DIRECCION DE LA RED NACIONAL DE OBSERVACION HIDROMETEOROLOGICA', 
  11.45, 9.15 , '' , 'NOMBRAMIENTO PROVISIONAL' , '1' , 'NO' , 'NO'
);

/*EMPLEADO 4*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
  '1','8', '1', 'NSD2' , 'DADFI', '1', '2025-01-01' , '2025-12-31', '20' , 'OCUPADO', '2', 
  2368.00, 2368.00 , '0.00', '1768045130001' , '001', 'CÉDULA', '1712432911','JOSE LUIS', 'BASTIDAS RECALDE',
  'PICHINCHA', 'QUITO' , '1701' , '' , '' , '4', 'DIRECCION ADMINISTRATIVA FINANCIERA', 
  11.45 , 9.15 , '' , 'NOMBRAMIENTO PROVISIONAL' , '1' , 'NO' , 'NO'
);

/*EMPLEADO 5*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
  '1','8', '1', 'NSD2' , 'INAMHI005', '1', '2025-01-01' , '2025-12-31', '165' , 'OCUPADO', '2', 
  2368.00, 2368.00 , '0.00', '1768045130001' , '001', 'CÉDULA', '1721793261','CARLOS VLADIMIR', 'ARREAGA DIAZ'
  ,'PICHINCHA', 'QUITO' , '1701' , '' , '' , '2.1.3  ', 'DIRECCION DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICOS', 
  11.45, 9.15 , '' , 'NOMBRAMIENTO PROVISIONAL' , '1' , 'SI' , 'SI'
);

/*EMPLEADO 6*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
  '1','8', '1', 'NSD2' , 'DASJU', '1', '2025-01-01' , '2025-12-31', '235' , 'OCUPADO', '2', 
  2368.00, 2368.00 , '0.00', '1768045130001' , '001', 'CÉDULA', '1713939252','CARLOS ENRIQUE','BERRU VILLALBA ',
  'PICHINCHA', 'QUITO' , '1701' , '' , '' , '3.1.1' , 'DIRECCION DE ASESORIA JURIDICA', 
  11.45, 9.15 , '' , 'NOMBRAMIENTO PROVISIONAL' , '1' , 'NO' , 'NO'
);

/*Empleado 7*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
  '1', '8', '1', 'NSD2', 'MRE109', '1', '2025-01-01', '2025-12-31', '205', 'OCUPADO', '2', 2368.00, 2368.00
, '0.00', '1768045130001', '0001', 'CÉDULA', '1802324150', 'MERCY IVONNE','FREIRE SANCHEZ',
   'PICHINCHA', 'QUITO', '1701', '', 'DDIRECTOR/A DE ADMINISTRACION DE TALENTO HUMANO ', '6', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA ESMERALDAS - MIRA',
   11.45, 9.15, '', 'OMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
   );
   
   /*EMPLEADO 8*/
   
     INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
   VALUES(
  '1', '8', '1', 'NSD3', 'NS3012', '1', '2025-01-01', '2025-12-31', '5', 'OCUPADO', '3', 2418.00, 2418.00
, '0.00', '1768045130001', '0001', 'CÉDULA', '1003297767', 'BOLIVAR ANDRES','ERAZO MALDONADO',
'PICHINCHA', 'QUITO', '1701', '', 'DIRECTOR EJECUTIVO', '001', 'DIRECCION EJECUTIVA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
   );
   /*EMPLEADO 9*/
    INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
   VALUES(
  '1', '2', '1', 'NO03', 'INM001', '1', '2025-01-01', '2025-12-31', '375', 'OCUPADO', '3', 585.00, 585.00
, '0.00', '1768045130001', '0001', 'CÉDULA', '1754121257', 'SHEYLA BRIGETTE', 'FREIRE SANCHEZ ',
   'PICHINCHA', 'QUITO', '1701', '', 'ASISTENTE DE DOCUMENTACION Y ARCHIVO ', '2.1.2', 'DIRECCION DE LA INFORMACION HIDROMETEOROLOGICA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
   );

/*EMPLEADO 10*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
  fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
  rmu_escala, rmu_puesto, rmu_sobrevalorado,
  ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
  provincia, canton, codigo_canton,
  codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
  aporte_individual, aporte_patronal,
  comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
)
VALUES (
  '1', '2', '1', 'NO03', 'INM001', '1',
  '2025-01-01', '2025-12-31', '692', 'OCUPADO', '3',
  585.00, 585.00, NULL,
  '1768045130001', '0001', 'CÉDULA', '1709502734', 'SAMUEL RICARDO', 'NARVAEZ CORDERO',
  'PICHINCHA', 'QUITO', '1701',
  NULL, 'ASISTENTE DE DOCUMENTACION Y ARCHIVO', '4', 'DIRECCION ADMINISTRATIVA FINANCIERA',
  11.45, 9.15,
  NULL, 'ACTIVO', '2', 'SI', 'SI'
);


/*EMPLEADO 11*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
  fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
  rmu_escala, rmu_puesto, rmu_sobrevalorado,
  ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos, 
  provincia, canton, codigo_canton,
  codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
  aporte_individual, aporte_patronal,
  comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES (
  '1', '2', '1', 'NO04', 'COV4', '1',
  '2025-01-01', '2025-12-31', '400', 'OCUPADO', '4',
  622.00, 622.00, NULL,'1768045130001', '0001', 'CÉDULA', '1709722423', 'ROBERTO DANILO', 'REASCOS ERAZO',
  'PICHINCHA', 'QUITO', '1701',
  NULL, 'SERVIDOR PUBLICO DE APOYO 2', '2.1.1', 'DIRECCION DE LA RED NACIONAL DE OBSERVACION HIDROMETEOROLOGICA',
  11.45, 9.15,
  NULL, 'ACTIVO', '2', 'SI', 'SI'
);

/*EMPLEADO 12*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
  fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
  rmu_escala, rmu_puesto, rmu_sobrevalorado,
  ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
  provincia, canton, codigo_canton,
  codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
  aporte_individual, aporte_patronal,
  comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
)
VALUES (
  '1', '2', '1', 'NO04', 'CO61', '1', '2025-01-01', '2025-12-31', '265', 'OCUPADO', '4',
  622.00, 622.00 , '0.00',
  '1768045130001', '0001', 'CÉDULA', '1716264252', 'SOLEDAD RAQUEL','NICOLALDE OÑA',
  'PICHINCHA', 'QUITO', '1701', '', 'OFICINISTA', '3.1.1', 'DIRECCION DE ASESORIA JURIDICA',
  11.45, 9.15, '', 'ACTIVO', '2', 'SI', 'SI'
);

/*EMPLEADO 13*/

 INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

   VALUES(
    '1', '2', '1', 'NO04', 'CO61', '1', '2025-01-01', '2025-12-31', '255', 'OCUPADO', '4', 622.00, 622.00 , '0.00  ',
   '1768045130001', '0001', 'CÉDULA', '1721083028', 'LOURDES CARMEN', 'SUAREZ LOPEZ',
   'PICHINCHA', 'QUITO', '1701', '', 'OFICINISTA', '3.1.2', '- DIRECCION DE PLANIFICACION',
   11.45, 9.15, '', 'ACTIVO', '2', 'NO', 'NO'
   );

/*EMPLEADO 14*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

   VALUES(
      '1', '2', '1', 'NO04', 'CO61', '1', '2025-01-01', '2025-12-31', '220', 'OCUPADO', '4', 622.00, 622.00 , '0.00  ',
   '1768045130001', '0001', 'CÉDULA', '1718214982', 'JUAN DAVID', 'SALDAÑA MIRANDA',
   'PICHINCHA', 'QUITO', '1701', '', 'OFICINISTA', '2.1.5', 'DIRECCION DE LABORATORIO NACIONAL DE CALIDAD DE AGUA Y SEDIMENTOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
   );
/*EMPPLEADO 15*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

   VALUES(
      '1', '2', '1', 'NO04', 'CO61', '1', '2025-01-01', '2025-12-31', '415', 'OCUPADO', '4', 622.00, 622.00 , '0.00  ',
   '1768045130001', '0001', 'CÉDULA', '0953528262', 'IVONNE DENNISE', 'VERA ASPIAZU ',
   'PICHINCHA', 'QUITO', '1701', '', 'OFICINISTA', '2.1.1', 'DIRECCION DE LA RED NACIONAL DE OBSERVACION HIDROMETEOROLOGICA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
   );

/*EMPLEADO 16*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
  fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
  rmu_escala, rmu_puesto, rmu_sobrevalorado,
  ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
  provincia, canton, codigo_canton,
  codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
  aporte_individual, aporte_patronal,
  comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
)
VALUES (
  '1', '2', '1', 'NO05', 'COV5', '1', '2025-03-01', '2025-12-31', '535', 'OCUPADO', '5',
  675.00, 675.00, NULL,
  '1768045130001', '0001', 'CÉDULA', '0350066510', 'LIZETH PAULINA', 'ANDRADE PILLAGA',
  'CAÑAR', 'CAÑAR', '0308', '', 'SERVIDOR PUBLICO DE APOYO 3', 'DRT6', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA MORONA SANTIAGO',
  11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '0', 'NO', 'NO'
);


/*EMPLEADO 17*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

   VALUES(
      '1', '2', '1', 'NO05', 'COV5', '1', '2025-03-01', '2025-12-31', '540', 'OCUPADO', '5', 675.00, 675.00 , NULL,
   '1768045130001', '0001', 'CÉDULA', '1002037115', 'JOSE GALO', 'PERUGACHI SUAREZ',
   'IMBABURA', 'OTAVALO', '1004', '', 'SERVIDOR PUBLICO DE APOYO 3', 'DRT1', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA ESMERALDAS - MIRA',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
   );
/*EMPLEADO 18*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
    '1', '2', '1', 'NO05', 'CO2051', '1', '2025-03-07', '2025-12-31', '10', 'OCUPADO', '5', 675.00, 675.00 , '0.00',
   '1768045130001', '0001', 'CÉDULA', '1716066343', ' MAYRA ALEJANDRA', 'MENA TORNERO',
   'PICHINCHA', 'QUITO', '1701', '', 'SECRETARIA', '8', 'DIRECCION DE PLANIFICACION',
   11.45, 9.15, '', 'ACTIVO', '1', 'NO', 'NO'
);

/*EMPLEADO 19*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
  '1', '2', '1', 'NO05', 'CO2051', '1', '2025-03-07', '2025-12-31', '15', 'OCUPADO', '5', 675.00, 675.00 , '0.00',
   '1768045130001', '0001', 'CÉDULA', '1723372023', 'TANIA ALEXANDRA', 'ALBAN VALAREZO',
   'PICHINCHA', 'QUITO', '1701', '', 'SECRETARIA', '4', 'DIRECCION ADMINISTRATIVA FINANCIERA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '0', 'SI', 'SI'
);
/*EMPLEADO 20*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO05', 'CO2051', '1', '2025-01-01', '2025-12-31', '60', 'OCUPADO', '5', 675.00, 675.00 , '0.00',
   '1768045130001', '0001', 'CÉDULA', '1718139825', 'MARIANA ALEXANDRA', 'PEREZ MOGOLLON',
   'PICHINCHA', 'QUITO', '1701', '', 'SECRETARIA', '001', 'DIRECCION ADMINISTRATIVA FINANCIERA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);

/*EMPLEADO 21*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO05', 'COV5', '1', '2025-01-01', '2025-12-31', '525', 'VACANTE', '5', 675.00, 675.00 , '0.00',
   '1768045130001', '0001', '', '', '', '',
   'PICHINCHA', 'QUITO', '1701', '', 'SERVIDOR PUBLICO DE APOYO 3', 'DRT2',
   'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA NAPO',
   11.45, 9.15, '', '', '0  ', 'NO', 'NO'
);
/*EMPLEADO 22*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
  fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
  rmu_escala, rmu_puesto, rmu_sobrevalorado,
  ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
  provincia, canton, codigo_canton,
  codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
  aporte_individual, aporte_patronal,
  comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES (
  '1', '2', '1', 'NO05', 'COV5', '1', '2025-01-01', '2025-12-31', '530', 'OCUPADO', '5',
  675.00, 675.00, NULL,
  '1768045130001', '0001', 'CEDULA', '1714448923', 'VERONICA PATRICIA', 'DE LA TORRE ESPINOSA',
  'PICHINCHA', 'QUITO', '1701', NULL, 'SERVIDOR PUBLICO DE APOYO 3', '2.1.1', 'DIRECCION DE LA RED NACIONAL DE OBSERVACION HIDROMETEOROLOGICA',
  11.45, 9.15, NULL, 'ACTIVO', '1', 'NO', 'NO'
);

/*EMPLEADO 23*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
)
VALUES(
   '1', '2', '1', 'NO05', 'CO2051', '1', '2025-01-01', '2025-12-31', '698', 'OCUPADO', '5', 675.00, 675.00 , '0.00',
   '1768045130001', '0001', 'CEDULA', '1722371968', 'GEOVANNA BELEN', 'FLORES PAZMIÑO',
   'PICHINCHA', 'QUITO', '1701', '', 'SECRETARIA', '3.1.1', 'DIRECCION DE ASESORIA JURIDICA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '0', 'SI', 'SI'
);
/*EMPLEADO 24*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM003', '1', '2025-01-01', '2025-12-31', '475', 'OCUPADO', '6', 733.00, 733.00 , '0.00',
   '1768045130001', '0001', 'CEDULA', '1600704660', 'MATTEO ANTHONY', 'ASHANKA VARGAS',
   'PASTAZA', 'PASTAZA', '1601', '', 'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA', 'DRT3', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA PASTAZA',
   11.45, 9.15, '', 'ACTIVO', '0', 'SI', 'SI'
);
/*EMPLEADO 25*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
)
VALUES(
   '1', '2', '1', 'NO06', 'INM003', '1', '2025-01-01', '2025-12-31', '470', 'OCUPADO', '6', 733.00, 733.00 , '0.00',
   '1768045130001', '0001', 'CEDULA', '2200393656', 'HENRY ANDRES', 'AREVALO RAMON',
   'ORELLANA', 'FRANCISCO DE ORELLANA', '2201', '', 'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA', 'DRT2',
   'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA NAPO',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*EMPLEADO 26*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
)
VALUES(
   '1', '2', '1', 'NO06', 'INM003', '1', '2025-01-01', '2025-12-31', '700', 'OCUPADO', '6', 733, 733.00 , '0.00',
   '1768045130001', '0001', 'CEDULA', '1600526659', 'JEISSON JAVIER','LANDETA TAPIA',
   'ESMERALDAS', 'ESMERALDAS', '0801', '', 'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA', 'DRT1', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA ESMERALDAS - MIRA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);

/*EMPLEADO 27*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
)
VALUES(
   '1', '2', '1', 'NO06', 'INM003', '1', '2025-01-01', '2025-12-31', '465', 'OCUPADO', '6', 733, 1466.00 , '0.00',
   '1768045130001', '0001', 'CEDULA', '2000030052', 'JIMMY FRANCISCO', 'PAREDES MORA',
   'GALAPAGOS', 'SAN CRISTOBAL', '2001', '', 'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA'
   , 'DRT5', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA ESMERALDAS - MIRA',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);
/*EMPLEADO 28*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM003', '1', '2025-01-01', '2025-12-31', '500', 'OCUPADO', '6', 733.00, 733.00 ,
    '0.00',
   '1768045130001', '0001', 'CEDULA', '1202611743', 'PABLO DAVID', 'LEON MAYORGA',
   'LOS RIOS', 'QUEVEDO', '1205', '', 
   'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA', 'DRT5', 
   'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA ESMERALDAS - MIRA',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);
/*EMPLEADO 29*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM003', '1', '2025-01-01', '2025-12-31', '485', 'OCUPADO', '6', 733.00 , 733.00,
   NULL,
   '1768045130001', '0001', 'CEDULA', '1202611743', 'CARLOS JULIO', 'MINA NAUSIN',
   'MANABI', 'PORTOVIEJO', '1301', '', 
   'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
    'DRT4', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA MANABI',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);
/*EMPLEADO 30*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM003', '1', '2025-01-01', '2025-12-31', '505', 'OCUPADO', '6', 733.00, 733.00 ,
    NULL ,'1768045130001', '0001', 'CEDULA', '0401142039', ' MARIA ELENA', 'ACOSTA GUACHAN',
   'CARCHI', 'MONTUFAR', '0405', '', 'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA', 
   'DRT1', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA ESMERALDAS - MIRA',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);

/*EMPLEADO 31*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM004', '1', '2025-01-01', '2025-12-31', '515', 'OCUPADO', '6', 733.00, 733.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '0401931704', 'ALEX FREDDY','CAICEDO ZUÑIGA',
   'PICHINCHA', 'CAYAMBE', '1702', '', 'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA', 
   'DRT2', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA NAPO',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);

/*--Empleado 32 */
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM003', '1', '2025-01-01', '2025-12-31', '55', 'OCUPADO', '6', 733.00, 733.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1715700330', 'EDISON VICENTE', 'CEDEÑO CEDEÑO',
   'COTOPAXI', 'SALCEDO', '0505', '', 'TECNICO REGIONAL EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA', 
   'DRT3', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA PASTAZA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*--Empleado 33*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
  fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
  rmu_escala, rmu_puesto, rmu_sobrevalorado,
  ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
  provincia, canton, codigo_canton,
  codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
  aporte_individual, aporte_patronal,
  comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES (
  '1', '2', '1', 'NO06', 'COV6', '1', '2025-01-01', '2025-12-31', '40', 'OCUPADO', '6',
  733.00, 733.00, 0.00,
  '1768045130001', '0001', 'CEDULA', '1715813307', 'LUIS FELIPE', 'ALBUJA LOPEZ',
  'PICHINCHA', 'QUITO', '1701', NULL, 'SERVIDOR PUBLICO DE APOYO 4',
  '6', 'DIRECCION DE ADMINISTRACION DE RECURSOS HUMANOS',
  11.45, 9.15, NULL, 'NOMBRAMIENTO PROVISIONAL', '0', 'NO', 'NO'
);

/*--Empleado 34*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM004', '1', '2025-01-01', '2025-12-31', '495', 'OCUPADO', '6', 733.00, 733.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1802254662', 'CLAUDIO RODRIGO', 'MEDINA RUIZ',
   'PICHINCHA', 'QUITO', '1701', '', 'TECNICO EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
      '2.1.1', 'DIRECCION DE LA RED NACIONAL DE OBSERVACION HIDROMETEOROLOGICA',
   11.45, 9.15, '', 'ACTIVO', '2', 'SI', 'SI'
);
/*--Empleado 35*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'COV6', '1', '2025-01-01', '2025-12-31', '625', 'OCUPADO', '6', 733.00, 733.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1713418984', 'MARA ISABEL', 'VILLALBA VANEGAS',
   'PICHINCHA', 'QUITO', '1701', '', 'SERVIDOR PUBLICO DE APOYO 4',
      '2.1.3', 'DIRECCION DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);

/*--Empleado 36*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM004', '1', '2025-01-01', '2025-12-31', '8', 'OCUPADO', '6', 733.00, 733.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1950112811', 'ANDRES AMAUTA','GONZALES ZAPATA ',
   'PICHINCHA', 'QUITO', '1701', '', 'TECNICO EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
      '2.1.1', 'DIRECCION DE LA RED NACIONAL DE OBSERVACION HIDROMETEOROLOGICA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '0', 'SI', 'SI'
);


/*--Empleado 37*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'SGR031', '1', '2025-01-01', '2025-12-31', '650', 'OCUPADO', '6', 733.00, 733.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1751839877', 'MADELYN JOHANNA','ENRIQUEZ MARTINEZ',
   'PICHINCHA', 'QUITO', '1701', '', 'ASISTENTE ADMINISTRATIVA',
      '4', 'DIRECCION ADMINISTRATIVA FINANCIERA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*--Empleado 38*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'COV6', '1', '2025-01-01', '2025-12-31', '85', 'OCUPADO', '6', 733.00, 733.00 ,
    NULL ,'1768045130001', '0001', 'CEDULA', '1720854114', 'FLABIO LENIN', 'CABEZAS MORALES',
   'PICHINCHA', 'QUITO', '1701', '', 'SERVIDOR PUBLICO DE APOYO 4',
      '4', 'DIRECCION ADMINISTRATIVA FINANCIERA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '0', 'SI', 'SI'
);


/*--Empleado 39*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM004', '1', '2025-01-01', '2025-12-31', '510', 'OCUPADO', '6', 733.00, 733.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1713290599', 'HOLGER ROBINSON', 'AUCANCELA FLORES',
   'PICHINCHA', 'QUITO', '1701', '', 'TECNICO EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
      'DRT2', ' DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA NAPO',
   11.45, 9.15, '', 'ACTIVO', '1', 'NO', 'NO'
);


/*--Empleado 40 */

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM004', '1', '2025-01-01', '2025-12-31', '699', 'OCUPADO', '6', 733.00, 733.00 ,
    NULL ,'1768045130001', '0001', 'CEDULA', '0401585344', 'FERNANDO ANDRES', 'MENDEZ CHULDE',
   'PICHINCHA', 'QUITO', '1701', '', 'TECNICO EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
      'DRT2', ' DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA NAPO',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);

/*--Empleado 41*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO06', 'INM003', '1', '2025-01-01', '2025-12-31', '490', 'OCUPADO', '6', 733.00, 733.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '0550510002', 'LISBETH YADIRA', 'SALGUERO ZAMBONINO',
   'COTOPAXI', 'SALCEDO', '0505', '', 'TECNICO EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
      'DRT3', ' DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA NAPO',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);


/*--Empleado 42*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO07', 'INM002', '1', '2025-01-01', '2025-12-31', '450', 'OCUPADO', '7', 817.00, 817.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1720091261', 'GUIDO REMIGIO', 'PILATAXI ALULEMA',
   'PICHINCHA', 'QUITO', '1701', '', 'ASISTENTE EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
      'DRT5', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA GUAYAS - GALAPAGOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*Empleado 43*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO07', 'INAMHI002', '1', '2025-01-01', '2025-12-31', '440', 'OCUPADO', '7', 817.00, 817.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1803060910', 'DIEGO RAUL',' PALACIOS CORDOVILLA',
   'TUNGURAHUA', 'CEVALLOS', '1803', '', 'ASISTENTE EN GESTION DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
      'DRT3', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA PASTAZA',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);


/*--Empleado 44*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO07', 'PNG015', '1', '2025-01-01', '2025-12-31', '200', 'OCUPADO', '7', 817.00, 817.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1715058820', 'MIRIAM ANGELICA','ESCOBAR CHANGO',
   'PICHINCHA', 'QUITO', '1701', '', 'ASISTENTE CONTABILIDAD',
      '4', 'DIRECCION ADMINISTRATIVA FINANCIERA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*--Empleado 45*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO07', 'INAMHI048', '1', '2025-01-01', '2025-12-31', '615', 'OCUPADO', '7', 817.00, 817.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1717327181', 'DANIELA CAROLINA','BAQUE TUMBACO',
   'PICHINCHA', 'QUITO', '1701', '', ' ASISTENTE DE AGUA Y SEDIMENTOS',
      '2.1.5', 'DIRECCION DE LABORATORIO NACIONAL DE CALIDAD DE AGUA Y SEDIMENTOS',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);

/*--Empleado 46*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO07', 'INAMHI001', '1', '2025-01-01', '2025-12-31', '620', 'OCUPADO', '7', 817.00, 817.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1206361279',  'DANIELA CAROLINA',' BAQUE TUMBACO',
   'PICHINCHA', 'QUITO', '1701', '', 'ASISTENTE DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICAS',
      '2.1.3', 'DIRECCION DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICOS',
   11.45, 9.15, '', 'ACTIVO', '2', 'SI', 'SI'
);

/*--Empleado 47*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO07', 'PROCU-074', '1', '2025-01-01', '2025-12-31', '50', 'OCUPADO', '7', 817.00, 817.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1722454764', 'DAVID SANTIAGO','RUEDA HIDROBO',
   'PICHINCHA', 'QUITO', '1701', '', 'ASISTENTE DE COMUNICACION SOCIAL',
      'DCS001', 'DIRECCION DE COMUNICACION SOCIAL',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);

/*--Empleado 48*/ 

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO07', 'INAMHI060', '1', '2025-01-01', '2025-12-31', '702', 'OCUPADO', '7', 817.00, 817.00 ,
    NULL ,'1768045130001', '0001', 'CEDULA', '0201529138', 'IRALDA TERESA','ESPIN LEDESMA',
   'PICHINCHA', 'QUITO', '1701', '', 'ASISTENTE EN CALIDAD DE AGUA Y SEDIMENTOS',
      '2.1.5', 'DIRECCION DE COMUNICACION SOCIAL',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);


/*--Empleado 49*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO08', 'INAMHI057', '1', '2025-01-01', '2025-12-31', '610', 'OCUPADO', '8', 901.00, 901.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '0915787808', 'BORIS ERWIS', 'MALAVE REYES',
   'GUAYAS', 'GUAYAQUIL', '0901', '', 'ANALISTA REGIONAL EN ESTUDIOS Y PRONOSTICOS HIDROMETEOROLOGICOS',
      'DRT5', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA GUAYAS - GALAPAGOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);


/*--Empleado 50 */
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO08', 'INAMHI057', '1', '2025-01-01', '2025-12-31', '345', 'OCUPADO', '8', 901.00, 901.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '0920376936', 'CARLOS LUIS', 'NARANJO SILVA',
   'GUAYAS', 'GUAYAQUIL', '0901', '', 'ANALISTA REGIONAL EN OPERACION Y MANTENIMIENTO DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
      'DRT5', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA GUAYAS - GALAPAGOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);



/*--Empleado 51*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO07', 'INAMHI001', '1', '2025-01-01', '2025-12-31', '75', 'OCUPADO', '7', 817.00, 817.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1726832056', 'CRISTINA GISSELA','VALDIVIESO MANTILLA',
   'PICHINCHA', 'QUITO', '1701', '', 'ASISTENTE DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICAS',
      '2.1.3', 'DIRECCION DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*--Empleado  52*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO08', 'INAMHI052', '1', '2025-01-01', '2025-12-31', '250', 'OCUPADO', '8', 901.00, 901.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1311409856', 'JEFFERSON RAUL','LUCAS BARCIA',
   'GUAYAS', 'GUAYAQUIL', '0901', '', 'ANALISTA REGIONAL EN OPERACION Y MANTENIMIENTO DE LA RED DE OBSERVACION HIDROMETEOROLOGICA',
      'DRT5', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA GUAYAS - GALAPAGOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);
/*--Empleado 53*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO08', 'MF209', '1', '2025-01-01', '2025-12-31', '215', 'OCUPADO', '8', 901.00, 901.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '0503244709', 'ANDREA CAROLINA', 'ALVAREZ MULLO',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA 1 DE ADMINISTRACION DE TALENTO HUMANO,',
      '6', 'DIRECCION DE ADMINISTRACION DE RECURSOS HUMANOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '0', 'SI', 'SI'
);

/*--Empleado 54*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'INAMHI014', '1', '2025-01-01', '2025-12-31', '330', 'OCUPADO', '9', 986.00, 986.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1714536743', 'CESAR DAVID', 'TONATO PERALTA',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA EN CALIBRACION Y MANTENIMIENTO DE INSTRUMENTAL HIDROMETEORLOGICO',
      '2.1.1', 'DIRECCION DE LA RED NACIONAL DE OBSERVACION HIDROMETEOROLOGICA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*--Empleado 55*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'INAMHI042', '1', '2025-01-01', '2025-12-31', '605', 'OCUPADO', '9', 986.00, 986.00 ,
    NULL,'1768045130001', '0001', 'CEDULA', '1704680014', 'EDISON RICARDO', 'CRUZ MORA',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA EN INNOVACION Y DESARROLLO TECNOLOGICO',
      '2.1.4', 'DIRECCION DE ESTUDIOS, INVESTIGACION Y DESARROLLO HIDROMETEOROLOGICO',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);


/*--Empleado 56*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'INAMHI021', '1', '2025-01-01', '2025-12-31', '340', 'OCUPADO', '9', 986.00, 986.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1708975626', 'MARIO RODOLFO', 'TEJADA TERAN',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA EN SISTEMAS INFORMATICOS HIDROMETEOROLOGICOS',
      '2.1.2', 'DIRECCION DE LA INFORMACION HIDROMETEOROLOGICA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);


/*--Empleado 57*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'AP5', '1', '2025-01-01', '2025-12-31', '694', 'OCUPADO', '9', 986.00, 986.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '0502950215', 'WILSON FERNANDO','SARZOSA GARCIA',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA DE PLANIFICACION 1',
      '3.1.2', '- DIRECCION DE PLANIFICACION',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*--Empleado 58*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'INAMHI026', '1', '2025-01-01', '2025-12-31', '595', 'OCUPADO', '9', 986.00, 986.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1715888085', 'JOSE GUILLERMO','FLORES CUMBAL',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA EN PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICAS',
      '2.1.3', 'DIRECCION DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);


/*--Empleado 59*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'INAMHI026', '1', '2025-01-01', '2025-12-31', '600', 'OCUPADO', '9', 986.00, 986.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1719870980', 'JAVIER ULISES','MACAS JIMENEZ ',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA EN PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICAS',
      '2.1.3', 'DIRECCION DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);




/*--Empleado 60*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'INAMHI026', '1', '2025-01-01', '2025-12-31', '706', 'OCUPADO', '9', 986.00, 986.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1719870980', 'JAVIER ULISES', 'MACAS JIMENEZ',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA EN PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICAS',
      '2.1.5', 'DIRECCION DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);
/* --Empleado 61*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'AP5', '1', '2025-01-01', '2025-12-31', '704', 'OCUPADO', '9', 986.00, 986.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '1712875382', 'RAFAEL MACARIO','FONSECA GARZON',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA DE PLANIFICACION 1',
      '3.1.2', '- DIRECCION DE PLANIFICACION',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);

/*--Empleado 62 */

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'INAMHI047', '1', '2025-01-01', '2025-12-31', '703', 'OCUPADO', '9', 986.00, 986.00 ,
    NULL ,'1768045130001', '0001', 'CEDULA', '1714232699', 'VICTOR ALFONSO', 'MOGRO ALMACHI',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA EN CALIDAD DE AGUA Y SEDIMENTOS',
      '2.1.5', 'DIRECCION DE LABORATORIO NACIONAL DE CALIDAD DE AGUA Y SEDIMENTOS',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*--Empleado 63*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO09', 'INAMHI014', '1', '2025-01-01', '2025-12-31', '701', 'OCUPADO', '9', 986.00, 986.00 ,
    NULL,'1768045130001', '0001', 'CEDULA', '1713870465', 'MARIA NARCISA','GUAIGUA ALBARRACIN',
   'SANTO DOMINGO DE LOS TSACHILAS', 'LA CONCORDIA', '2302', '', 'ANALISTA EN CALIBRACION Y MANTENIMIENTO DE INSTRUMENTAL HIDROMETEORLOGICO',
      'DRT1', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA ESMERALDAS - MIRA',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);

/*--Empleado 64*/
INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO10', 'INAMHI051', '1', '2025-01-01', '2025-12-31', '315', 'OCUPADO', '10', 1086.00
, 1086.00 ,
    '0.00','1768045130001', '0001', 'CEDULA', '0604018689', ' KARINA ELIZABETH', 'MONTUFAR MIRANDA',
   'CHIMBORAZO', 'RIOBAMBA', '0601', '', 'ESPECIALISTA REGIONAL EN OPERACION Y MANTENIMIENTO DE LA RED DE OBSERVACION HIDROMETEOROLOGICA 2',
      'DRT3', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA PASTAZA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);

/*--Empleado 65*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO10', 'INAMHI053', '1', '2025-01-01', '2025-12-31', '690', 'OCUPADO', '10', 1086.00
, 1086.00 ,'0.00','1768045130001', '0001', 'CEDULA', '1103959126', 'FRANCO JEFFERSON', 'JIMENEZ IÑIGUEZ',
   'LOJA', 'LOJA', '1101', '', 'ESPECIALISTA REGIONAL EN LA GESTION PRIMARIA DE LA INFORMACION',
      'DRT7', 'DIRECCION REGIONAL TECNICA HIDROMETEOROLOGICA JUBONES - PUYANGO',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '0', 'SI', 'SI'
);


/*--Empleado 66*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 
VALUES(
   '1', '2', '1', 'NO10', 'COV10', '1', '2025-01-01', '2025-12-31', '240', 'VACANTE', '10', 1086.00
, 1086.00 ,'0.00','1768045130001', '0001', '', '', '','','PICHINCHA', 'QUITO', '1701', '', 'SERVIDOR PUBLICO 4',
      '3.1.1', 'DIRECCION DE ASESORIA JURIDICA',11.45, 9.15, '', '', '0', 'NO', '  NO'
);

/*--Empleado 67*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO10', 'COV10', '1', '2025-01-01', '2025-12-31', '435', 'OCUPADO', '10', 1086.00
, 1086.00 , '0.00','1768045130001', '0001', 'CEDULA', '1721537775', 'BYRON ISRAEL', 'ASIMBAYA VERDEZOTO',
   'LOJA', 'LOJA', '1101', '', 'SERVIDOR PUBLICO 4',
      '2.1.1', 'DIRECCION DE LA RED NACIONAL DE OBSERVACION HIDROMETEOROLOGICA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '0', 'SI', 'SI'
);

/*--Empleado 68*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO10', 'COV10', '1', '2025-01-01', '2025-12-31', '210', 'VACANTE', '10', 1086.00
, 1086.00 ,'0.00','1768045130001', '0001', '', '', '','',
   'PICHINCHA', 'LOJA', '1701', '', 'SERVIDOR PUBLICO 4',
      '6', 'DIRECCION DE ADMINISTRACION DE RECURSOS HUMANOS',
   11.45, 9.15, '', '', '0', 'NO', 'NO'
);
/*--Empleado 69*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'INAMHI029', '1', '2025-01-01', '2025-12-31', '310', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '1722291117', 'ALEJANDRO DAVID', 'ERAZO GUACHAMIN',
   'PICHINCHA', 'QUITO', '1701', '', 'ESPECIALISTA EN HIDROMETEOROLOGIA 2',
      '2.1.4', 'DDIRECCION DE ESTUDIOS, INVESTIGACION Y DESARROLLO HIDROMETEOROLOGICO',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);


/*--Empleado 70*/

INSERT INTO empleados (
codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
rmu_escala, rmu_puesto, rmu_sobrevalorado,
ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres, apellidos,
provincia, canton, codigo_canton,
codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
aporte_individual, aporte_patronal,
comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
)

VALUES(
'1', '2', '1', 'NO11', 'INM005', '1',
'2025-01-01', '2025-12-31', '580', 'OCUPADO', '11',
1212.00, 1212.00, '0.00',
'1768045130001', '0001', 'CEDULA', '1711792299', 'OSCAR MARCELO', 'AYALA CAMPAÑA ',
'PICHINCHA', 'QUITO', '1701',
NULL, 'ESPECIALISTA EN HIDROMETEOROLOGIA 2',
'2.1.4', 'DIRECCION DE ESTUDIOS, INVESTIGACION Y DESARROLLO HIDROMETEOROLOGICO',
11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);

/*--Empleado 71*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'INAMHI018', '1', '2025-01-01', '2025-12-31', '25', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '0104443254', 'JOSE LUIS', 'CABRERA ORTIZ',
   'PICHINCHA', 'QUITO', '1701', '', 'ESPECIALISTA EN GESTION DE LA INFORMACION HIDROMETEOROLOGICA 2',
      '2.1.2', 'DIRECCION DE ESTUDIOS, INVESTIGACION Y DESARROLLO HIDROMETEOROLOGICO',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'NO', 'NO'
);


/*--Empleado 72*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'CONSEP-010', '1', '2025-01-01', '2025-12-31', '30', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '0401359534', 'DIEGO FABIAN', 'GONZALEZ IBARRA',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA DE TICS 2',
      '4', 'DIRECCION ADMINISTRATIVA FINANCIERA',
   11.45, 9.15, '', 'ACTIVO', '2', 'SI', 'SI'
);

/*--Empleado 73*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'TC62', '1', '2025-01-01', '2025-12-31', '175', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '1803202819', 'KARINA LUXIOLITA', 'CANDO PUNINA',
   'PICHINCHA', 'QUITO', '1701', '', 'TESORERO GENERAL',
      '4', 'DIRECCION ADMINISTRATIVA FINANCIERA',
   11.45, 9.15, '', 'ACTIVO', '2', 'SI', 'SI'
);

/*--Empleado 74*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'INAMHI046', '1', '2025-01-01', '2025-12-31', '390', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '1719250910', 'CARLA ALEJANDRA', 'HERRERA PALADINES',
   'PICHINCHA', 'QUITO', '1701', '', 'ESPECIALISTA EN CALIDAD DE AGUA Y SEDIMENTOS 2',
      '2.1.5', 'DIRECCION DE LABORATORIO NACIONAL DE CALIDAD DE AGUA Y SEDIMENTOS',
   11.45, 9.15, '', 'ACTIVO', '1', 'NO', 'NO'
);


/*--Empleado 75*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'INAMHI025', '1', '2025-01-01', '2025-12-31', '585', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '1719816611', 'CRISTIAN OMAR', 'PALIZ ACOSTA',
   'PICHINCHA', 'QUITO', '1701', '', 'ESPECIALISTA EN PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICAS 2',
      '2.1.3', 'DIRECCION DE PRONOSTICOS Y ALERTAS HIDROMETEOROLOGICOS',
   11.45, 9.15, '', 'ACTIVO', '1', 'NO', 'NO'
);


/*--Empleado 76*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'INAMHI033', '1', '2025-01-01', '2025-12-31', '590', 'VACANTE', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', '', '', '', '',
   'PICHINCHA', 'QUITO', '1701', '', 'ESPECIALISTA EN CLIMATOLOGIA 2',
      '2.1.4', 'DIRECCION DE ESTUDIOS, INVESTIGACION Y DESARROLLO HIDROMETEOROLOGICO',
   11.45, 9.15, '', '', '0', 'NO', 'NO'
);

/*--Empleado 77*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'INAMHI018', '1', '2025-01-01', '2025-12-31', '45', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '1003239298', 'JAVIER', 'VELASQUEZ MALDONADO',
   'PICHINCHA', 'QUITO', '1701', '', 'ESPECIALISTA EN GESTION DE LA INFORMACION HIDROMETEOROLOGICA 2',
      '2.1.2', 'DIRECCION DE LA INFORMACION HIDROMETEOROLOGICA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '1', 'SI', 'SI'
);


/*--Empleado 78*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'INAMHI018', '1', '2025-01-01', '2025-12-31', '300', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '1707101133', 'JUAN EDWIN', 'GRANDA ULCUANGO',
   'PICHINCHA', 'QUITO', '1701', '', 'ESPECIALISTA EN GESTION DE LA INFORMACION HIDROMETEOROLOGICA 2',
      '2.1.2', 'DIRECCION DE LA INFORMACION HIDROMETEOROLOGICA',
   11.45, 9.15, '', 'ACTIVO', '1', 'SI', 'SI'
);

/*--Empleado 79*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'INAMHI031', '1', '2025-01-01', '2025-12-31', '305', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '1802337152', 'LESTER JOEL', 'PEREZ LOZADA',
   'PICHINCHA', 'QUITO', '1701', '', 'ESPECIALISTA EN HIDROGEOLOGIA 2',
      '2.1.4', 'DIRECCION DE ESTUDIOS, INVESTIGACION Y DESARROLLO HIDROMETEOROLOGICO',
   11.45, 9.15, '', 'ACTIVO', '1', 'NO', 'NO'
);


/*--Empleado 80*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'INM005', '1', '2025-01-01', '2025-12-31', '695', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '1716940794', 'AMPARO DE LOURDES', 'CONDOR QUISHPE',
   'PICHINCHA', 'QUITO', '1701', '', 'ESPECIALISTA EN AGROMETEOROLOGIA 2',
      '2.1.4', 'DIRECCION DE ESTUDIOS, INVESTIGACION Y DESARROLLO HIDROMETEOROLOGICO',
   11.45, 9.15, '', 'ACTIVO', '2', 'SI', 'SI'
);


/*--Empleado 81*/

INSERT INTO empleados (
  codigo_regimen, codigo_nivel, codigo_modalidad, codigo_escala, codigo_denom, codigo_enlace,
    fecha_inicio, fecha_fin, partida_individual, estado_puesto, grado,
    rmu_escala, rmu_puesto, rmu_sobrevalorado,
    ruc_patronal, codigo_sucursal, tipo_identificacion, numero_identificacion, nombres,apellidos,
    provincia, canton, codigo_canton,
    codigo_puesto_adicional, puesto_adicional, codigo_unidad_organica, unidad_organica,
    aporte_individual, aporte_patronal,
    comision_servicios, estado_servidor, fondos_reserva, acumulacion_decimo_tercero, acumulacion_decimo_cuarto
) 

VALUES(
   '1', '2', '1', 'NO11', 'ME224', '1', '2025-01-01', '2025-12-31', '696', 'OCUPADO', '11', 1212.00 ,1212.00,
    '0.00','1768045130001', '0001', 'CEDULA', '1717816019', 'WASHINGTON IVAN', 'AREVALO MERA',
   'PICHINCHA', 'QUITO', '1701', '', 'ANALISTA DE COMPRAS PUBLICAS 2',
      '4', 'DIRECCION ADMINISTRATIVA FINANCIERA',
   11.45, 9.15, '', 'NOMBRAMIENTO PROVISIONAL', '0', 'SI', 'SI'
);