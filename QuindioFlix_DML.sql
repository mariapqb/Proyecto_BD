-- -------------------------------------
-- DML - INSERTS
-- -------------------------------------

-- -------------------------------------
-- PAIS
-- -------------------------------------
INSERT INTO quindioflix.paises (nombre)
VALUES ('COLOMBIA');

-- -------------------------------------
-- DEPARTAMENTOS GEOGRAFICOS (32 DE COLOMBIA)
-- -------------------------------------
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Amazonas', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Antioquia', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Arauca', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Atlántico', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Bolívar', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Boyacá', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Caldas', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Caquetá', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Casanare', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Cauca', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Cesar', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Chocó', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Córdoba', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Cundinamarca', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Guainía', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Guaviare', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Huila', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('La Guajira', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Magdalena', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Meta', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Nariño', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Norte de Santander', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Putumayo', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Quindío', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Risaralda', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('San Andrés y Providencia', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Santander', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Sucre', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Tolima', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Valle del Cauca', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Vaupés', 1);
INSERT INTO quindioflix.departamentos_geo (nombre, id_pais) VALUES ('Vichada', 1);

-- -------------------------------------
-- CIUDADES (CAPITALES DE LOS DEPARTAMENTOS)
-- -------------------------------------

-- Amazonas
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo)
VALUES ('Leticia', 1);

-- Antioquia
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Medellín', 2);

-- Arauca
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Arauca', 3);

-- Atlántico
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Barranquilla', 4);

-- Bolívar
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Cartagena', 5);

-- Boyacá
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Tunja', 6);

-- Caldas
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Manizales', 7);

-- Caquetá
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Florencia', 8);

-- Casanare
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Yopal', 9);

-- Cauca
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Popayán', 10);

-- Cesar
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Valledupar', 11);

-- Chocó
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Quibdó', 12);

-- Córdoba
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Montería', 13);

-- Cundinamarca
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Bogotá D.C.', 14);

-- Guainía
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Inírida', 15);

-- Guaviare
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('San José del Guaviare', 16);

-- Huila
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Neiva', 17);

-- La Guajira
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Riohacha', 18);

-- Magdalena
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Santa Marta', 19);

-- Meta
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Villavicencio', 20);

-- Nariño
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Pasto', 21);

-- Norte de Santander
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Cúcuta', 22);

-- Putumayo
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Mocoa', 23);

-- Quindío
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Armenia', 24);

-- Risaralda
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Pereira', 25);

-- San Andrés y Providencia
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('San Andrés', 26);

-- Santander
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Bucaramanga', 27);

-- Sucre
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Sincelejo', 28);

-- Tolima
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Ibagué', 29);

-- Valle del Cauca
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Cali', 30);

-- Vaupés
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Mitú', 31);

-- Vichada
INSERT INTO quindioflix.ciudades (nombre, id_departamento_geo) VALUES ('Puerto Carreño', 32);

-- -------------------------------------
-- DEPARTAMENTOS
-- -------------------------------------

INSERT INTO quindioflix.departamentos (nombre)
VALUES ('Tecnología');

INSERT INTO quindioflix.departamentos (nombre)
VALUES ('Contenido');

INSERT INTO quindioflix.departamentos (nombre)
VALUES ('Marketing');

INSERT INTO quindioflix.departamentos (nombre)
VALUES ('Soporte');

INSERT INTO quindioflix.departamentos (nombre)
VALUES ('Finanzas');

-- -------------------------------------
-- EMPLEADOS
-- -------------------------------------

-- =========================
-- TECNOLOGÍA
-- =========================
INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Laura Martínez', 'laura.martinez@quindioflix.com', 'JEFE TECNOLOGÍA', 1, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Carlos Pérez', 'carlos.perez@quindioflix.com', 'DESARROLLADOR', 1, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Andrés Gómez', 'andres.gomez@quindioflix.com', 'ANALISTA', 1, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Sofía Ramírez', 'sofia.ramirez@quindioflix.com', 'QA', 1, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Julián Herrera', 'julian.herrera@quindioflix.com', 'DEVOPS', 1, NULL);
-- =========================
-- CONTENIDO
-- =========================
INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Daniela Rojas', 'daniela.rojas@quindioflix.com', 'JEFE CONTENIDO', 2, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Juan Torres', 'juan.torres@quindioflix.com', 'EDITOR', 2, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('María López', 'maria.lopez@quindioflix.com', 'PRODUCTOR', 2, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Natalia Gómez', 'natalia.gomez@quindioflix.com', 'GUIONISTA', 2, NULL);
-- =========================
-- MARKETING
-- =========================
INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Camila Herrera', 'camila.herrera@quindioflix.com', 'JEFE MARKETING', 3, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Felipe Castro', 'felipe.castro@quindioflix.com', 'ANALISTA DIGITAL', 3, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Valentina Ruiz', 'valentina.ruiz@quindioflix.com', 'COMMUNITY MANAGER', 3, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Sebastián Ortiz', 'sebastian.ortiz@quindioflix.com', 'DISEÑADOR', 3, NULL);

-- =========================
-- SOPORTE
-- =========================
INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Javier Molina', 'javier.molina@quindioflix.com', 'JEFE SOPORTE', 4, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Paula Díaz', 'paula.diaz@quindioflix.com', 'TÉCNICO SOPORTE', 4, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Sebastián León', 'sebastian.leon@quindioflix.com', 'HELP DESK', 4, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Laura Vargas', 'laura.vargas@quindioflix.com', 'SOPORTE NIVEL 2', 4, NULL);

-- =========================
-- FINANZAS
-- =========================
INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Natalia Cruz', 'natalia.cruz@quindioflix.com', 'JEFE FINANZAS', 5, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Diego Vargas', 'diego.vargas@quindioflix.com', 'CONTADOR', 5, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Marcela Pineda', 'marcela.pineda@quindioflix.com', 'ANALISTA FINANCIERO', 5, NULL);

INSERT INTO quindioflix.empleados (nombre, email, cargo, id_departamento, id_supervisor)
VALUES ('Andrés Ríos', 'andres.rios@quindioflix.com', 'TESORERÍA', 5, NULL);

-- =========================
-- ASIGNACIÓN DE SUPERVISOR
-- =========================

UPDATE quindioflix.empleados
SET id_supervisor = NULL
WHERE email = 'laura.martinez@quindioflix.com';

UPDATE quindioflix.empleados
SET id_supervisor = (SELECT id_empleado FROM quindioflix.empleados WHERE email='laura.martinez@quindioflix.com')
WHERE id_departamento = 1
AND email <> 'laura.martinez@quindioflix.com';

UPDATE quindioflix.empleados
SET id_supervisor = NULL
WHERE email = 'daniela.rojas@quindioflix.com';

UPDATE quindioflix.empleados
SET id_supervisor = (SELECT id_empleado FROM quindioflix.empleados WHERE email='daniela.rojas@quindioflix.com')
WHERE id_departamento = 2
AND email <> 'daniela.rojas@quindioflix.com';

UPDATE quindioflix.empleados
SET id_supervisor = NULL
WHERE email = 'camila.herrera@quindioflix.com';

UPDATE quindioflix.empleados
SET id_supervisor = (SELECT id_empleado FROM quindioflix.empleados WHERE email='camila.herrera@quindioflix.com')
WHERE id_departamento = 3
AND email <> 'camila.herrera@quindioflix.com';

UPDATE quindioflix.empleados
SET id_supervisor = NULL
WHERE email = 'javier.molina@quindioflix.com';

UPDATE quindioflix.empleados
SET id_supervisor = (SELECT id_empleado FROM quindioflix.empleados WHERE email='javier.molina@quindioflix.com')
WHERE id_departamento = 4
AND email <> 'javier.molina@quindioflix.com';

UPDATE quindioflix.empleados
SET id_supervisor = NULL
WHERE email = 'natalia.cruz@quindioflix.com';

UPDATE quindioflix.empleados
SET id_supervisor = (SELECT id_empleado FROM quindioflix.empleados WHERE email='natalia.cruz@quindioflix.com')
WHERE id_departamento = 5
AND email <> 'natalia.cruz@quindioflix.com';

-- =========================
-- ASIGNACIÓN DE JEFES DE DEPARTAMENTO
-- =========================

-- TECNOLOGÍA
UPDATE quindioflix.departamentos
SET id_jefe = (SELECT id_empleado FROM quindioflix.empleados WHERE email='laura.martinez@quindioflix.com')
WHERE id_departamento = 1;

-- CONTENIDO
UPDATE quindioflix.departamentos
SET id_jefe = (SELECT id_empleado FROM quindioflix.empleados WHERE email='daniela.rojas@quindioflix.com')
WHERE id_departamento = 2;

-- MARKETING
UPDATE quindioflix.departamentos
SET id_jefe = (SELECT id_empleado FROM quindioflix.empleados WHERE email='camila.herrera@quindioflix.com')
WHERE id_departamento = 3;

-- SOPORTE
UPDATE quindioflix.departamentos
SET id_jefe = (SELECT id_empleado FROM quindioflix.empleados WHERE email='javier.molina@quindioflix.com')
WHERE id_departamento = 4;

-- FINANZAS
UPDATE quindioflix.departamentos
SET id_jefe = (SELECT id_empleado FROM quindioflix.empleados WHERE email='natalia.cruz@quindioflix.com')
WHERE id_departamento = 5;

-- -------------------------------------
-- PLANES
-- -------------------------------------

INSERT INTO quindioflix.planes 
(nombre, precio_mensual, pantallas_simultaneas, calidad, max_perfiles)
VALUES 
('BASICO', 14900, 1, 'SD', 2);

INSERT INTO quindioflix.planes 
(nombre, precio_mensual, pantallas_simultaneas, calidad, max_perfiles)
VALUES 
('ESTANDAR', 24900, 2, 'HD', 4);

INSERT INTO quindioflix.planes 
(nombre, precio_mensual, pantallas_simultaneas, calidad, max_perfiles)
VALUES 
('PREMIUM', 34900, 4, '4K', 6);

