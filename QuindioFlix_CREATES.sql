/*==============================================================
  QUINDIOFLIX - MODELO FINAL PROFESIONAL (3FN)
  Oracle SQL Developer / Oracle Database
==============================================================*/

-- =========================
-- 1. GEOGRAFÍA
-- =========================

-- PAISES
CREATE TABLE quindioflix.paises (
    id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(80) NOT NULL UNIQUE
);

COMMENT ON TABLE quindioflix.paises IS 'Catálogo de países';

COMMENT ON COLUMN quindioflix.paises.id_pais IS 'Identificador único del país';
COMMENT ON COLUMN quindioflix.paises.nombre IS 'Nombre del país';

-- DEPARTAMENTOS
CREATE TABLE quindioflix.departamentos_geo (
    id_departamento_geo NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(80) NOT NULL,
    id_pais NUMBER NOT NULL,

    CONSTRAINT fk_depgeo_pais
        FOREIGN KEY (id_pais)
        REFERENCES quindioflix.paises(id_pais),

    CONSTRAINT uq_depgeo UNIQUE(nombre, id_pais)
);

COMMENT ON TABLE quindioflix.departamentos_geo IS 'Departamentos geográficos (división territorial)';

COMMENT ON COLUMN quindioflix.departamentos_geo.id_departamento_geo IS 'Identificador del departamento geográfico';
COMMENT ON COLUMN quindioflix.departamentos_geo.nombre IS 'Nombre del departamento geográfico';
COMMENT ON COLUMN quindioflix.departamentos_geo.id_pais IS 'País al que pertenece';

COMMENT ON TABLE quindioflix.departamentos_geo IS 'Cátalogo de Departamentos geográficos (división territorial)';

-- CIUDADES
CREATE TABLE quindioflix.ciudades (
    id_ciudad NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(80) NOT NULL,
    id_departamento_geo NUMBER NOT NULL,

    CONSTRAINT fk_ciudad_depgeo
        FOREIGN KEY (id_departamento_geo)
        REFERENCES quindioflix.departamentos_geo(id_departamento_geo),

    CONSTRAINT uq_ciudad UNIQUE(nombre, id_departamento_geo)
);

COMMENT ON TABLE quindioflix.ciudades IS 'Ciudades de cada departamento geográfico';

COMMENT ON COLUMN quindioflix.ciudades.id_ciudad IS 'Identificador de la ciudad';
COMMENT ON COLUMN quindioflix.ciudades.nombre IS 'Nombre de la ciudad';
COMMENT ON COLUMN quindioflix.ciudades.id_departamento_geo IS 'Departamento geográfico asociado';

-- =========================
-- EMPRESA
-- =========================

-- DEPARTAMENTOS EMPRESA
CREATE TABLE quindioflix.departamentos (
    id_departamento NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(80) NOT NULL UNIQUE,
    id_jefe NUMBER
);

COMMENT ON TABLE quindioflix.departamentos IS 'Departamentos internos de la empresa';

COMMENT ON COLUMN quindioflix.departamentos.id_departamento IS 'Identificador del departamento';
COMMENT ON COLUMN quindioflix.departamentos.nombre IS 'Nombre del área (Tecnología, Marketing, etc.)';
COMMENT ON COLUMN quindioflix.departamentos.id_jefe IS 'Empleado jefe del departamento';

-- EMPLEADOS
CREATE TABLE quindioflix.empleados (
    id_empleado NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    email VARCHAR2(120) NOT NULL UNIQUE,
    cargo VARCHAR2(80) NOT NULL,
    id_departamento NUMBER NOT NULL,
    id_supervisor NUMBER,

    CONSTRAINT fk_emp_dep
        FOREIGN KEY (id_departamento)
        REFERENCES quindioflix.departamentos(id_departamento),

    CONSTRAINT fk_emp_supervisor
        FOREIGN KEY (id_supervisor)
        REFERENCES quindioflix.empleados(id_empleado)
);

COMMENT ON TABLE quindioflix.empleados IS 'Empleados de la empresa QuindioFlix';

