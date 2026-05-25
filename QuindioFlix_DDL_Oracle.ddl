-- Generado por Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



CREATE USER quindioflix IDENTIFIED BY account

unlock;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE quindioflix.calificaciones (
    id_calificacion    NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    id_perfil          NUMBER NOT NULL,
    id_contenido       NUMBER NOT NULL,
    estrellas          NUMBER(1) NOT NULL,
    resena             VARCHAR2(500 BYTE),
    fecha_calificacion DATE DEFAULT sysdate
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE quindioflix.calificaciones
    ADD CONSTRAINT chk_estrellas CHECK ( estrellas BETWEEN 1 AND 5 );

COMMENT ON TABLE quindioflix.calificaciones IS
    'Calificación de contenido por usuarios';

COMMENT ON COLUMN quindioflix.calificaciones.id_calificacion IS
    'ID de calificación';

COMMENT ON COLUMN quindioflix.calificaciones.id_perfil IS
    'Perfil que califica';

COMMENT ON COLUMN quindioflix.calificaciones.id_contenido IS
    'Contenido calificado';

COMMENT ON COLUMN quindioflix.calificaciones.estrellas IS
    'Puntuación (1 a 5)';

COMMENT ON COLUMN quindioflix.calificaciones.resena IS
    'Comentario opcional';

COMMENT ON COLUMN quindioflix.calificaciones.fecha_calificacion IS
    'Fecha de calificación';

CREATE UNIQUE INDEX quindioflix.uq_calificacion ON
    quindioflix.calificaciones (
        id_perfil
    ASC,
        id_contenido
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE quindioflix.calificaciones
    ADD CONSTRAINT calificaciones_pk
        PRIMARY KEY ( id_calificacion )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.calificaciones
    ADD CONSTRAINT uq_calificacion
        UNIQUE ( id_perfil,
                 id_contenido )
            USING INDEX quindioflix.uq_calificacion;

CREATE TABLE quindioflix.categorias (
    id_categoria NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    nombre       VARCHAR2(50 BYTE) NOT NULL,
    descripcion  VARCHAR2(200 BYTE)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.categorias IS
    'Clasificación general del contenido (película, serie, podcast, documental, música)';

COMMENT ON COLUMN quindioflix.categorias.id_categoria IS
    'Identificador único de la categoría';

COMMENT ON COLUMN quindioflix.categorias.nombre IS
    'Nombre de la categoría de contenido';

COMMENT ON COLUMN quindioflix.categorias.descripcion IS
    'Descripción opcional de la categoría';

ALTER TABLE quindioflix.categorias
    ADD CONSTRAINT categorias_pk
        PRIMARY KEY ( id_categoria )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.categorias
    ADD CONSTRAINT categorias_nombre_un
        UNIQUE ( nombre )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.ciudades (
    id_ciudad           NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    nombre              VARCHAR2(80 BYTE) NOT NULL,
    id_departamento_geo NUMBER NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.ciudades IS
    'Ciudades de cada departamento geográfico';

COMMENT ON COLUMN quindioflix.ciudades.id_ciudad IS
    'Identificador de la ciudad';

COMMENT ON COLUMN quindioflix.ciudades.nombre IS
    'Nombre de la ciudad';

COMMENT ON COLUMN quindioflix.ciudades.id_departamento_geo IS
    'Departamento geográfico asociado';

CREATE UNIQUE INDEX quindioflix.uq_ciudad ON
    quindioflix.ciudades (
        nombre
    ASC,
        id_departamento_geo
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE quindioflix.ciudades
    ADD CONSTRAINT ciudades_pk
        PRIMARY KEY ( id_ciudad )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.ciudades
    ADD CONSTRAINT uq_ciudad
        UNIQUE ( nombre,
                 id_departamento_geo )
            USING INDEX quindioflix.uq_ciudad;

CREATE TABLE quindioflix.contenido (
    id_contenido       NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    titulo             VARCHAR2(150 BYTE) NOT NULL,
    tipo_contenido     VARCHAR2(20 BYTE) NOT NULL,
    anio_lanzamiento   NUMBER(4),
    duracion_min       NUMBER,
    sinopsis           VARCHAR2(1000 BYTE),
    clasificacion_edad VARCHAR2(5 BYTE),
    es_original        CHAR(1 BYTE) DEFAULT 'N',
    id_categoria       NUMBER NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE quindioflix.contenido
    ADD CONSTRAINT chk_tipo_contenido
        CHECK ( tipo_contenido IN ( 'DOCUMENTAL', 'MUSICA', 'PELICULA', 'PODCAST', 'SERIE' ) );

ALTER TABLE quindioflix.contenido
    ADD CONSTRAINT chk_clasificacion
        CHECK ( clasificacion_edad IN ( '+13', '+16', '+18', '+7', 'TP' ) );

ALTER TABLE quindioflix.contenido
    ADD CONSTRAINT chk_original CHECK ( es_original IN ( 'N', 'S' ) );

COMMENT ON TABLE quindioflix.contenido IS
    'Catálogo multimedia';

ALTER TABLE quindioflix.contenido
    ADD CONSTRAINT contenido_pk
        PRIMARY KEY ( id_contenido )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.contenido_genero (
    id_contenido NUMBER NOT NULL,
    id_genero    NUMBER NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.contenido_genero IS
    'Relación N:M entre contenido y géneros';

COMMENT ON COLUMN quindioflix.contenido_genero.id_contenido IS
    'Contenido asociado';

COMMENT ON COLUMN quindioflix.contenido_genero.id_genero IS
    'Género asociado';

CREATE UNIQUE INDEX quindioflix.pk_cont_gen ON
    quindioflix.contenido_genero (
        id_contenido
    ASC,
        id_genero
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE quindioflix.contenido_genero
    ADD CONSTRAINT pk_cont_gen
        PRIMARY KEY ( id_contenido,
                      id_genero )
            USING INDEX quindioflix.pk_cont_gen;

CREATE TABLE quindioflix.contenido_relacionado (
    id_contenido_base NUMBER NOT NULL,
    id_contenido_rel  NUMBER NOT NULL,
    tipo_relacion     VARCHAR2(30 BYTE) NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE quindioflix.contenido_relacionado
    ADD CONSTRAINT chk_tipo_relacion
        CHECK ( tipo_relacion IN ( 'PRECUELA', 'REMAKE', 'SECUELA', 'SPINOFF', 'VERSION_EXTENDIDA' ) );

COMMENT ON TABLE quindioflix.contenido_relacionado IS
    'Relación entre contenidos (secuelas, spin-off, etc.)';

COMMENT ON COLUMN quindioflix.contenido_relacionado.id_contenido_base IS
    'Contenido principal';

COMMENT ON COLUMN quindioflix.contenido_relacionado.id_contenido_rel IS
    'Contenido relacionado';

COMMENT ON COLUMN quindioflix.contenido_relacionado.tipo_relacion IS
    'Tipo de relación entre contenidos';

CREATE UNIQUE INDEX quindioflix.pk_cont_rel ON
    quindioflix.contenido_relacionado (
        id_contenido_base
    ASC,
        id_contenido_rel
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE quindioflix.contenido_relacionado
    ADD CONSTRAINT pk_cont_rel
        PRIMARY KEY ( id_contenido_base,
                      id_contenido_rel )
            USING INDEX quindioflix.pk_cont_rel;

CREATE TABLE quindioflix.departamentos (
    id_departamento NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    nombre          VARCHAR2(80 BYTE) NOT NULL,
    id_jefe         NUMBER
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.departamentos IS
    'Departamentos internos de la empresa';

COMMENT ON COLUMN quindioflix.departamentos.id_departamento IS
    'Identificador del departamento';

COMMENT ON COLUMN quindioflix.departamentos.nombre IS
    'Nombre del área (Tecnología, Marketing, etc.)';

COMMENT ON COLUMN quindioflix.departamentos.id_jefe IS
    'Empleado jefe del departamento';

ALTER TABLE quindioflix.departamentos
    ADD CONSTRAINT departamentos_pk
        PRIMARY KEY ( id_departamento )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.departamentos
    ADD CONSTRAINT departamentos_nombre_un
        UNIQUE ( nombre )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.departamentos_geo (
    id_departamento_geo NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    nombre              VARCHAR2(80 BYTE) NOT NULL,
    id_pais             NUMBER NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.departamentos_geo IS
    'Cátalogo de Departamentos geográficos (división territorial)';

COMMENT ON COLUMN quindioflix.departamentos_geo.id_departamento_geo IS
    'Identificador del departamento geográfico';

COMMENT ON COLUMN quindioflix.departamentos_geo.nombre IS
    'Nombre del departamento geográfico';

COMMENT ON COLUMN quindioflix.departamentos_geo.id_pais IS
    'País al que pertenece';

CREATE UNIQUE INDEX quindioflix.uq_depgeo ON
    quindioflix.departamentos_geo (
        nombre
    ASC,
        id_pais
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE quindioflix.departamentos_geo
    ADD CONSTRAINT departamentos_geo_pk
        PRIMARY KEY ( id_departamento_geo )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.departamentos_geo
    ADD CONSTRAINT uq_depgeo
        UNIQUE ( nombre,
                 id_pais )
            USING INDEX quindioflix.uq_depgeo;

CREATE TABLE quindioflix.empleados (
    id_empleado     NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    nombre          VARCHAR2(100 BYTE) NOT NULL,
    email           VARCHAR2(120 BYTE) NOT NULL,
    cargo           VARCHAR2(80 BYTE) NOT NULL,
    id_departamento NUMBER NOT NULL,
    id_supervisor   NUMBER
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.empleados IS
    'Empleados de la empresa QuindioFlix';

COMMENT ON COLUMN quindioflix.empleados.id_empleado IS
    'Identificador único del empleado';

COMMENT ON COLUMN quindioflix.empleados.nombre IS
    'Nombre completo del empleado';

COMMENT ON COLUMN quindioflix.empleados.email IS
    'Correo corporativo del empleado';

COMMENT ON COLUMN quindioflix.empleados.cargo IS
    'Cargo o rol del empleado';

COMMENT ON COLUMN quindioflix.empleados.id_departamento IS
    'Departamento al que pertenece el empleado';

COMMENT ON COLUMN quindioflix.empleados.id_supervisor IS
    'Empleado que supervisa directamente a este empleado';

ALTER TABLE quindioflix.empleados
    ADD CONSTRAINT empleados_pk
        PRIMARY KEY ( id_empleado )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.empleados
    ADD CONSTRAINT empleados_email_un
        UNIQUE ( email )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.episodios (
    id_episodio     NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    id_temporada    NUMBER NOT NULL,
    numero_episodio NUMBER NOT NULL,
    titulo          VARCHAR2(120 BYTE) NOT NULL,
    duracion_min    NUMBER
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.episodios IS
    'Episodios de temporadas';

COMMENT ON COLUMN quindioflix.episodios.id_episodio IS
    'Identificador del episodio';

COMMENT ON COLUMN quindioflix.episodios.id_temporada IS
    'Temporada a la que pertenece';

COMMENT ON COLUMN quindioflix.episodios.numero_episodio IS
    'Número del episodio';

COMMENT ON COLUMN quindioflix.episodios.titulo IS
    'Título del episodio';

COMMENT ON COLUMN quindioflix.episodios.duracion_min IS
    'Duración en minutos';

CREATE UNIQUE INDEX quindioflix.uq_episodio ON
    quindioflix.episodios (
        id_temporada
    ASC,
        numero_episodio
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE quindioflix.episodios
    ADD CONSTRAINT episodios_pk
        PRIMARY KEY ( id_episodio )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.episodios
    ADD CONSTRAINT uq_episodio
        UNIQUE ( id_temporada,
                 numero_episodio )
            USING INDEX quindioflix.uq_episodio;

CREATE TABLE quindioflix.favoritos (
    id_perfil      NUMBER NOT NULL,
    id_contenido   NUMBER NOT NULL,
    fecha_agregado DATE DEFAULT sysdate
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.favoritos IS
    'Lista de favoritos por perfil';

COMMENT ON COLUMN quindioflix.favoritos.id_perfil IS
    'Perfil usuario';

COMMENT ON COLUMN quindioflix.favoritos.id_contenido IS
    'Contenido favorito';

COMMENT ON COLUMN quindioflix.favoritos.fecha_agregado IS
    'Fecha de agregado';

CREATE UNIQUE INDEX quindioflix.pk_fav ON
    quindioflix.favoritos (
        id_perfil
    ASC,
        id_contenido
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE quindioflix.favoritos
    ADD CONSTRAINT pk_fav
        PRIMARY KEY ( id_perfil,
                      id_contenido )
            USING INDEX quindioflix.pk_fav;

CREATE TABLE quindioflix.generos (
    id_genero NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    nombre    VARCHAR2(50 BYTE) NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.generos IS
    'Catálogo de géneros disponibles para el contenido';

COMMENT ON COLUMN quindioflix.generos.id_genero IS
    'Identificador único del género';

COMMENT ON COLUMN quindioflix.generos.nombre IS
    'Nombre del género (Acción, Drama, Comedia, etc.)';

ALTER TABLE quindioflix.generos
    ADD CONSTRAINT generos_pk
        PRIMARY KEY ( id_genero )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.generos
    ADD CONSTRAINT generos_nombre_un
        UNIQUE ( nombre )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.pagos (
    id_pago     NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    id_usuario  NUMBER NOT NULL,
    fecha_pago  DATE DEFAULT sysdate,
    monto       NUMBER(10, 2) NOT NULL,
    metodo_pago VARCHAR2(20 BYTE) NOT NULL,
    estado_pago VARCHAR2(15 BYTE) NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE quindioflix.pagos
    ADD CONSTRAINT chk_estado_pago
        CHECK ( estado_pago IN ( 'EXITOSO', 'FALLIDO', 'PENDIENTE', 'REEMBOLSADO' ) );

COMMENT ON TABLE quindioflix.pagos IS
    'Registro de pagos de suscripción';

COMMENT ON COLUMN quindioflix.pagos.id_pago IS
    'ID del pago';

COMMENT ON COLUMN quindioflix.pagos.id_usuario IS
    'Usuario que paga';

COMMENT ON COLUMN quindioflix.pagos.fecha_pago IS
    'Fecha del pago';

COMMENT ON COLUMN quindioflix.pagos.monto IS
    'Valor pagado';

COMMENT ON COLUMN quindioflix.pagos.metodo_pago IS
    'Método de pago';

COMMENT ON COLUMN quindioflix.pagos.estado_pago IS
    'Estado del pago';

ALTER TABLE quindioflix.pagos
    ADD CONSTRAINT pagos_pk
        PRIMARY KEY ( id_pago )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.paises (
    id_pais NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    nombre  VARCHAR2(80 BYTE) NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.paises IS
    'Catálogo de países';

COMMENT ON COLUMN quindioflix.paises.id_pais IS
    'Identificador único del país';

COMMENT ON COLUMN quindioflix.paises.nombre IS
    'Nombre del país';

ALTER TABLE quindioflix.paises
    ADD CONSTRAINT paises_pk
        PRIMARY KEY ( id_pais )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.paises
    ADD CONSTRAINT paises_nombre_un
        UNIQUE ( nombre )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.perfiles (
    id_perfil  NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    id_usuario NUMBER NOT NULL,
    nombre     VARCHAR2(80 BYTE) NOT NULL,
    avatar     VARCHAR2(200 BYTE),
    tipo       VARCHAR2(10 BYTE) NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE quindioflix.perfiles
    ADD CONSTRAINT chk_tipo_perfil CHECK ( tipo IN ( 'ADULTO', 'INFANTIL' ) );

COMMENT ON TABLE quindioflix.perfiles IS
    'Perfiles de usuario';

COMMENT ON COLUMN quindioflix.perfiles.id_perfil IS
    'ID del perfil';

COMMENT ON COLUMN quindioflix.perfiles.id_usuario IS
    'Usuario dueño del perfil';

COMMENT ON COLUMN quindioflix.perfiles.nombre IS
    'Nombre del perfil';

COMMENT ON COLUMN quindioflix.perfiles.avatar IS
    'Imagen del perfil';

COMMENT ON COLUMN quindioflix.perfiles.tipo IS
    'Tipo de perfil (ADULTO/INFANTIL)';

CREATE UNIQUE INDEX quindioflix.uq_perfil ON
    quindioflix.perfiles (
        id_usuario
    ASC,
        nombre
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE quindioflix.perfiles
    ADD CONSTRAINT perfiles_pk
        PRIMARY KEY ( id_perfil )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.perfiles
    ADD CONSTRAINT uq_perfil
        UNIQUE ( id_usuario,
                 nombre )
            USING INDEX quindioflix.uq_perfil;

CREATE TABLE quindioflix.planes (
    id_plan               NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    nombre                VARCHAR2(20 BYTE) NOT NULL,
    precio_mensual        NUMBER(10, 2) NOT NULL,
    pantallas_simultaneas NUMBER NOT NULL,
    calidad               VARCHAR2(10 BYTE) NOT NULL,
    max_perfiles          NUMBER NOT NULL
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE quindioflix.planes
    ADD CONSTRAINT chk_plan_nombre
        CHECK ( nombre IN ( 'BASICO', 'ESTANDAR', 'PREMIUM' ) );

COMMENT ON TABLE quindioflix.planes IS
    'Planes de suscripción disponibles';

COMMENT ON COLUMN quindioflix.planes.id_plan IS
    'Identificador del plan';

COMMENT ON COLUMN quindioflix.planes.nombre IS
    'Nombre del plan (BASICO, ESTANDAR, PREMIUM)';

COMMENT ON COLUMN quindioflix.planes.precio_mensual IS
    'Costo mensual del plan';

COMMENT ON COLUMN quindioflix.planes.pantallas_simultaneas IS
    'Número de pantallas permitidas';

COMMENT ON COLUMN quindioflix.planes.calidad IS
    'Calidad de reproducción (SD, HD, 4K)';

COMMENT ON COLUMN quindioflix.planes.max_perfiles IS
    'Máximo de perfiles permitidos';

ALTER TABLE quindioflix.planes
    ADD CONSTRAINT planes_pk
        PRIMARY KEY ( id_plan )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.planes
    ADD CONSTRAINT planes_nombre_un
        UNIQUE ( nombre )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.reportes (
    id_reporte         NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    id_usuario_reporta NUMBER NOT NULL,
    id_contenido       NUMBER NOT NULL,
    id_moderador       NUMBER,
    motivo             VARCHAR2(300 BYTE) NOT NULL,
    estado             VARCHAR2(15 BYTE) DEFAULT 'PENDIENTE',
    fecha_reporte      DATE DEFAULT sysdate
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE quindioflix.reportes
    ADD CONSTRAINT chk_reportes_estado
        CHECK ( estado IN ( 'PENDIENTE', 'RECHAZADO', 'RESUELTO' ) );

COMMENT ON TABLE quindioflix.reportes IS
    'Reportes de contenido inapropiado';

COMMENT ON COLUMN quindioflix.reportes.id_reporte IS
    'ID del reporte';

COMMENT ON COLUMN quindioflix.reportes.id_usuario_reporta IS
    'Usuario que reporta';

COMMENT ON COLUMN quindioflix.reportes.id_contenido IS
    'Contenido reportado';

COMMENT ON COLUMN quindioflix.reportes.id_moderador IS
    'Empleado que resuelve';

COMMENT ON COLUMN quindioflix.reportes.motivo IS
    'Motivo del reporte';

COMMENT ON COLUMN quindioflix.reportes.estado IS
    'Estado del reporte';

COMMENT ON COLUMN quindioflix.reportes.fecha_reporte IS
    'Fecha del reporte';

ALTER TABLE quindioflix.reportes
    ADD CONSTRAINT reportes_pk
        PRIMARY KEY ( id_reporte )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.reproducciones (
    id_reproduccion   NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    id_perfil         NUMBER NOT NULL,
    id_contenido      NUMBER NOT NULL,
    id_episodio       NUMBER,
    fecha_inicio      DATE NOT NULL,
    fecha_fin         DATE,
    dispositivo       VARCHAR2(20 BYTE) NOT NULL,
    porcentaje_avance NUMBER(5, 2) DEFAULT 0
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE quindioflix.reproducciones
    ADD CONSTRAINT chk_dispositivo
        CHECK ( dispositivo IN ( 'CELULAR', 'COMPUTADOR', 'TABLET', 'TV' ) );

COMMENT ON TABLE quindioflix.reproducciones IS
    'Registro de consumo de contenido';

COMMENT ON COLUMN quindioflix.reproducciones.id_reproduccion IS
    'ID de reproducción';

COMMENT ON COLUMN quindioflix.reproducciones.id_perfil IS
    'Perfil que reproduce';

COMMENT ON COLUMN quindioflix.reproducciones.id_contenido IS
    'Contenido reproducido';

COMMENT ON COLUMN quindioflix.reproducciones.id_episodio IS
    'Episodio (si aplica)';

COMMENT ON COLUMN quindioflix.reproducciones.fecha_inicio IS
    'Inicio de reproducción';

COMMENT ON COLUMN quindioflix.reproducciones.fecha_fin IS
    'Fin de reproducción';

COMMENT ON COLUMN quindioflix.reproducciones.dispositivo IS
    'Dispositivo usado';

COMMENT ON COLUMN quindioflix.reproducciones.porcentaje_avance IS
    'Avance de reproducción';

ALTER TABLE quindioflix.reproducciones
    ADD CONSTRAINT reproducciones_pk
        PRIMARY KEY ( id_reproduccion )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE quindioflix.temporadas (
    id_temporada     NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    id_contenido     NUMBER NOT NULL,
    numero_temporada NUMBER NOT NULL,
    titulo           VARCHAR2(100 BYTE)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

COMMENT ON TABLE quindioflix.temporadas IS
    'Temporadas de series o podcasts';

COMMENT ON COLUMN quindioflix.temporadas.id_temporada IS
    'Identificador de temporada';

COMMENT ON COLUMN quindioflix.temporadas.id_contenido IS
    'Contenido asociado';

COMMENT ON COLUMN quindioflix.temporadas.numero_temporada IS
    'Número de temporada';

COMMENT ON COLUMN quindioflix.temporadas.titulo IS
    'Título de la temporada';

CREATE UNIQUE INDEX quindioflix.uq_temporada ON
    quindioflix.temporadas (
        id_contenido
    ASC,
        numero_temporada
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE quindioflix.temporadas
    ADD CONSTRAINT temporadas_pk
        PRIMARY KEY ( id_temporada )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.temporadas
    ADD CONSTRAINT uq_temporada
        UNIQUE ( id_contenido,
                 numero_temporada )
            USING INDEX quindioflix.uq_temporada;

CREATE TABLE quindioflix.usuarios (
    id_usuario           NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    nombre               VARCHAR2(100 BYTE) NOT NULL,
    email                VARCHAR2(120 BYTE) NOT NULL,
    telefono             VARCHAR2(20 BYTE),
    fecha_nacimiento     DATE NOT NULL,
    id_ciudad            NUMBER NOT NULL,
    id_plan              NUMBER NOT NULL,
    estado               VARCHAR2(15 BYTE) DEFAULT 'ACTIVO',
    id_usuario_referente NUMBER
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

ALTER TABLE quindioflix.usuarios
    ADD CONSTRAINT chk_usuario_estado
        CHECK ( estado IN ( 'ACTIVO', 'INACTIVO', 'SUSPENDIDO' ) );

COMMENT ON TABLE quindioflix.usuarios IS
    'Usuarios registrados';

COMMENT ON COLUMN quindioflix.usuarios.id_usuario IS
    'ID del usuario';

COMMENT ON COLUMN quindioflix.usuarios.nombre IS
    'Nombre completo';

COMMENT ON COLUMN quindioflix.usuarios.email IS
    'Correo electrónico';

COMMENT ON COLUMN quindioflix.usuarios.telefono IS
    'Teléfono';

COMMENT ON COLUMN quindioflix.usuarios.fecha_nacimiento IS
    'Fecha de nacimiento';

COMMENT ON COLUMN quindioflix.usuarios.id_ciudad IS
    'Ciudad de residencia';

COMMENT ON COLUMN quindioflix.usuarios.id_plan IS
    'Plan contratado';

COMMENT ON COLUMN quindioflix.usuarios.estado IS
    'Estado de la cuenta';

COMMENT ON COLUMN quindioflix.usuarios.id_usuario_referente IS
    'Usuario que refirió';

ALTER TABLE quindioflix.usuarios
    ADD CONSTRAINT usuarios_pk
        PRIMARY KEY ( id_usuario )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.usuarios
    ADD CONSTRAINT usuarios_email_un
        UNIQUE ( email )
            USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE quindioflix.calificaciones
    ADD CONSTRAINT fk_cal_contenido
        FOREIGN KEY ( id_contenido )
            REFERENCES quindioflix.contenido ( id_contenido )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.calificaciones
    ADD CONSTRAINT fk_cal_perfil
        FOREIGN KEY ( id_perfil )
            REFERENCES quindioflix.perfiles ( id_perfil )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.contenido_genero
    ADD CONSTRAINT fk_cg_contenido
        FOREIGN KEY ( id_contenido )
            REFERENCES quindioflix.contenido ( id_contenido )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.contenido_genero
    ADD CONSTRAINT fk_cg_genero
        FOREIGN KEY ( id_genero )
            REFERENCES quindioflix.generos ( id_genero )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.ciudades
    ADD CONSTRAINT fk_ciudad_depgeo
        FOREIGN KEY ( id_departamento_geo )
            REFERENCES quindioflix.departamentos_geo ( id_departamento_geo )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.contenido
    ADD CONSTRAINT fk_contenido_categoria
        FOREIGN KEY ( id_categoria )
            REFERENCES quindioflix.categorias ( id_categoria )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.contenido_relacionado
    ADD CONSTRAINT fk_cr_base
        FOREIGN KEY ( id_contenido_base )
            REFERENCES quindioflix.contenido ( id_contenido )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.contenido_relacionado
    ADD CONSTRAINT fk_cr_rel
        FOREIGN KEY ( id_contenido_rel )
            REFERENCES quindioflix.contenido ( id_contenido )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.departamentos
    ADD CONSTRAINT fk_dep_jefe
        FOREIGN KEY ( id_jefe )
            REFERENCES quindioflix.empleados ( id_empleado )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.departamentos_geo
    ADD CONSTRAINT fk_depgeo_pais
        FOREIGN KEY ( id_pais )
            REFERENCES quindioflix.paises ( id_pais )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.empleados
    ADD CONSTRAINT fk_emp_dep
        FOREIGN KEY ( id_departamento )
            REFERENCES quindioflix.departamentos ( id_departamento )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.empleados
    ADD CONSTRAINT fk_emp_supervisor
        FOREIGN KEY ( id_supervisor )
            REFERENCES quindioflix.empleados ( id_empleado )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.episodios
    ADD CONSTRAINT fk_epi_temp
        FOREIGN KEY ( id_temporada )
            REFERENCES quindioflix.temporadas ( id_temporada )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.favoritos
    ADD CONSTRAINT fk_fav_contenido
        FOREIGN KEY ( id_contenido )
            REFERENCES quindioflix.contenido ( id_contenido )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.favoritos
    ADD CONSTRAINT fk_fav_perfil
        FOREIGN KEY ( id_perfil )
            REFERENCES quindioflix.perfiles ( id_perfil )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.pagos
    ADD CONSTRAINT fk_pago_usuario
        FOREIGN KEY ( id_usuario )
            REFERENCES quindioflix.usuarios ( id_usuario )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.perfiles
    ADD CONSTRAINT fk_perfiles_usuarios
        FOREIGN KEY ( id_usuario )
            REFERENCES quindioflix.usuarios ( id_usuario )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.reproducciones
    ADD CONSTRAINT fk_rep_contenido
        FOREIGN KEY ( id_contenido )
            REFERENCES quindioflix.contenido ( id_contenido )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.reproducciones
    ADD CONSTRAINT fk_rep_episodio
        FOREIGN KEY ( id_episodio )
            REFERENCES quindioflix.episodios ( id_episodio )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.reproducciones
    ADD CONSTRAINT fk_rep_perfil
        FOREIGN KEY ( id_perfil )
            REFERENCES quindioflix.perfiles ( id_perfil )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.reportes
    ADD CONSTRAINT fk_reportes_contenido
        FOREIGN KEY ( id_contenido )
            REFERENCES quindioflix.contenido ( id_contenido )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.reportes
    ADD CONSTRAINT fk_reportes_moderador
        FOREIGN KEY ( id_moderador )
            REFERENCES quindioflix.empleados ( id_empleado )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.reportes
    ADD CONSTRAINT fk_reportes_usuario
        FOREIGN KEY ( id_usuario_reporta )
            REFERENCES quindioflix.usuarios ( id_usuario )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.temporadas
    ADD CONSTRAINT fk_temp_contenido
        FOREIGN KEY ( id_contenido )
            REFERENCES quindioflix.contenido ( id_contenido )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.usuarios
    ADD CONSTRAINT fk_usuario_ciudad
        FOREIGN KEY ( id_ciudad )
            REFERENCES quindioflix.ciudades ( id_ciudad )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.usuarios
    ADD CONSTRAINT fk_usuario_plan
        FOREIGN KEY ( id_plan )
            REFERENCES quindioflix.planes ( id_plan )
            NOT DEFERRABLE;

ALTER TABLE quindioflix.usuarios
    ADD CONSTRAINT fk_usuario_referente
        FOREIGN KEY ( id_usuario_referente )
            REFERENCES quindioflix.usuarios ( id_usuario )
            NOT DEFERRABLE;

CREATE OR REPLACE TRIGGER QUINDIOFLIX.TRG_CONTROL_PERFIL_INFANTIL 
    BEFORE INSERT ON QUINDIOFLIX.REPRODUCCIONES 
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



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             9
-- ALTER TABLE                             71
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