ALTER TABLE quindioflix.planes
ADD CONSTRAINT chk_calidad
CHECK (calidad IN ('SD','HD','4K'));

-- -------------------------------------
-- CATEGORÍAS
-- -------------------------------------

INSERT INTO quindioflix.categorias (nombre, descripcion) 
VALUES ('PELICULA', 'Contenido cinematográfico de duración única');

INSERT INTO quindioflix.categorias (nombre, descripcion)
VALUES ('SERIE', 'Contenido dividido por temporadas y episodios');

INSERT INTO quindioflix.categorias (nombre, descripcion)
VALUES ('DOCUMENTAL', 'Contenido educativo o informativo basado en hechos reales');

INSERT INTO quindioflix.categorias (nombre, descripcion)
VALUES ('MUSICA', 'Videos musicales y contenido de artistas');

INSERT INTO quindioflix.categorias (nombre, descripcion)
VALUES ('PODCAST', 'Contenido de audio o video conversacional por episodios');

ALTER TABLE quindioflix.categorias
ADD CONSTRAINT chk_categoria_nombre
CHECK (nombre IN ('PELICULA','SERIE','DOCUMENTAL','MUSICA','PODCAST'));

-- -------------------------------------
-- GÉNEROS
-- -------------------------------------

INSERT INTO quindioflix.generos (nombre)
VALUES ('ACCION');

INSERT INTO quindioflix.generos (nombre)
VALUES ('COMEDIA');

INSERT INTO quindioflix.generos (nombre)
VALUES ('DRAMA');

INSERT INTO quindioflix.generos (nombre)
VALUES ('SUSPENSO');

INSERT INTO quindioflix.generos (nombre)
VALUES ('ROMANCE');

INSERT INTO quindioflix.generos (nombre)
VALUES ('CIENCIA FICCION');

INSERT INTO quindioflix.generos (nombre)
VALUES ('TERROR');

INSERT INTO quindioflix.generos (nombre)
VALUES ('INFANTIL');

-- -------------------------------------
-- USUARIOS
-- -------------------------------------

ALTER TABLE quindioflix.usuarios
MODIFY estado VARCHAR2(15) DEFAULT 'ACTIVO' NOT NULL;

ALTER TABLE quindioflix.usuarios
ADD CONSTRAINT chk_email_format
CHECK (email LIKE '%@%.%');

ALTER TABLE quindioflix.usuarios
ADD CONSTRAINT chk_no_self_ref
CHECK (id_usuario_referente IS NULL OR id_usuario_referente <> id_usuario);

-- =========================
-- CIUDAD 24
-- =========================

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Juan Camilo Torres', 'juan.torres1@mail.com', '3001111111', DATE '1998-05-10', 24, 1, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Valentina Gómez', 'valentina.gomez@mail.com', '3002222222', DATE '2000-03-21', 24, 2, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Sebastián López', 'sebastian.lopez@mail.com', '3003333333', DATE '1995-11-02', 24, 3, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('María Fernanda Ruiz', 'maria.ruiz@mail.com', '3004444444', DATE '1999-07-14', 24, 1, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Andrés Felipe Ríos', 'andres.rios@mail.com', '3005555555', DATE '1997-09-30', 24, 2, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Laura Sofía Pérez', 'laura.perez@mail.com', '3006666666', DATE '2001-01-18', 24, 3, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Carlos Andrés Mora', 'carlos.mora@mail.com', '3007777777', DATE '1996-06-12', 24, 1, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Daniela Ramírez', 'daniela.ramirez@mail.com', '3008888888', DATE '2002-04-08', 24, 2, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Julián Herrera', 'julian.herrera@mail.com', '3009999999', DATE '1994-12-25', 24, 3, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Natalia Vargas', 'natalia.vargas@mail.com', '3010000000', DATE '1998-08-19', 24, 1, 'ACTIVO');

-- =========================
-- CIUDAD 25
-- =========================

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Santiago Molina', 'santiago.molina@mail.com', '3011111111', DATE '1997-02-10', 25, 1, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Camila Rojas', 'camila.rojas@mail.com', '3012222222', DATE '2000-10-15', 25, 2, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Felipe Castro', 'felipe.castro@mail.com', '3013333333', DATE '1993-03-03', 25, 3, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Laura Díaz', 'laura.diaz@mail.com', '3014444444', DATE '1999-09-09', 25, 1, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Juan Esteban Pérez', 'juan.perez@mail.com', '3015555555', DATE '1996-05-22', 25, 2, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Valeria López', 'valeria.lopez@mail.com', '3016666666', DATE '2001-12-11', 25, 3, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Diego Torres', 'diego.torres@mail.com', '3017777777', DATE '1995-07-07', 25, 1, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Mariana Sánchez', 'mariana.sanchez@mail.com', '3018888888', DATE '1998-01-28', 25, 2, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Andrés Gómez', 'andres.gomez@mail.com', '3019999999', DATE '1994-10-19', 25, 3, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Sara Moreno', 'sara.moreno@mail.com', '3020000000', DATE '2002-06-06', 25, 1, 'ACTIVO');

-- =========================
-- CIUDAD 2
-- =========================

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Luis Fernando Restrepo', 'luis.restrepo@mail.com', '3021111111', DATE '1996-04-14', 2, 1, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Andrea Salazar', 'andrea.salazar@mail.com', '3022222222', DATE '1999-11-30', 2, 2, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Sebastián Mejía', 'sebastian.mejia@mail.com', '3023333333', DATE '1993-08-08', 2, 3, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Paula Gómez', 'paula.gomez@mail.com', '3024444444', DATE '2000-02-17', 2, 1, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Juan Pablo Vélez', 'juan.velez@mail.com', '3025555555', DATE '1997-09-05', 2, 2, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Natalia Henao', 'natalia.henao@mail.com', '3026666666', DATE '2001-03-12', 2, 3, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Carlos Muñoz', 'carlos.munoz@mail.com', '3027777777', DATE '1995-12-20', 2, 1, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Laura Cardona', 'laura.cardona@mail.com', '3028888888', DATE '1998-07-27', 2, 2, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Mateo Ramírez', 'mateo.ramirez@mail.com', '3029999999', DATE '1994-01-09', 2, 3, 'ACTIVO');

INSERT INTO quindioflix.usuarios (nombre, email, telefono, fecha_nacimiento, id_ciudad, id_plan, estado)
VALUES ('Sofía Quintero', 'sofia.quintero@mail.com', '3030000000', DATE '2002-05-23', 2, 1, 'ACTIVO');

-- -------------------------------------
-- CONTENIDO
-- -------------------------------------

-- =========================
-- PELÍCULAS (10)
-- =========================

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Destino Final: Eclipse','PELICULA',2023,110,'Un grupo intenta sobrevivir a una catástrofe cósmica','+16','S',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento, duracion_min,
    sinopsis, clasificacion_edad, es_original, id_categoria
) VALUES ('Amor en París','PELICULA',2022,105,'Historia romántica en la ciudad del amor','+13','N',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento, duracion_min,
    sinopsis, clasificacion_edad, es_original, id_categoria
) VALUES ('Operación Sigma','PELICULA',2024,130,'Agentes secretos evitan una guerra global','+16','S',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('La Casa Abandonada','PELICULA',2021,98,'Familia enfrenta eventos paranormales','+18','N',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Guardianes del Tiempo','PELICULA',2020,140,'Viajeros del tiempo alteran la historia','+13','S',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Rápidos de la Selva','PELICULA',2019,120,'Carreras ilegales en la selva amazónica','+13','N',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('El Último Samurai Urbano','PELICULA',2023,125,'Un guerrero moderno protege su ciudad','+16','S',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Luz de Invierno','PELICULA',2022,100,'Drama familiar en época navideña','TP','N',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Código Oscuro','PELICULA',2024,115,'Hackers enfrentan inteligencia artificial','+16','S',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Sueños de Libertad','PELICULA',2021,110,'Historia de superación personal','+13','N',1);

-- =========================
-- SERIES (10)
-- =========================

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Ciudad Sombría','SERIE',2023,45,'Detective investiga crímenes en ciudad corrupta','+18','S',2);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Familia Moderna','SERIE',2020,30,'Comedia sobre vida familiar','TP','N',2);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Neón 2084','SERIE',2024,50,'Futuro cyberpunk dominado por corporaciones','+16','S',2);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Escuela del Futuro','SERIE',2022,40,'Estudiantes con tecnología avanzada','+13','N',2);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Sombras del Pasado','SERIE',2021,55,'Secretos familiares salen a la luz','+16','N',2);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Guardianes Mágicos','SERIE',2023,35,'Niños con poderes especiales','+7','S',2);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Zona Cero','SERIE',2024,60,'Supervivencia tras desastre global','+18','S',2);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Amigos por Siempre','SERIE',2019,25,'Comedia juvenil de amistad','TP','N',2);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Reinos Perdidos','SERIE',2020,50,'Reinos medievales en guerra','+13','S',2);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Código Humano','SERIE',2024,45,'IA con conciencia propia','+16','S',2);

-- =========================
-- DOCUMENTALES (8)
-- =========================

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Planeta Vivo','DOCUMENTAL',2021,90,'Ecosistemas del planeta','TP','N',3);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Mentes Geniales','DOCUMENTAL',2022,85,'Historia de grandes científicos','+7','N',3);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Crimen Real','DOCUMENTAL',2023,100,'Casos policiales reales','+16','N',3);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Universo Infinito','DOCUMENTAL',2024,95,'Exploración del cosmos','+13','S',3);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Historia de la Tierra','DOCUMENTAL',2020,110,'Evolución del planeta','TP','N',3);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Tecnología Extrema','DOCUMENTAL',2023,80,'Innovaciones tecnológicas','+13','S',3);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Vida Salvaje','DOCUMENTAL',2021,70,'Animales en su hábitat natural','TP','N',3);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Misterios Antiguos','DOCUMENTAL',2022,88,'Civilizaciones perdidas','+13','N',3);