COMMENT ON COLUMN quindioflix.empleados.id_empleado IS 'Identificador único del empleado';
COMMENT ON COLUMN quindioflix.empleados.nombre IS 'Nombre completo del empleado';
COMMENT ON COLUMN quindioflix.empleados.email IS 'Correo corporativo del empleado';
COMMENT ON COLUMN quindioflix.empleados.cargo IS 'Cargo o rol del empleado';
COMMENT ON COLUMN quindioflix.empleados.id_departamento IS 'Departamento al que pertenece el empleado';
COMMENT ON COLUMN quindioflix.empleados.id_supervisor IS 'Empleado que supervisa directamente a este empleado';

ALTER TABLE quindioflix.departamentos
ADD CONSTRAINT fk_dep_jefe
FOREIGN KEY (id_jefe)
REFERENCES quindioflix.empleados(id_empleado);

-- =========================
-- PLANES
-- =========================

CREATE TABLE quindioflix.planes (
    id_plan NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(20) NOT NULL UNIQUE,
    precio_mensual NUMBER(10,2) NOT NULL,
    pantallas_simultaneas NUMBER NOT NULL,
    calidad VARCHAR2(10) NOT NULL,
    max_perfiles NUMBER NOT NULL,

    CONSTRAINT chk_plan_nombre
        CHECK (nombre IN ('BASICO','ESTANDAR','PREMIUM'))
);

COMMENT ON TABLE quindioflix.planes IS 'Planes de suscripción disponibles';

COMMENT ON COLUMN quindioflix.planes.id_plan IS 'Identificador del plan';
COMMENT ON COLUMN quindioflix.planes.nombre IS 'Nombre del plan (BASICO, ESTANDAR, PREMIUM)';
COMMENT ON COLUMN quindioflix.planes.precio_mensual IS 'Costo mensual del plan';
COMMENT ON COLUMN quindioflix.planes.pantallas_simultaneas IS 'Número de pantallas permitidas';
COMMENT ON COLUMN quindioflix.planes.calidad IS 'Calidad de reproducción (SD, HD, 4K)';
COMMENT ON COLUMN quindioflix.planes.max_perfiles IS 'Máximo de perfiles permitidos';

-- =========================
-- CATEGORÍAS
-- =========================

CREATE TABLE quindioflix.categorias (
    id_categoria NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL UNIQUE,
    descripcion VARCHAR2(200)
);

COMMENT ON TABLE quindioflix.categorias IS 'Clasificación general del contenido (película, serie, podcast, documental, música)';

COMMENT ON COLUMN quindioflix.categorias.id_categoria IS 'Identificador único de la categoría';
COMMENT ON COLUMN quindioflix.categorias.nombre IS 'Nombre de la categoría de contenido';
COMMENT ON COLUMN quindioflix.categorias.descripcion IS 'Descripción opcional de la categoría';

-- =========================
-- GÉNEROS
-- =========================

CREATE TABLE quindioflix.generos (
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL UNIQUE
);

COMMENT ON TABLE quindioflix.generos IS 'Catálogo de géneros disponibles para el contenido';

COMMENT ON COLUMN quindioflix.generos.id_genero IS 'Identificador único del género';
COMMENT ON COLUMN quindioflix.generos.nombre IS 'Nombre del género (Acción, Drama, Comedia, etc.)';

-- =========================
-- USUARIOS
-- =========================

CREATE TABLE quindioflix.usuarios (
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    email VARCHAR2(120) NOT NULL UNIQUE,
    telefono VARCHAR2(20),
    fecha_nacimiento DATE NOT NULL,
    id_ciudad NUMBER NOT NULL,
    id_plan NUMBER NOT NULL,
    estado VARCHAR2(15) DEFAULT 'ACTIVO',
    id_usuario_referente NUMBER,

    CONSTRAINT chk_usuario_estado
        CHECK (estado IN ('ACTIVO','INACTIVO','SUSPENDIDO')),

    CONSTRAINT fk_usuario_ciudad
        FOREIGN KEY (id_ciudad)
        REFERENCES quindioflix.ciudades(id_ciudad),

    CONSTRAINT fk_usuario_plan
        FOREIGN KEY (id_plan)
        REFERENCES quindioflix.planes(id_plan),

    CONSTRAINT fk_usuario_referente
        FOREIGN KEY (id_usuario_referente)
        REFERENCES quindioflix.usuarios(id_usuario)
);

COMMENT ON TABLE quindioflix.usuarios IS 'Usuarios registrados';

COMMENT ON COLUMN quindioflix.usuarios.id_usuario IS 'ID del usuario';
COMMENT ON COLUMN quindioflix.usuarios.nombre IS 'Nombre completo';
COMMENT ON COLUMN quindioflix.usuarios.email IS 'Correo electrónico';
COMMENT ON COLUMN quindioflix.usuarios.telefono IS 'Teléfono';
COMMENT ON COLUMN quindioflix.usuarios.fecha_nacimiento IS 'Fecha de nacimiento';
COMMENT ON COLUMN quindioflix.usuarios.id_ciudad IS 'Ciudad de residencia';
COMMENT ON COLUMN quindioflix.usuarios.id_plan IS 'Plan contratado';
COMMENT ON COLUMN quindioflix.usuarios.estado IS 'Estado de la cuenta';
COMMENT ON COLUMN quindioflix.usuarios.id_usuario_referente IS 'Usuario que refirió';

-- =========================
--PERFILES
-- =========================

CREATE TABLE quindioflix.perfiles (
    id_perfil NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER NOT NULL,
    nombre VARCHAR2(80) NOT NULL,
    avatar VARCHAR2(200),
    tipo VARCHAR2(10) NOT NULL,

    CONSTRAINT chk_tipo_perfil 
        CHECK (tipo IN ('ADULTO','INFANTIL')),

    CONSTRAINT uq_perfil 
        UNIQUE (id_usuario, nombre),

    CONSTRAINT fk_perfiles_usuarios
        FOREIGN KEY (id_usuario)
        REFERENCES quindioflix.usuarios(id_usuario)
);

COMMENT ON TABLE quindioflix.perfiles IS 'Perfiles de usuario';

COMMENT ON COLUMN quindioflix.perfiles.id_perfil IS 'ID del perfil';
COMMENT ON COLUMN quindioflix.perfiles.id_usuario IS 'Usuario dueño del perfil';
COMMENT ON COLUMN quindioflix.perfiles.nombre IS 'Nombre del perfil';
COMMENT ON COLUMN quindioflix.perfiles.avatar IS 'Imagen del perfil';
COMMENT ON COLUMN quindioflix.perfiles.tipo IS 'Tipo de perfil (ADULTO/INFANTIL)';

-- =========================
-- CONTENIDO
-- =========================

CREATE TABLE quindioflix.contenido (
    id_contenido NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(150) NOT NULL,
    tipo_contenido VARCHAR2(20) NOT NULL,
    anio_lanzamiento NUMBER(4),
    duracion_min NUMBER,
    sinopsis VARCHAR2(1000),
    clasificacion_edad VARCHAR2(5),
    es_original CHAR(1) DEFAULT 'N',
    id_categoria NUMBER NOT NULL,

    CONSTRAINT chk_tipo_contenido
        CHECK (tipo_contenido IN ('PELICULA','SERIE','PODCAST','DOCUMENTAL','MUSICA')),

    CONSTRAINT chk_clasificacion
        CHECK (clasificacion_edad IN ('TP','+7','+13','+16','+18')),

    CONSTRAINT chk_original
        CHECK (es_original IN ('S','N')),

    CONSTRAINT fk_contenido_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES quindioflix.categorias(id_categoria)
);

COMMENT ON TABLE quindioflix.contenido IS 'Catálogo multimedia';

-- =========================
-- CONTENIDO_GÉNERO
-- =========================

CREATE TABLE quindioflix.contenido_genero (
    id_contenido NUMBER NOT NULL,
    id_genero NUMBER NOT NULL,

    CONSTRAINT pk_cont_gen PRIMARY KEY (id_contenido, id_genero),

    CONSTRAINT fk_cg_contenido FOREIGN KEY (id_contenido)
        REFERENCES quindioflix.contenido(id_contenido),

    CONSTRAINT fk_cg_genero FOREIGN KEY (id_genero)
        REFERENCES quindioflix.generos(id_genero)
);

COMMENT ON TABLE quindioflix.contenido_genero IS 'Relación N:M entre contenido y géneros';

COMMENT ON COLUMN quindioflix.contenido_genero.id_contenido IS 'Contenido asociado';
COMMENT ON COLUMN quindioflix.contenido_genero.id_genero IS 'Género asociado';

-- =========================
-- CONTENIDO_RELACIONADO
-- =========================