-- =========================
-- MÚSICA (4)
-- =========================

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Top Hits Global','MUSICA',2024,60,'Éxitos musicales internacionales','TP','N',4);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Concierto Sinfónico','MUSICA',2023,90,'Orquesta filarmónica','TP','S',4);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Urban Beats','MUSICA',2024,50,'Música urbana y reguetón','+13','N',4);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Rock Legends','MUSICA',2022,75,'Clásicos del rock','+13','N',4);

-- =========================
-- PODCAST (4)
-- =========================

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Charlas Tech','PODCAST',2024,40,'Tecnología y programación','+13','N',5);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Mente Emprendedora','PODCAST',2023,45,'Negocios y startups','+13','S',5);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Historias Nocturnas','PODCAST',2022,50,'Relatos de terror','+16','N',5);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Ciencia al Día','PODCAST',2024,35,'Avances científicos','TP','N',5);

-- =========================
-- VARIADOS (4)
-- =========================

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Heroínas del Futuro','PELICULA',2023,120,'Mujeres en un mundo distópico','+13','S',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('El Bosque Prohibido','PELICULA',2021,108,'Exploración de un bosque misterioso','+16','N',1);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Revolución Digital','DOCUMENTAL',2024,92,'Impacto de la tecnología en la sociedad','TP','S',3);

INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    duracion_min, sinopsis, clasificacion_edad,
    es_original, id_categoria
) VALUES ('Lazos Invisibles','SERIE',2023,42,'Conexiones humanas inesperadas','+13','N',2);

-- -------------------------------------
-- CONTENIDO_GENERO
-- -------------------------------------

-- PELÍCULAS (1–10)
INSERT INTO quindioflix.contenido_genero VALUES (1,6);
INSERT INTO quindioflix.contenido_genero VALUES (1,4);

INSERT INTO quindioflix.contenido_genero VALUES (2,5);
INSERT INTO quindioflix.contenido_genero VALUES (2,3);

INSERT INTO quindioflix.contenido_genero VALUES (3,1);
INSERT INTO quindioflix.contenido_genero VALUES (3,6);

INSERT INTO quindioflix.contenido_genero VALUES (4,7);
INSERT INTO quindioflix.contenido_genero VALUES (4,4);

INSERT INTO quindioflix.contenido_genero VALUES (5,6);
INSERT INTO quindioflix.contenido_genero VALUES (5,1);

INSERT INTO quindioflix.contenido_genero VALUES (6,1);
INSERT INTO quindioflix.contenido_genero VALUES (6,3);

INSERT INTO quindioflix.contenido_genero VALUES (7,1);
INSERT INTO quindioflix.contenido_genero VALUES (7,4);

INSERT INTO quindioflix.contenido_genero VALUES (8,3);
INSERT INTO quindioflix.contenido_genero VALUES (8,5);

INSERT INTO quindioflix.contenido_genero VALUES (9,6);
INSERT INTO quindioflix.contenido_genero VALUES (9,4);

INSERT INTO quindioflix.contenido_genero VALUES (10,3);
INSERT INTO quindioflix.contenido_genero VALUES (10,5);

-- SERIES (11–20)
INSERT INTO quindioflix.contenido_genero VALUES (11,4);
INSERT INTO quindioflix.contenido_genero VALUES (11,3);

INSERT INTO quindioflix.contenido_genero VALUES (12,2);

INSERT INTO quindioflix.contenido_genero VALUES (13,6);
INSERT INTO quindioflix.contenido_genero VALUES (13,4);

INSERT INTO quindioflix.contenido_genero VALUES (14,2);
INSERT INTO quindioflix.contenido_genero VALUES (14,8);

INSERT INTO quindioflix.contenido_genero VALUES (15,3);
INSERT INTO quindioflix.contenido_genero VALUES (15,4);

INSERT INTO quindioflix.contenido_genero VALUES (16,8);
INSERT INTO quindioflix.contenido_genero VALUES (16,2);

INSERT INTO quindioflix.contenido_genero VALUES (17,4);
INSERT INTO quindioflix.contenido_genero VALUES (17,6);

INSERT INTO quindioflix.contenido_genero VALUES (18,2);

INSERT INTO quindioflix.contenido_genero VALUES (19,3);
INSERT INTO quindioflix.contenido_genero VALUES (19,1);

INSERT INTO quindioflix.contenido_genero VALUES (20,6);
INSERT INTO quindioflix.contenido_genero VALUES (20,4);

-- DOCUMENTALES (21–28)
INSERT INTO quindioflix.contenido_genero VALUES (21,3);
INSERT INTO quindioflix.contenido_genero VALUES (21,8);

INSERT INTO quindioflix.contenido_genero VALUES (22,3);

INSERT INTO quindioflix.contenido_genero VALUES (23,4);
INSERT INTO quindioflix.contenido_genero VALUES (23,3);

INSERT INTO quindioflix.contenido_genero VALUES (24,6);
INSERT INTO quindioflix.contenido_genero VALUES (24,3);

INSERT INTO quindioflix.contenido_genero VALUES (25,3);

INSERT INTO quindioflix.contenido_genero VALUES (26,6);
INSERT INTO quindioflix.contenido_genero VALUES (26,3);

INSERT INTO quindioflix.contenido_genero VALUES (27,8);
INSERT INTO quindioflix.contenido_genero VALUES (27,3);

INSERT INTO quindioflix.contenido_genero VALUES (28,4);
INSERT INTO quindioflix.contenido_genero VALUES (28,3);

-- MÚSICA (29–32)
INSERT INTO quindioflix.contenido_genero VALUES (29,2);
INSERT INTO quindioflix.contenido_genero VALUES (29,3);

INSERT INTO quindioflix.contenido_genero VALUES (30,3);

INSERT INTO quindioflix.contenido_genero VALUES (31,2);

INSERT INTO quindioflix.contenido_genero VALUES (32,2);
INSERT INTO quindioflix.contenido_genero VALUES (32,3);

-- PODCAST (33–36)
INSERT INTO quindioflix.contenido_genero VALUES (33,3);
INSERT INTO quindioflix.contenido_genero VALUES (33,4);

INSERT INTO quindioflix.contenido_genero VALUES (34,3);

INSERT INTO quindioflix.contenido_genero VALUES (35,7);
INSERT INTO quindioflix.contenido_genero VALUES (35,4);

INSERT INTO quindioflix.contenido_genero VALUES (36,3);

-- VARIADOS (37–40)
INSERT INTO quindioflix.contenido_genero VALUES (37,6);
INSERT INTO quindioflix.contenido_genero VALUES (37,1);

INSERT INTO quindioflix.contenido_genero VALUES (38,7);
INSERT INTO quindioflix.contenido_genero VALUES (38,4);

INSERT INTO quindioflix.contenido_genero VALUES (39,6);
INSERT INTO quindioflix.contenido_genero VALUES (39,3);

INSERT INTO quindioflix.contenido_genero VALUES (40,5);
INSERT INTO quindioflix.contenido_genero VALUES (40,3);

-- -------------------------------------
-- CONTENIDO_RELACIONADO
-- -------------------------------------

-- SECUELAS / RELACIONES PRINCIPALES