CREATE TABLE quindioflix.contenido_relacionado (
    id_contenido_base NUMBER NOT NULL,
    id_contenido_rel NUMBER NOT NULL,
    tipo_relacion VARCHAR2(30) NOT NULL,

    CONSTRAINT pk_cont_rel PRIMARY KEY (id_contenido_base, id_contenido_rel),

    CONSTRAINT chk_tipo_relacion CHECK (
        tipo_relacion IN ('SECUELA','PRECUELA','REMAKE','SPINOFF','VERSION_EXTENDIDA')
    ),

    CONSTRAINT fk_cr_base FOREIGN KEY (id_contenido_base)
        REFERENCES quindioflix.contenido(id_contenido),

    CONSTRAINT fk_cr_rel FOREIGN KEY (id_contenido_rel)
        REFERENCES quindioflix.contenido(id_contenido)
);

COMMENT ON TABLE quindioflix.contenido_relacionado IS 'Relación entre contenidos (secuelas, spin-off, etc.)';

COMMENT ON COLUMN quindioflix.contenido_relacionado.id_contenido_base IS 'Contenido principal';
COMMENT ON COLUMN quindioflix.contenido_relacionado.id_contenido_rel IS 'Contenido relacionado';
COMMENT ON COLUMN quindioflix.contenido_relacionado.tipo_relacion IS 'Tipo de relación entre contenidos';

-- =========================
-- TEMPORADAS
-- =========================

CREATE TABLE quindioflix.temporadas (
    id_temporada NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_contenido NUMBER NOT NULL,
    numero_temporada NUMBER NOT NULL,
    titulo VARCHAR2(100),

    CONSTRAINT uq_temporada UNIQUE(id_contenido, numero_temporada),

    CONSTRAINT fk_temp_contenido FOREIGN KEY (id_contenido)
        REFERENCES quindioflix.contenido(id_contenido)
);

COMMENT ON TABLE quindioflix.temporadas IS 'Temporadas de series o podcasts';

COMMENT ON COLUMN quindioflix.temporadas.id_temporada IS 'Identificador de temporada';
COMMENT ON COLUMN quindioflix.temporadas.id_contenido IS 'Contenido asociado';
COMMENT ON COLUMN quindioflix.temporadas.numero_temporada IS 'Número de temporada';
COMMENT ON COLUMN quindioflix.temporadas.titulo IS 'Título de la temporada';

-- =========================
-- EPISODIOS
-- =========================

CREATE TABLE quindioflix.episodios (
    id_episodio NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_temporada NUMBER NOT NULL,
    numero_episodio NUMBER NOT NULL,
    titulo VARCHAR2(120) NOT NULL,
    duracion_min NUMBER,

    CONSTRAINT uq_episodio UNIQUE(id_temporada, numero_episodio),

    CONSTRAINT fk_epi_temp FOREIGN KEY (id_temporada)
        REFERENCES quindioflix.temporadas(id_temporada)
);

COMMENT ON TABLE quindioflix.episodios IS 'Episodios de temporadas';

COMMENT ON COLUMN quindioflix.episodios.id_episodio IS 'Identificador del episodio';
COMMENT ON COLUMN quindioflix.episodios.id_temporada IS 'Temporada a la que pertenece';
COMMENT ON COLUMN quindioflix.episodios.numero_episodio IS 'Número del episodio';
COMMENT ON COLUMN quindioflix.episodios.titulo IS 'Título del episodio';
COMMENT ON COLUMN quindioflix.episodios.duracion_min IS 'Duración en minutos';

-- =========================
-- REPRODUCCIONES
-- =========================

CREATE TABLE quindioflix.reproducciones (
    id_reproduccion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_perfil NUMBER NOT NULL,
    id_contenido NUMBER NOT NULL,
    id_episodio NUMBER,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    dispositivo VARCHAR2(20) NOT NULL,
    porcentaje_avance NUMBER(5,2) DEFAULT 0,

    CONSTRAINT chk_dispositivo CHECK (
        dispositivo IN ('TV','CELULAR','TABLET','COMPUTADOR')
    ),

    CONSTRAINT fk_rep_perfil FOREIGN KEY (id_perfil)
        REFERENCES quindioflix.perfiles(id_perfil),

    CONSTRAINT fk_rep_contenido FOREIGN KEY (id_contenido)
        REFERENCES quindioflix.contenido(id_contenido),

    CONSTRAINT fk_rep_episodio FOREIGN KEY (id_episodio)
        REFERENCES quindioflix.episodios(id_episodio)
);

COMMENT ON TABLE quindioflix.reproducciones IS 'Registro de consumo de contenido';

COMMENT ON COLUMN quindioflix.reproducciones.id_reproduccion IS 'ID de reproducción';
COMMENT ON COLUMN quindioflix.reproducciones.id_perfil IS 'Perfil que reproduce';
COMMENT ON COLUMN quindioflix.reproducciones.id_contenido IS 'Contenido reproducido';
COMMENT ON COLUMN quindioflix.reproducciones.id_episodio IS 'Episodio (si aplica)';
COMMENT ON COLUMN quindioflix.reproducciones.fecha_inicio IS 'Inicio de reproducción';
COMMENT ON COLUMN quindioflix.reproducciones.fecha_fin IS 'Fin de reproducción';
COMMENT ON COLUMN quindioflix.reproducciones.dispositivo IS 'Dispositivo usado';
COMMENT ON COLUMN quindioflix.reproducciones.porcentaje_avance IS 'Avance de reproducción';

-- =========================
-- FAVORITOS
-- =========================

CREATE TABLE quindioflix.favoritos (
    id_perfil NUMBER NOT NULL,
    id_contenido NUMBER NOT NULL,
    fecha_agregado DATE DEFAULT SYSDATE,

    CONSTRAINT pk_fav PRIMARY KEY (id_perfil, id_contenido),

    CONSTRAINT fk_fav_perfil FOREIGN KEY (id_perfil)
        REFERENCES quindioflix.perfiles(id_perfil),

    CONSTRAINT fk_fav_contenido FOREIGN KEY (id_contenido)
        REFERENCES quindioflix.contenido(id_contenido)
);

COMMENT ON TABLE quindioflix.favoritos IS 'Lista de favoritos por perfil';

COMMENT ON COLUMN quindioflix.favoritos.id_perfil IS 'Perfil usuario';
COMMENT ON COLUMN quindioflix.favoritos.id_contenido IS 'Contenido favorito';
COMMENT ON COLUMN quindioflix.favoritos.fecha_agregado IS 'Fecha de agregado';

-- =========================
-- CALIFICACIONES
-- =========================

CREATE TABLE quindioflix.calificaciones (
    id_calificacion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_perfil NUMBER NOT NULL,
    id_contenido NUMBER NOT NULL,
    estrellas NUMBER(1) NOT NULL,
    resena VARCHAR2(500),
    fecha_calificacion DATE DEFAULT SYSDATE,

    CONSTRAINT chk_estrellas CHECK (estrellas BETWEEN 1 AND 5),
    CONSTRAINT uq_calificacion UNIQUE(id_perfil, id_contenido),

    CONSTRAINT fk_cal_perfil FOREIGN KEY (id_perfil)
        REFERENCES quindioflix.perfiles(id_perfil),

    CONSTRAINT fk_cal_contenido FOREIGN KEY (id_contenido)
        REFERENCES quindioflix.contenido(id_contenido)
);

COMMENT ON TABLE quindioflix.calificaciones IS 'Calificación de contenido por usuarios';

COMMENT ON COLUMN quindioflix.calificaciones.id_calificacion IS 'ID de calificación';
COMMENT ON COLUMN quindioflix.calificaciones.id_perfil IS 'Perfil que califica';
COMMENT ON COLUMN quindioflix.calificaciones.id_contenido IS 'Contenido calificado';
COMMENT ON COLUMN quindioflix.calificaciones.estrellas IS 'Puntuación (1 a 5)';
COMMENT ON COLUMN quindioflix.calificaciones.resena IS 'Comentario opcional';
COMMENT ON COLUMN quindioflix.calificaciones.fecha_calificacion IS 'Fecha de calificación';

-- =========================
-- PAGOS
-- =========================

-- Métodos de pago
CREATE TABLE quindioflix.metodos_pago (
    id_metodo_pago NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre_metodo VARCHAR2(20) NOT NULL,
    descripcion VARCHAR2(100),

    CONSTRAINT pk_metodos_pago PRIMARY KEY (id_metodo_pago),

    CONSTRAINT uq_metodo_nombre UNIQUE (nombre_metodo),

    CONSTRAINT chk_nombre_metodo CHECK (
        nombre_metodo IN ('TARJETA','PSE','NEQUI','DAVIPLATA','PAYPAL')
    )
);