INSERT INTO quindioflix.contenido_relacionado VALUES (1,9,'SECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (3,7,'SPINOFF');
INSERT INTO quindioflix.contenido_relacionado VALUES (4,38,'SECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (5,24,'VERSION_EXTENDIDA');
INSERT INTO quindioflix.contenido_relacionado VALUES (6,1,'REMAKE');

INSERT INTO quindioflix.contenido_relacionado VALUES (11,17,'PRECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (11,15,'SPINOFF');
INSERT INTO quindioflix.contenido_relacionado VALUES (13,20,'SECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (15,11,'PRECUELA');

INSERT INTO quindioflix.contenido_relacionado VALUES (17,11,'SPINOFF');
INSERT INTO quindioflix.contenido_relacionado VALUES (19,40,'VERSION_EXTENDIDA');
INSERT INTO quindioflix.contenido_relacionado VALUES (20,13,'SECUELA');

-- DOCUMENTALES RELACIONADOS TEMÁTICAMENTE

INSERT INTO quindioflix.contenido_relacionado VALUES (21,25,'REMAKE');
INSERT INTO quindioflix.contenido_relacionado VALUES (23,28,'SPINOFF');
INSERT INTO quindioflix.contenido_relacionado VALUES (24,39,'VERSION_EXTENDIDA');
INSERT INTO quindioflix.contenido_relacionado VALUES (26,24,'REMAKE');
INSERT INTO quindioflix.contenido_relacionado VALUES (27,21,'SPINOFF');

-- TERROR / SUSPENSO

INSERT INTO quindioflix.contenido_relacionado VALUES (4,35,'SECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (35,4,'PRECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (38,4,'SPINOFF');

-- CIENCIA FICCIÓN

INSERT INTO quindioflix.contenido_relacionado VALUES (9,13,'SECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (13,9,'VERSION_EXTENDIDA');
INSERT INTO quindioflix.contenido_relacionado VALUES (24,20,'REMAKE');

-- SERIES Y VARIADOS

INSERT INTO quindioflix.contenido_relacionado VALUES (16,18,'SPINOFF');
INSERT INTO quindioflix.contenido_relacionado VALUES (18,16,'PRECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (14,16,'VERSION_EXTENDIDA');

-- RELACIONES MUSICA / PODCAST (temáticas)

INSERT INTO quindioflix.contenido_relacionado VALUES (29,30,'VERSION_EXTENDIDA');
INSERT INTO quindioflix.contenido_relacionado VALUES (31,32,'REMAKE');

INSERT INTO quindioflix.contenido_relacionado VALUES (33,34,'SPINOFF');
INSERT INTO quindioflix.contenido_relacionado VALUES (34,33,'PRECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (35,36,'REMAKE');

-- RELACIONES ADICIONALES VARIADAS

INSERT INTO quindioflix.contenido_relacionado VALUES (37,3,'SPINOFF');
INSERT INTO quindioflix.contenido_relacionado VALUES (38,1,'PRECUELA');
INSERT INTO quindioflix.contenido_relacionado VALUES (40,15,'VERSION_EXTENDIDA');

-- -------------------------------------
-- TEMPORADAS (15 REGISTROS)
-- -------------------------------------

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (11,1,'Ciudad Sombría - Temporada 1');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (11,2,'Ciudad Sombría - Temporada 2');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (13,1,'Neón 2084 - Inicio del sistema');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (13,2,'Neón 2084 - Resistencia');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (15,1,'Sombras del Pasado - Revelaciones');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (17,1,'Zona Cero - Supervivencia');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (19,1,'Reinos Perdidos - Era Oscura');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (20,1,'Código Humano - Despertar');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (33,1,'Charlas Tech - Temporada 1');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (33,2,'Charlas Tech - IA y futuro');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (34,1,'Mente Emprendedora - Base');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (35,1,'Historias Nocturnas - Terror inicial');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (35,2,'Historias Nocturnas - Relatos avanzados');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (12,1,'Familia Moderna - Vida cotidiana');

INSERT INTO quindioflix.temporadas (id_contenido, numero_temporada, titulo)
VALUES (14,1,'Escuela del Futuro - Generación Alpha');

-- -------------------------------------
-- EPISODIOS (50 REGISTROS)
-- -------------------------------------

-- CIUDAD SOMBRÍA (TEMP 1 y 2)
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (1,1,'El primer caso',45);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (1,2,'Oscuridad en la ciudad',42);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (1,3,'Sospechoso principal',44);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (2,1,'Regreso del detective',46);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (2,2,'Red de corrupción',47);

-- NEÓN 2084
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (3,1,'Inicio del sistema',50);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (3,2,'Control corporativo',52);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (4,1,'La resistencia nace',51);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (4,2,'Hackeo global',53);

-- SOMBRAS DEL PASADO
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (5,1,'Secretos familiares',55);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (5,2,'Verdad oculta',54);

-- ZONA CERO
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (6,1,'Colapso global',60);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (6,2,'Supervivencia extrema',58);

-- REINOS PERDIDOS
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (7,1,'Inicio de la guerra',50);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (7,2,'Traiciones',52);

-- CÓDIGO HUMANO
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (8,1,'Despertar IA',45);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (8,2,'Conciencia artificial',46);

-- CHARLAS TECH
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (9,1,'Introducción tech',40);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (9,2,'Programación básica',42);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (10,1,'IA en la vida real',41);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (10,2,'Futuro digital',43);

-- MENTE EMPRENDEDORA
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (11,1,'Idea de negocio',38);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (11,2,'Escalamiento',39);

-- HISTORIAS NOCTURNAS
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (12,1,'La casa oscura',50);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (12,2,'El visitante',52);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (13,1,'Sombras en la noche',53);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (13,2,'Susurros',51);

-- FAMILIA MODERNA
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (14,1,'Un día normal',30);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (14,2,'Problemas cotidianos',32);

-- ESCUELA DEL FUTURO
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (15,1,'Primer día',40);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (15,2,'Tecnología educativa',41);

-- EPISODIOS EXTRA PARA LLEGAR A 50
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (1,4,'El sospechoso final',45);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (2,3,'Giro inesperado',44);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (3,3,'Caída del sistema',53);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (4,3,'Última batalla',55);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (5,3,'Verdad revelada',54);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (6,3,'Fin del mundo',60);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (7,3,'Rey traidor',52);
INSERT INTO quindioflix.episodios (id_temporada, numero_episodio, titulo, duracion_min) VALUES (8,3,'IA consciente',46);


-- =========================
-- PERFILES (50 REGISTROS)
-- =========================

-- ==================================================
-- USUARIOS PLAN BASICO (solo 1 perfil)
-- Usuarios: 1,4,7,10,11,14,17,20,21,24,27,30
-- ==================================================

INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (1,'Principal','avatar1.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (4,'Principal','avatar4.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (7,'Principal','avatar7.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (10,'Principal','avatar10.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (11,'Principal','avatar11.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (14,'Principal','avatar14.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (17,'Principal','avatar17.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (20,'Principal','avatar20.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (21,'Principal','avatar21.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (24,'Principal','avatar24.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (27,'Principal','avatar27.png','ADULTO');
INSERT INTO quindioflix.perfiles (id_usuario,nombre,avatar,tipo) VALUES (30,'Principal','avatar30.png','ADULTO');

-- ==================================================
-- USUARIOS PLAN ESTANDAR (máximo 2 perfiles)
-- Usuarios: 2,5,8,12,15,18,22,25,28
-- ==================================================

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,2,'Principal','avatar2.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,2,'Kids','avatar_k2.png','INFANTIL');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,5,'Principal','avatar5.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,5,'Kids','avatar_k5.png','INFANTIL');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,8,'Principal','avatar8.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,8,'Secundario','avatar8b.png','ADULTO');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,12,'Principal','avatar12.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,12,'Kids','avatar_k12.png','INFANTIL');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,15,'Principal','avatar15.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,15,'Pareja','avatar15b.png','ADULTO');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,18,'Principal','avatar18.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,18,'Kids','avatar_k18.png','INFANTIL');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,22,'Principal','avatar22.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,22,'Kids','avatar_k22.png','INFANTIL');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,25,'Principal','avatar25.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,25,'Kids','avatar_k25.png','INFANTIL');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,28,'Principal','avatar28.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,28,'Kids','avatar_k28.png','INFANTIL');

-- ==================================================
-- USUARIOS PLAN PREMIUM (máximo 4 perfiles)
-- Usuarios:3,6,9,13,16,19,23,26,29
-- ==================================================

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,3,'Principal','avatar3.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,3,'Kids','avatar3k.png','INFANTIL');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,3,'Pareja','avatar3b.png','ADULTO');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,6,'Principal','avatar6.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,6,'Secundario','avatar6b.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,6,'Kids','avatar6k.png','INFANTIL');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,9,'Principal','avatar9.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,9,'Kids','avatar9k.png','INFANTIL');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,9,'Admin','avatar9b.png','ADULTO');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,13,'Principal','avatar13.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,13,'Secundario','avatar13b.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,13,'Kids','avatar13k.png','INFANTIL');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,16,'Principal','avatar16.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,16,'Kids','avatar16k.png','INFANTIL');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,16,'Pareja','avatar16b.png','ADULTO');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,19,'Principal','avatar19.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,19,'Kids','avatar19k.png','INFANTIL');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,19,'Admin','avatar19b.png','ADULTO');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,23,'Principal','avatar23.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,23,'Kids','avatar23k.png','INFANTIL');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,23,'Pareja','avatar23b.png','ADULTO');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,26,'Principal','avatar26.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,26,'Kids','avatar26k.png','INFANTIL');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,26,'Admin','avatar26b.png','ADULTO');

INSERT INTO quindioflix.perfiles VALUES (DEFAULT,29,'Principal','avatar29.png','ADULTO');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,29,'Kids','avatar29k.png','INFANTIL');
INSERT INTO quindioflix.perfiles VALUES (DEFAULT,29,'Secundario','avatar29b.png','ADULTO');

select * from perfiles;

-- =========================
-- REPRODUCCIONES
-- =========================

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (1,3,TO_DATE('2026-01-01','YYYY-MM-DD'),TO_DATE('2026-01-01','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (2,9,TO_DATE('2026-01-02','YYYY-MM-DD'),NULL,'CELULAR',65);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (3,11,TO_DATE('2026-01-03','YYYY-MM-DD'),NULL,'COMPUTADOR',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (4,15,TO_DATE('2026-01-04','YYYY-MM-DD'),TO_DATE('2026-01-04','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (5,19,TO_DATE('2026-01-05','YYYY-MM-DD'),NULL,'TABLET',70);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (6,24,TO_DATE('2026-01-06','YYYY-MM-DD'),TO_DATE('2026-01-06','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (7,17,TO_DATE('2026-01-07','YYYY-MM-DD'),NULL,'CELULAR',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (8,18,TO_DATE('2026-01-08','YYYY-MM-DD'),TO_DATE('2026-01-08','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (9,20,TO_DATE('2026-01-09','YYYY-MM-DD'),NULL,'COMPUTADOR',50);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (10,12,TO_DATE('2026-01-10','YYYY-MM-DD'),TO_DATE('2026-01-10','YYYY-MM-DD'),'TV',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (11,15,TO_DATE('2026-01-11','YYYY-MM-DD'),NULL,'CELULAR',45);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (12,22,TO_DATE('2026-01-12','YYYY-MM-DD'),TO_DATE('2026-01-12','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (13,2,TO_DATE('2026-01-13','YYYY-MM-DD'),NULL,'TABLET',75);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (14,16,TO_DATE('2026-01-14','YYYY-MM-DD'),TO_DATE('2026-01-14','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (15,40,TO_DATE('2026-01-15','YYYY-MM-DD'),NULL,'TV',65);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (16,14,TO_DATE('2026-01-16','YYYY-MM-DD'),NULL,'TABLET',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (17,13,TO_DATE('2026-01-17','YYYY-MM-DD'),TO_DATE('2026-01-17','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (18,18,TO_DATE('2026-01-18','YYYY-MM-DD'),NULL,'CELULAR',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (19,6,TO_DATE('2026-01-19','YYYY-MM-DD'),TO_DATE('2026-01-19','YYYY-MM-DD'),'COMPUTADOR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (20,38,TO_DATE('2026-01-20','YYYY-MM-DD'),NULL,'TV',45);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (21,27,TO_DATE('2026-01-21','YYYY-MM-DD'),TO_DATE('2026-01-21','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (22,23,TO_DATE('2026-01-22','YYYY-MM-DD'),NULL,'CELULAR',58);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (23,15,TO_DATE('2026-01-23','YYYY-MM-DD'),TO_DATE('2026-01-23','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (24,39,TO_DATE('2026-01-24','YYYY-MM-DD'),NULL,'COMPUTADOR',66);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (25,21,TO_DATE('2026-01-25','YYYY-MM-DD'),TO_DATE('2026-01-25','YYYY-MM-DD'),'TV',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (26,25,TO_DATE('2026-01-26','YYYY-MM-DD'),NULL,'CELULAR',49);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (27,30,TO_DATE('2026-01-27','YYYY-MM-DD'),TO_DATE('2026-01-27','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (28,28,TO_DATE('2026-01-28','YYYY-MM-DD'),NULL,'TABLET',61);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (29,29,TO_DATE('2026-01-29','YYYY-MM-DD'),TO_DATE('2026-01-29','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (30,31,TO_DATE('2026-01-30','YYYY-MM-DD'),NULL,'COMPUTADOR',55);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (31,12,TO_DATE('2026-01-31','YYYY-MM-DD'),TO_DATE('2026-01-31','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (32,18,TO_DATE('2026-02-01','YYYY-MM-DD'),NULL,'CELULAR',64);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (33,34,TO_DATE('2026-02-02','YYYY-MM-DD'),TO_DATE('2026-02-02','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (34,36,TO_DATE('2026-02-03','YYYY-MM-DD'),NULL,'COMPUTADOR',57);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (35,35,TO_DATE('2026-02-04','YYYY-MM-DD'),TO_DATE('2026-02-04','YYYY-MM-DD'),'TV',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (36,12,TO_DATE('2026-02-05','YYYY-MM-DD'),NULL,'CELULAR',72);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (37,7,TO_DATE('2026-02-06','YYYY-MM-DD'),TO_DATE('2026-02-06','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (38,16,TO_DATE('2026-02-07','YYYY-MM-DD'),NULL,'TABLET',43);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (39,24,TO_DATE('2026-02-08','YYYY-MM-DD'),TO_DATE('2026-02-08','YYYY-MM-DD'),'COMPUTADOR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (40,40,TO_DATE('2026-02-09','YYYY-MM-DD'),NULL,'TV',68);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (41,13,TO_DATE('2026-02-10','YYYY-MM-DD'),NULL,'CELULAR',59);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (42,34,TO_DATE('2026-02-11','YYYY-MM-DD'),TO_DATE('2026-02-11','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (43,16,TO_DATE('2026-02-12','YYYY-MM-DD'),NULL,'TABLET',75);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (44,18,TO_DATE('2026-02-13','YYYY-MM-DD'),TO_DATE('2026-02-13','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (45,11,TO_DATE('2026-02-14','YYYY-MM-DD'),NULL,'COMPUTADOR',52);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (46,19,TO_DATE('2026-02-15','YYYY-MM-DD'),TO_DATE('2026-02-15','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (47,23,TO_DATE('2026-02-16','YYYY-MM-DD'),NULL,'CELULAR',63);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (48,26,TO_DATE('2026-02-17','YYYY-MM-DD'),TO_DATE('2026-02-17','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (49,29,TO_DATE('2026-02-18','YYYY-MM-DD'),NULL,'COMPUTADOR',54);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (50,40,TO_DATE('2026-02-19','YYYY-MM-DD'),TO_DATE('2026-02-19','YYYY-MM-DD'),'TV',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (51,23,TO_DATE('2026-02-20','YYYY-MM-DD'),NULL,'CELULAR',62);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (52,26,TO_DATE('2026-02-21','YYYY-MM-DD'),TO_DATE('2026-02-21','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (53,27,TO_DATE('2026-02-22','YYYY-MM-DD'),NULL,'TABLET',58);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (54,39,TO_DATE('2026-02-23','YYYY-MM-DD'),TO_DATE('2026-02-23','YYYY-MM-DD'),'COMPUTADOR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (55,29,TO_DATE('2026-02-24','YYYY-MM-DD'),NULL,'CELULAR',49);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (56,29,TO_DATE('2026-02-25','YYYY-MM-DD'),TO_DATE('2026-02-25','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (57,32,TO_DATE('2026-02-26','YYYY-MM-DD'),NULL,'CELULAR',66);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (1,5,TO_DATE('2026-02-27','YYYY-MM-DD'),TO_DATE('2026-02-27','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (2,11,TO_DATE('2026-02-28','YYYY-MM-DD'),NULL,'COMPUTADOR',57);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (3,13,TO_DATE('2026-03-01','YYYY-MM-DD'),TO_DATE('2026-03-01','YYYY-MM-DD'),'TV',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (4,17,TO_DATE('2026-03-02','YYYY-MM-DD'),NULL,'CELULAR',61);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (5,20,TO_DATE('2026-03-03','YYYY-MM-DD'),TO_DATE('2026-03-03','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (6,22,TO_DATE('2026-03-04','YYYY-MM-DD'),NULL,'TABLET',53);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (7,17,TO_DATE('2026-03-05','YYYY-MM-DD'),TO_DATE('2026-03-05','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (8,18,TO_DATE('2026-03-06','YYYY-MM-DD'),NULL,'COMPUTADOR',59);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (9,24,TO_DATE('2026-03-07','YYYY-MM-DD'),TO_DATE('2026-03-07','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (10,12,TO_DATE('2026-03-08','YYYY-MM-DD'),NULL,'CELULAR',45);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (11,15,TO_DATE('2026-03-09','YYYY-MM-DD'),TO_DATE('2026-03-09','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (12,22,TO_DATE('2026-03-10','YYYY-MM-DD'),NULL,'TV',68);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (13,2,TO_DATE('2026-03-11','YYYY-MM-DD'),TO_DATE('2026-03-11','YYYY-MM-DD'),'CELULAR',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (14,16,TO_DATE('2026-03-12','YYYY-MM-DD'),NULL,'COMPUTADOR',54);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (15,40,TO_DATE('2026-03-13','YYYY-MM-DD'),TO_DATE('2026-03-13','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (16,14,TO_DATE('2026-03-14','YYYY-MM-DD'),NULL,'CELULAR',63);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (17,13,TO_DATE('2026-03-15','YYYY-MM-DD'),TO_DATE('2026-03-15','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (18,18,TO_DATE('2026-03-16','YYYY-MM-DD'),NULL,'TV',55);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (19,6,TO_DATE('2026-03-17','YYYY-MM-DD'),TO_DATE('2026-03-17','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (20,38,TO_DATE('2026-03-18','YYYY-MM-DD'),NULL,'COMPUTADOR',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (21,27,TO_DATE('2026-03-19','YYYY-MM-DD'),TO_DATE('2026-03-19','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (22,23,TO_DATE('2026-03-20','YYYY-MM-DD'),NULL,'CELULAR',47);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (23,15,TO_DATE('2026-03-21','YYYY-MM-DD'),TO_DATE('2026-03-21','YYYY-MM-DD'),'TABLET',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (24,39,TO_DATE('2026-03-22','YYYY-MM-DD'),NULL,'TV',69);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (25,21,TO_DATE('2026-03-23','YYYY-MM-DD'),TO_DATE('2026-03-23','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (26,25,TO_DATE('2026-03-24','YYYY-MM-DD'),NULL,'COMPUTADOR',52);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (27,30,TO_DATE('2026-03-25','YYYY-MM-DD'),TO_DATE('2026-03-25','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (28,28,TO_DATE('2026-03-26','YYYY-MM-DD'),NULL,'CELULAR',61);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (29,29,TO_DATE('2026-03-27','YYYY-MM-DD'),TO_DATE('2026-03-27','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (30,31,TO_DATE('2026-03-28','YYYY-MM-DD'),NULL,'TV',56);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (31,12,TO_DATE('2026-03-29','YYYY-MM-DD'),TO_DATE('2026-03-29','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (32,18,TO_DATE('2026-03-30','YYYY-MM-DD'),NULL,'COMPUTADOR',58);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (33,34,TO_DATE('2026-03-31','YYYY-MM-DD'),TO_DATE('2026-03-31','YYYY-MM-DD'),'TV',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (34,36,TO_DATE('2026-04-01','YYYY-MM-DD'),NULL,'CELULAR',64);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (35,35,TO_DATE('2026-04-02','YYYY-MM-DD'),TO_DATE('2026-04-02','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (36,12,TO_DATE('2026-04-03','YYYY-MM-DD'),NULL,'TV',46);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (37,7,TO_DATE('2026-04-04','YYYY-MM-DD'),TO_DATE('2026-04-04','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (38,21,TO_DATE('2026-04-05','YYYY-MM-DD'),NULL,'COMPUTADOR',57);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (39,24,TO_DATE('2026-04-06','YYYY-MM-DD'),TO_DATE('2026-04-06','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (40,40,TO_DATE('2026-04-07','YYYY-MM-DD'),NULL,'CELULAR',62);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (41,13,TO_DATE('2026-04-08','YYYY-MM-DD'),TO_DATE('2026-04-08','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (42,34,TO_DATE('2026-04-09','YYYY-MM-DD'),NULL,'TV',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (43,16,TO_DATE('2026-04-10','YYYY-MM-DD'),TO_DATE('2026-04-10','YYYY-MM-DD'),'CELULAR',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (43,16,TO_DATE('2026-04-11','YYYY-MM-DD'),TO_DATE('2026-04-11','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (44,27,TO_DATE('2026-04-12','YYYY-MM-DD'),NULL,'TV',65);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (45,15,TO_DATE('2026-04-13','YYYY-MM-DD'),NULL,'CELULAR',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (46,19,TO_DATE('2026-04-14','YYYY-MM-DD'),TO_DATE('2026-04-14','YYYY-MM-DD'),'COMPUTADOR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (47,16,TO_DATE('2026-04-15','YYYY-MM-DD'),NULL,'TABLET',80);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (48,23,TO_DATE('2026-04-16','YYYY-MM-DD'),TO_DATE('2026-04-16','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (49,12,TO_DATE('2026-04-17','YYYY-MM-DD'),NULL,'CELULAR',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (50,27,TO_DATE('2026-04-18','YYYY-MM-DD'),NULL,'TV',75);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (51,40,TO_DATE('2026-04-19','YYYY-MM-DD'),TO_DATE('2026-04-19','YYYY-MM-DD'),'COMPUTADOR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (52,26,TO_DATE('2026-04-20','YYYY-MM-DD'),NULL,'CELULAR',70);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (53,27,TO_DATE('2026-04-21','YYYY-MM-DD'),TO_DATE('2026-04-21','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (54,39,TO_DATE('2026-04-22','YYYY-MM-DD'),NULL,'TV',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (55,29,TO_DATE('2026-04-23','YYYY-MM-DD'),TO_DATE('2026-04-23','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (56,16,TO_DATE('2026-04-24','YYYY-MM-DD'),NULL,'TABLET',85);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (57,29,TO_DATE('2026-04-25','YYYY-MM-DD'),NULL,'TV',65);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (1,3,TO_DATE('2026-04-26','YYYY-MM-DD'),TO_DATE('2026-04-26','YYYY-MM-DD'),'COMPUTADOR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (2,2,TO_DATE('2026-04-27','YYYY-MM-DD'),NULL,'CELULAR',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (3,24,TO_DATE('2026-04-28','YYYY-MM-DD'),TO_DATE('2026-04-28','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (4,38,TO_DATE('2026-04-29','YYYY-MM-DD'),NULL,'TABLET',50);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (5,20,TO_DATE('2026-04-30','YYYY-MM-DD'),NULL,'TV',70);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (6,6,TO_DATE('2026-05-01','YYYY-MM-DD'),TO_DATE('2026-05-01','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (7,17,TO_DATE('2026-05-02','YYYY-MM-DD'),NULL,'COMPUTADOR',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (8,10,TO_DATE('2026-05-03','YYYY-MM-DD'),NULL,'TV',65);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (9,24,TO_DATE('2026-05-04','YYYY-MM-DD'),TO_DATE('2026-05-04','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (10,18,TO_DATE('2026-05-05','YYYY-MM-DD'),NULL,'CELULAR',75);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (11,11,TO_DATE('2026-05-06','YYYY-MM-DD'),NULL,'TV',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (12,12,TO_DATE('2026-05-07','YYYY-MM-DD'),TO_DATE('2026-05-07','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (13,5,TO_DATE('2026-05-08','YYYY-MM-DD'),NULL,'COMPUTADOR',50);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (14,16,TO_DATE('2026-05-09','YYYY-MM-DD'),TO_DATE('2026-05-09','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (15,40,TO_DATE('2026-05-10','YYYY-MM-DD'),NULL,'CELULAR',65);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (16,22,TO_DATE('2026-05-11','YYYY-MM-DD'),NULL,'TABLET',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (17,28,TO_DATE('2026-05-12','YYYY-MM-DD'),TO_DATE('2026-05-12','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (18,16,TO_DATE('2026-05-13','YYYY-MM-DD'),NULL,'CELULAR',80);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (19,7,TO_DATE('2026-05-14','YYYY-MM-DD'),NULL,'COMPUTADOR',45);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (20,30,TO_DATE('2026-05-15','YYYY-MM-DD'),TO_DATE('2026-05-15','YYYY-MM-DD'),'TV',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (21,21,TO_DATE('2026-05-16','YYYY-MM-DD'),NULL,'CELULAR',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (22,34,TO_DATE('2026-05-17','YYYY-MM-DD'),NULL,'TABLET',70);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (23,15,TO_DATE('2026-05-18','YYYY-MM-DD'),TO_DATE('2026-05-18','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (24,39,TO_DATE('2026-05-19','YYYY-MM-DD'),NULL,'COMPUTADOR',50);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (25,12,TO_DATE('2026-05-20','YYYY-MM-DD'),NULL,'CELULAR',65);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (26,25,TO_DATE('2026-05-21','YYYY-MM-DD'),TO_DATE('2026-05-21','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (27,11,TO_DATE('2026-05-22','YYYY-MM-DD'),NULL,'CELULAR',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (28,30,TO_DATE('2026-05-23','YYYY-MM-DD'),NULL,'TABLET',75);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (29,18,TO_DATE('2026-05-24','YYYY-MM-DD'),TO_DATE('2026-05-24','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (30,3,TO_DATE('2026-05-25','YYYY-MM-DD'),NULL,'COMPUTADOR',60);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (31,13,TO_DATE('2026-05-26','YYYY-MM-DD'),NULL,'CELULAR',65);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (32,32,TO_DATE('2026-05-27','YYYY-MM-DD'),TO_DATE('2026-05-27','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (33,24,TO_DATE('2026-05-28','YYYY-MM-DD'),NULL,'TABLET',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (34,35,TO_DATE('2026-05-29','YYYY-MM-DD'),NULL,'CELULAR',70);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (35,40,TO_DATE('2026-05-30','YYYY-MM-DD'),TO_DATE('2026-05-30','YYYY-MM-DD'),'TV',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (36,2,TO_DATE('2026-05-31','YYYY-MM-DD'),NULL,'CELULAR',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (37,37,TO_DATE('2026-06-01','YYYY-MM-DD'),TO_DATE('2026-06-01','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (38,28,TO_DATE('2026-06-02','YYYY-MM-DD'),NULL,'TABLET',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (39,39,TO_DATE('2026-06-03','YYYY-MM-DD'),NULL,'COMPUTADOR',70);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (40,12,TO_DATE('2026-06-04','YYYY-MM-DD'),TO_DATE('2026-06-04','YYYY-MM-DD'),'CELULAR',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (41,20,TO_DATE('2026-06-05','YYYY-MM-DD'),NULL,'TV',65);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (42,33,TO_DATE('2026-06-06','YYYY-MM-DD'),NULL,'CELULAR',50);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (43,16,TO_DATE('2026-06-07','YYYY-MM-DD'),TO_DATE('2026-06-07','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (44,27,TO_DATE('2026-06-08','YYYY-MM-DD'),NULL,'COMPUTADOR',45);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (45,15,TO_DATE('2026-06-09','YYYY-MM-DD'),NULL,'TV',75);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (46,23,TO_DATE('2026-06-10','YYYY-MM-DD'),TO_DATE('2026-06-10','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (47,24,TO_DATE('2026-06-11','YYYY-MM-DD'),NULL,'TABLET',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (48,26,TO_DATE('2026-06-12','YYYY-MM-DD'),NULL,'TV',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (49,29,TO_DATE('2026-06-13','YYYY-MM-DD'),TO_DATE('2026-06-13','YYYY-MM-DD'),'COMPUTADOR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (50,40,TO_DATE('2026-06-14','YYYY-MM-DD'),NULL,'CELULAR',70);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (51,22,TO_DATE('2026-06-15','YYYY-MM-DD'),NULL,'TV',50);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (52,26,TO_DATE('2026-06-16','YYYY-MM-DD'),TO_DATE('2026-06-16','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (53,27,TO_DATE('2026-06-17','YYYY-MM-DD'),NULL,'TABLET',65);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (54,39,TO_DATE('2026-06-18','YYYY-MM-DD'),NULL,'TV',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (55,29,TO_DATE('2026-06-19','YYYY-MM-DD'),TO_DATE('2026-06-19','YYYY-MM-DD'),'COMPUTADOR',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (56,30,TO_DATE('2026-06-20','YYYY-MM-DD'),NULL,'CELULAR',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (57,29,TO_DATE('2026-06-21','YYYY-MM-DD'),NULL,'TV',75);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (1,5,TO_DATE('2026-06-22','YYYY-MM-DD'),TO_DATE('2026-06-22','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (2,18,TO_DATE('2026-06-23','YYYY-MM-DD'),NULL,'COMPUTADOR',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (3,10,TO_DATE('2026-06-24','YYYY-MM-DD'),NULL,'CELULAR',65);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (4,11,TO_DATE('2026-06-25','YYYY-MM-DD'),TO_DATE('2026-06-25','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (5,21,TO_DATE('2026-06-26','YYYY-MM-DD'),NULL,'CELULAR',50);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (6,3,TO_DATE('2026-06-27','YYYY-MM-DD'),NULL,'TABLET',70);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (7,24,TO_DATE('2026-06-28','YYYY-MM-DD'),TO_DATE('2026-06-28','YYYY-MM-DD'),'TV',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (8,35,TO_DATE('2026-06-29','YYYY-MM-DD'),NULL,'COMPUTADOR',60);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (9,12,TO_DATE('2026-06-30','YYYY-MM-DD'),NULL,'CELULAR',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (10,16,TO_DATE('2026-07-01','YYYY-MM-DD'),TO_DATE('2026-07-01','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (11,40,TO_DATE('2026-07-02','YYYY-MM-DD'),NULL,'TV',65);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (12,22,TO_DATE('2026-07-03','YYYY-MM-DD'),NULL,'CELULAR',45);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (13,28,TO_DATE('2026-07-04','YYYY-MM-DD'),TO_DATE('2026-07-04','YYYY-MM-DD'),'COMPUTADOR',100);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (14,13,TO_DATE('2026-07-05','YYYY-MM-DD'),NULL,'TV',60);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (15,32,TO_DATE('2026-07-06','YYYY-MM-DD'),NULL,'CELULAR',75);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (16,24,TO_DATE('2026-07-07','YYYY-MM-DD'),TO_DATE('2026-07-07','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (17,35,TO_DATE('2026-07-08','YYYY-MM-DD'),NULL,'TV',50);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (18,40,TO_DATE('2026-07-09','YYYY-MM-DD'),NULL,'COMPUTADOR',70);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (19,25,TO_DATE('2026-07-10','YYYY-MM-DD'),TO_DATE('2026-07-10','YYYY-MM-DD'),'CELULAR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (20,37,TO_DATE('2026-07-11','YYYY-MM-DD'),NULL,'TV',65);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (21,29,TO_DATE('2026-07-12','YYYY-MM-DD'),NULL,'TABLET',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (22,39,TO_DATE('2026-07-13','YYYY-MM-DD'),TO_DATE('2026-07-13','YYYY-MM-DD'),'COMPUTADOR',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (23,12,TO_DATE('2026-07-14','YYYY-MM-DD'),NULL,'CELULAR',60);

INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (24,20,TO_DATE('2026-07-15','YYYY-MM-DD'),NULL,'TV',45);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (25,33,TO_DATE('2026-07-16','YYYY-MM-DD'),TO_DATE('2026-07-16','YYYY-MM-DD'),'TABLET',100);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (26,16,TO_DATE('2026-07-17','YYYY-MM-DD'),NULL,'COMPUTADOR',55);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (27,4,TO_DATE('2026-07-18','YYYY-MM-DD'),NULL,'CELULAR',70);
INSERT INTO quindioflix.reproducciones (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance) VALUES (28,15,TO_DATE('2026-07-19','YYYY-MM-DD'),TO_DATE('2026-07-19','YYYY-MM-DD'),'TV',100);


-- =========================
-- FAVORITOS (40 REGISTROS)
-- =========================

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (1,3,TO_DATE('2026-01-10','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (1,5,TO_DATE('2026-06-22','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (2,9,TO_DATE('2026-01-12','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (2,18,TO_DATE('2026-06-23','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (3,11,TO_DATE('2026-01-15','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (3,24,TO_DATE('2026-04-28','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (4,15,TO_DATE('2026-01-16','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (4,38,TO_DATE('2026-04-29','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (5,19,TO_DATE('2026-01-19','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (5,20,TO_DATE('2026-04-30','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (6,24,TO_DATE('2026-01-06','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (6,3,TO_DATE('2026-06-27','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (7,17,TO_DATE('2026-01-07','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (7,24,TO_DATE('2026-06-28','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (8,18,TO_DATE('2026-01-08','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (8,35,TO_DATE('2026-06-29','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (9,20,TO_DATE('2026-01-09','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (9,24,TO_DATE('2026-05-04','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (10,12,TO_DATE('2026-01-10','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (10,16,TO_DATE('2026-07-01','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (11,15,TO_DATE('2026-01-11','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (11,40,TO_DATE('2026-07-02','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (12,22,TO_DATE('2026-01-12','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (12,12,TO_DATE('2026-05-07','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (13,2,TO_DATE('2026-01-13','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (13,28,TO_DATE('2026-07-04','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (14,16,TO_DATE('2026-01-14','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (14,13,TO_DATE('2026-07-05','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (15,40,TO_DATE('2026-01-15','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (15,32,TO_DATE('2026-07-06','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (16,14,TO_DATE('2026-01-16','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (16,24,TO_DATE('2026-07-07','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (17,13,TO_DATE('2026-01-17','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (17,35,TO_DATE('2026-07-08','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (18,18,TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (18,40,TO_DATE('2026-07-09','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (19,6,TO_DATE('2026-01-19','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (19,25,TO_DATE('2026-07-10','YYYY-MM-DD'));

INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (20,38,TO_DATE('2026-01-20','YYYY-MM-DD'));
INSERT INTO quindioflix.favoritos (id_perfil,id_contenido,fecha_agregado) VALUES (20,37,TO_DATE('2026-07-11','YYYY-MM-DD'));

-- =========================
-- CALIFICACIONES (60 REGISTROS CORREGIDOS)
-- Basadas en perfiles y contenidos existentes en REPRODUCCIONES
-- =========================

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (1,3,5,'Excelente historia',TO_DATE('2026-01-02','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (2,9,4,'Muy buena trama',TO_DATE('2026-01-03','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (3,11,5,'Excelente serie',TO_DATE('2026-01-04','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (4,15,4,'Interesante',TO_DATE('2026-01-05','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (5,19,5,'Muy emocionante',TO_DATE('2026-01-06','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (6,24,5,'Excelente documental',TO_DATE('2026-01-07','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (7,17,4,'Muy intensa',TO_DATE('2026-01-08','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (8,18,4,'Divertida',TO_DATE('2026-01-09','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (9,20,5,'Gran historia IA',TO_DATE('2026-01-10','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (10,12,5,'Muy divertida',TO_DATE('2026-01-11','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (11,15,3,'Algo lenta',TO_DATE('2026-01-12','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (12,22,4,'Buen documental',TO_DATE('2026-01-13','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (13,2,4,'Romántica y buena',TO_DATE('2026-01-14','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (14,16,5,'Excelente para niños',TO_DATE('2026-01-15','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (15,40,4,'Interesante serie',TO_DATE('2026-01-16','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (16,14,4,'Buena serie',TO_DATE('2026-01-17','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (17,13,5,'Gran ciencia ficción',TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (18,18,4,'Muy divertida',TO_DATE('2026-01-19','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (19,6,4,'Acción buena',TO_DATE('2026-01-20','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (20,38,3,'Aceptable',TO_DATE('2026-01-21','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (21,27,5,'Excelente naturaleza',TO_DATE('2026-01-22','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (22,23,4,'Interesante caso',TO_DATE('2026-01-23','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (23,15,4,'Buena trama',TO_DATE('2026-01-24','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (24,39,5,'Excelente documental',TO_DATE('2026-01-25','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (25,21,5,'Muy educativo',TO_DATE('2026-01-26','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (26,25,4,'Muy bueno',TO_DATE('2026-01-27','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (27,30,4,'Buen concierto',TO_DATE('2026-01-28','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (28,28,3,'Regular',TO_DATE('2026-01-29','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (29,29,5,'Excelente música',TO_DATE('2026-01-30','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (30,31,4,'Buen ritmo',TO_DATE('2026-01-31','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (31,12,5,'Muy divertida',TO_DATE('2026-02-01','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (32,18,4,'Entretenida',TO_DATE('2026-02-02','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (33,34,4,'Buen podcast',TO_DATE('2026-02-03','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (34,36,5,'Excelente ciencia',TO_DATE('2026-02-04','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (35,35,3,'Regular',TO_DATE('2026-02-05','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (36,12,4,'Buena comedia',TO_DATE('2026-02-06','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (37,7,5,'Excelente película',TO_DATE('2026-02-07','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (38,16,5,'Ideal para niños',TO_DATE('2026-02-08','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (39,24,5,'Gran contenido',TO_DATE('2026-02-09','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (40,40,4,'Interesante',TO_DATE('2026-02-10','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (41,13,4,'Buena serie',TO_DATE('2026-02-11','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (42,34,4,'Buen podcast',TO_DATE('2026-02-12','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (43,16,5,'Excelente',TO_DATE('2026-02-13','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (44,18,4,'Divertida',TO_DATE('2026-02-14','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (45,11,3,'Aceptable',TO_DATE('2026-02-15','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (46,19,4,'Buena serie',TO_DATE('2026-02-16','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (47,23,4,'Interesante',TO_DATE('2026-02-17','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (48,26,5,'Innovador',TO_DATE('2026-02-18','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (49,29,5,'Excelente música',TO_DATE('2026-02-19','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (50,40,4,'Muy buena',TO_DATE('2026-02-20','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (51,23,4,'Buen documental',TO_DATE('2026-02-21','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (52,26,5,'Excelente',TO_DATE('2026-02-22','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (53,27,4,'Muy bueno',TO_DATE('2026-02-23','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (54,39,5,'Gran documental',TO_DATE('2026-02-24','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (55,29,5,'Excelente música',TO_DATE('2026-02-25','YYYY-MM-DD'));

INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (56,29,4,'Muy bueno',TO_DATE('2026-02-26','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (57,32,4,'Buen rock',TO_DATE('2026-02-27','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (1,5,5,'Excelente película',TO_DATE('2026-02-28','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (2,11,4,'Muy buena serie',TO_DATE('2026-03-01','YYYY-MM-DD'));
INSERT INTO quindioflix.calificaciones (id_perfil,id_contenido,estrellas,resena,fecha_calificacion) VALUES (3,13,5,'Excelente ciencia ficción',TO_DATE('2026-03-02','YYYY-MM-DD'));

select * from calificaciones;

-- -------------------------------------
-- PAGOS (80)
-- -------------------------------------

-- Método de pago
-- =========================
-- METODOS_PAGO
-- =========================

INSERT INTO quindioflix.metodos_pago (nombre_metodo, descripcion)
VALUES ('TARJETA','Pago con tarjeta débito o crédito');

INSERT INTO quindioflix.metodos_pago (nombre_metodo, descripcion)
VALUES ('PSE','Pago en línea desde cuenta bancaria');

INSERT INTO quindioflix.metodos_pago (nombre_metodo, descripcion)
VALUES ('NEQUI','Pago digital mediante billetera Nequi');

INSERT INTO quindioflix.metodos_pago (nombre_metodo, descripcion)
VALUES ('DAVIPLATA','Pago digital mediante Daviplata');

INSERT INTO quindioflix.metodos_pago (nombre_metodo, descripcion)
VALUES ('PAYPAL','Pago internacional con cuenta PayPal');

-- =========================
-- PAGOS (80 REGISTROS CORREGIDOS)
-- Estructura nueva:
-- (id_usuario, id_metodo_pago, fecha_pago, monto, estado_pago)
--
-- MÉTODOS DE PAGO:
-- 1 = TARJETA
-- 2 = PSE
-- 3 = NEQUI
-- 4 = DAVIPLATA
-- 5 = PAYPAL
-- =========================

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (1,3,TO_DATE('2026-01-01','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (2,2,TO_DATE('2026-01-02','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (3,1,TO_DATE('2026-01-03','YYYY-MM-DD'),35000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (4,4,TO_DATE('2026-01-04','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (5,3,TO_DATE('2026-01-05','YYYY-MM-DD'),40000,'PENDIENTE');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (6,1,TO_DATE('2026-01-06','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (7,2,TO_DATE('2026-01-07','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (8,3,TO_DATE('2026-01-08','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (9,4,TO_DATE('2026-01-09','YYYY-MM-DD'),25000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (10,2,TO_DATE('2026-01-10','YYYY-MM-DD'),18000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (11,3,TO_DATE('2026-01-11','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (12,1,TO_DATE('2026-01-12','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (13,2,TO_DATE('2026-01-13','YYYY-MM-DD'),40000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (14,3,TO_DATE('2026-01-14','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (15,4,TO_DATE('2026-01-15','YYYY-MM-DD'),25000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (16,1,TO_DATE('2026-01-16','YYYY-MM-DD'),35000,'REEMBOLSADO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (17,2,TO_DATE('2026-01-17','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (18,3,TO_DATE('2026-01-18','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (19,1,TO_DATE('2026-01-19','YYYY-MM-DD'),40000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (20,2,TO_DATE('2026-01-20','YYYY-MM-DD'),25000,'FALLIDO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (21,3,TO_DATE('2026-02-01','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (22,2,TO_DATE('2026-02-02','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (23,1,TO_DATE('2026-02-03','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (24,4,TO_DATE('2026-02-04','YYYY-MM-DD'),40000,'PENDIENTE');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (25,3,TO_DATE('2026-02-05','YYYY-MM-DD'),25000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (26,1,TO_DATE('2026-02-06','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (27,2,TO_DATE('2026-02-07','YYYY-MM-DD'),25000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (28,3,TO_DATE('2026-02-08','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (29,4,TO_DATE('2026-02-09','YYYY-MM-DD'),40000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (30,1,TO_DATE('2026-02-10','YYYY-MM-DD'),25000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (1,2,TO_DATE('2026-02-11','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (2,3,TO_DATE('2026-02-12','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (3,1,TO_DATE('2026-02-13','YYYY-MM-DD'),35000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (4,4,TO_DATE('2026-02-14','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (5,2,TO_DATE('2026-02-15','YYYY-MM-DD'),40000,'PENDIENTE');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (6,3,TO_DATE('2026-02-16','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (7,1,TO_DATE('2026-02-17','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (8,2,TO_DATE('2026-02-18','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (9,4,TO_DATE('2026-02-19','YYYY-MM-DD'),25000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (10,3,TO_DATE('2026-02-20','YYYY-MM-DD'),18000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (11,3,TO_DATE('2026-03-01','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (12,2,TO_DATE('2026-03-02','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (13,1,TO_DATE('2026-03-03','YYYY-MM-DD'),40000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (14,4,TO_DATE('2026-03-04','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (15,3,TO_DATE('2026-03-05','YYYY-MM-DD'),25000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (16,2,TO_DATE('2026-03-06','YYYY-MM-DD'),35000,'REEMBOLSADO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (17,1,TO_DATE('2026-03-07','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (18,3,TO_DATE('2026-03-08','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (19,4,TO_DATE('2026-03-09','YYYY-MM-DD'),40000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (20,2,TO_DATE('2026-03-10','YYYY-MM-DD'),25000,'FALLIDO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (21,3,TO_DATE('2026-03-11','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (22,1,TO_DATE('2026-03-12','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (23,2,TO_DATE('2026-03-13','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (24,4,TO_DATE('2026-03-14','YYYY-MM-DD'),40000,'PENDIENTE');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (25,3,TO_DATE('2026-03-15','YYYY-MM-DD'),25000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (26,1,TO_DATE('2026-03-16','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (27,2,TO_DATE('2026-03-17','YYYY-MM-DD'),25000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (28,3,TO_DATE('2026-03-18','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (29,1,TO_DATE('2026-03-19','YYYY-MM-DD'),40000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (30,2,TO_DATE('2026-03-20','YYYY-MM-DD'),25000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (1,3,TO_DATE('2026-04-01','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (2,2,TO_DATE('2026-04-02','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (3,1,TO_DATE('2026-04-03','YYYY-MM-DD'),35000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (4,4,TO_DATE('2026-04-04','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (5,3,TO_DATE('2026-04-05','YYYY-MM-DD'),40000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (6,2,TO_DATE('2026-04-06','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (7,1,TO_DATE('2026-04-07','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (8,3,TO_DATE('2026-04-08','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (9,4,TO_DATE('2026-04-09','YYYY-MM-DD'),25000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (10,2,TO_DATE('2026-04-10','YYYY-MM-DD'),18000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (11,3,TO_DATE('2026-04-11','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (12,1,TO_DATE('2026-04-12','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (13,2,TO_DATE('2026-04-13','YYYY-MM-DD'),40000,'REEMBOLSADO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (14,4,TO_DATE('2026-04-14','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (15,3,TO_DATE('2026-04-15','YYYY-MM-DD'),25000,'EXITOSO');

INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (16,2,TO_DATE('2026-05-01','YYYY-MM-DD'),35000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (17,1,TO_DATE('2026-05-02','YYYY-MM-DD'),25000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (18,3,TO_DATE('2026-05-03','YYYY-MM-DD'),18000,'EXITOSO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (19,4,TO_DATE('2026-05-04','YYYY-MM-DD'),40000,'FALLIDO');
INSERT INTO quindioflix.pagos (id_usuario,id_metodo_pago,fecha_pago,monto,estado_pago) VALUES (20,2,TO_DATE('2026-05-05','YYYY-MM-DD'),25000,'EXITOSO');

-- =========================
-- REPORTES CONTENIDO CORREGIDOS
-- (30 usuarios válidos / moderadores válidos 1 y 2)
-- =========================

INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (1,4,NULL,'Contenido con escenas inapropiadas para la clasificación','PENDIENTE',TO_DATE('2026-03-01','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (2,11,1,'Violencia excesiva','RESUELTO',TO_DATE('2026-03-02','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (3,23,NULL,'Contenido sensible no advertido','PENDIENTE',TO_DATE('2026-03-03','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (4,35,2,'Audio ofensivo','RECHAZADO',TO_DATE('2026-03-04','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (5,9,1,'Representación peligrosa de hacking','RESUELTO',TO_DATE('2026-03-05','YYYY-MM-DD'));

INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (6,17,NULL,'Violencia extrema en serie','PENDIENTE',TO_DATE('2026-03-06','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (7,28,2,'Contenido engañoso','RESUELTO',TO_DATE('2026-03-07','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (8,12,NULL,'No apto para menores','PENDIENTE',TO_DATE('2026-03-08','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (9,31,1,'Lenguaje inapropiado','RESUELTO',TO_DATE('2026-03-09','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (10,40,NULL,'Posible contenido sensible','PENDIENTE',TO_DATE('2026-03-10','YYYY-MM-DD'));

INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (11,6,2,'Riesgo de imitación peligrosa','RESUELTO',TO_DATE('2026-03-11','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (12,18,NULL,'Contenido no adecuado para infantil','PENDIENTE',TO_DATE('2026-03-12','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (13,22,1,'Información engañosa','RESUELTO',TO_DATE('2026-03-13','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (14,3,NULL,'Violencia implícita','PENDIENTE',TO_DATE('2026-03-14','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (15,27,2,'Contenido sin advertencia','RESUELTO',TO_DATE('2026-03-15','YYYY-MM-DD'));

INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (16,14,NULL,'Material sensible','PENDIENTE',TO_DATE('2026-03-16','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (17,19,1,'Glorificación de violencia','RESUELTO',TO_DATE('2026-03-17','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (18,25,NULL,'Contenido histórico mal interpretado','PENDIENTE',TO_DATE('2026-03-18','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (19,8,2,'Contenido sensible infantil','RESUELTO',TO_DATE('2026-03-19','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (20,2,NULL,'Escenas no aptas para menores','PENDIENTE',TO_DATE('2026-03-20','YYYY-MM-DD'));

INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (21,33,1,'Lenguaje ofensivo','RESUELTO',TO_DATE('2026-03-21','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (22,7,NULL,'Violencia moderada','PENDIENTE',TO_DATE('2026-03-22','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (23,30,2,'Contenido sensible en música','RECHAZADO',TO_DATE('2026-03-23','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (24,10,NULL,'Mensaje confuso','PENDIENTE',TO_DATE('2026-03-24','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (25,16,1,'Contenido infantil inapropiado','RESUELTO',TO_DATE('2026-03-25','YYYY-MM-DD'));

INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (26,5,NULL,'Uso indebido de contenido','PENDIENTE',TO_DATE('2026-03-26','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (27,21,2,'Contenido educativo incorrecto','RESUELTO',TO_DATE('2026-03-27','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (28,24,NULL,'Posible desinformación','PENDIENTE',TO_DATE('2026-03-28','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (29,26,1,'Contenido técnico erróneo','RESUELTO',TO_DATE('2026-03-29','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (30,38,NULL,'Escenas perturbadoras','PENDIENTE',TO_DATE('2026-03-30','YYYY-MM-DD'));

INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (1,39,2,'Contenido sensible social','RESUELTO',TO_DATE('2026-03-31','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (2,13,NULL,'Violencia implícita','PENDIENTE',TO_DATE('2026-04-01','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (3,20,1,'Contenido no apto','RESUELTO',TO_DATE('2026-04-02','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (4,29,NULL,'Posible spam de contenido','PENDIENTE',TO_DATE('2026-04-03','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (5,32,2,'Contenido musical inapropiado','RECHAZADO',TO_DATE('2026-04-04','YYYY-MM-DD'));

INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (6,34,NULL,'Contenido sensible de negocios','PENDIENTE',TO_DATE('2026-04-05','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (7,36,1,'Contenido técnico incorrecto','RESUELTO',TO_DATE('2026-04-06','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (8,37,NULL,'Contenido adulto leve','PENDIENTE',TO_DATE('2026-04-07','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (9,1,2,'Violencia moderada','RESUELTO',TO_DATE('2026-04-08','YYYY-MM-DD'));
INSERT INTO quindioflix.reportes (id_usuario_reporta,id_contenido,id_moderador,motivo,estado,fecha_reporte) VALUES (10,15,NULL,'Contenido confuso','PENDIENTE',TO_DATE('2026-04-09','YYYY-MM-DD'));

commit;