-- Pagos
CREATE TABLE quindioflix.pagos (
    id_pago NUMBER GENERATED ALWAYS AS IDENTITY,
    id_usuario NUMBER NOT NULL,
    id_metodo_pago NUMBER NOT NULL,
    fecha_pago DATE DEFAULT SYSDATE,
    monto NUMBER(10,2) NOT NULL,
    estado_pago VARCHAR2(15) NOT NULL,

    CONSTRAINT pk_pagos PRIMARY KEY (id_pago),

    CONSTRAINT fk_pago_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES quindioflix.usuarios(id_usuario),

    CONSTRAINT fk_pago_metodo
        FOREIGN KEY (id_metodo_pago)
        REFERENCES quindioflix.metodos_pago(id_metodo_pago),

    CONSTRAINT chk_monto_pago CHECK (
        monto > 0
    ),

    CONSTRAINT chk_estado_pago CHECK (
        estado_pago IN (
            'EXITOSO',
            'FALLIDO',
            'PENDIENTE',
            'REEMBOLSADO'
        )
    )
);

-- =========================
-- REPORTES
-- =========================

CREATE TABLE quindioflix.reportes (
    id_reporte NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario_reporta NUMBER NOT NULL,
    id_contenido NUMBER NOT NULL,
    id_moderador NUMBER,
    motivo VARCHAR2(300) NOT NULL,
    estado VARCHAR2(15) DEFAULT 'PENDIENTE',
    fecha_reporte DATE DEFAULT SYSDATE,

    CONSTRAINT chk_reportes_estado
        CHECK (estado IN ('PENDIENTE','RESUELTO','RECHAZADO')),

    CONSTRAINT fk_reportes_usuario
        FOREIGN KEY (id_usuario_reporta)
        REFERENCES quindioflix.usuarios(id_usuario),

    CONSTRAINT fk_reportes_contenido
        FOREIGN KEY (id_contenido)
        REFERENCES quindioflix.contenido(id_contenido),

    CONSTRAINT fk_reportes_moderador
        FOREIGN KEY (id_moderador)
        REFERENCES quindioflix.empleados(id_empleado)
);

COMMENT ON TABLE quindioflix.reportes IS 'Reportes de contenido inapropiado';

COMMENT ON COLUMN quindioflix.reportes.id_reporte IS 'ID del reporte';
COMMENT ON COLUMN quindioflix.reportes.id_usuario_reporta IS 'Usuario que reporta';
COMMENT ON COLUMN quindioflix.reportes.id_contenido IS 'Contenido reportado';
COMMENT ON COLUMN quindioflix.reportes.id_moderador IS 'Empleado que resuelve';
COMMENT ON COLUMN quindioflix.reportes.motivo IS 'Motivo del reporte';
COMMENT ON COLUMN quindioflix.reportes.estado IS 'Estado del reporte';
COMMENT ON COLUMN quindioflix.reportes.fecha_reporte IS 'Fecha del reporte';

CREATE OR REPLACE TRIGGER quindioflix.trg_control_perfil_infantil
BEFORE INSERT ON quindioflix.reproducciones
FOR EACH ROW
DECLARE
    v_tipo_perfil quindioflix.perfiles.tipo%TYPE;
    v_clasificacion quindioflix.contenido.clasificacion_edad%TYPE;
BEGIN

    SELECT tipo
    INTO v_tipo_perfil
    FROM quindioflix.perfiles
    WHERE id_perfil = :NEW.id_perfil;

    SELECT clasificacion_edad
    INTO v_clasificacion
    FROM quindioflix.contenido
    WHERE id_contenido = :NEW.id_contenido;

    IF v_tipo_perfil = 'INFANTIL' AND v_clasificacion = '+18' THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Un perfil infantil no puede reproducir contenido +18');
    END IF;

END;
/

SELECT table_name
FROM user_tables
ORDER BY table_name;

SELECT constraint_name, table_name, constraint_type
FROM user_constraints
WHERE constraint_type = 'R';

SELECT a.table_name, a.constraint_name, c_pk.table_name AS tabla_referenciada
FROM user_constraints a
JOIN user_constraints c_pk
  ON a.r_constraint_name = c_pk.constraint_name
WHERE a.constraint_type = 'R';

