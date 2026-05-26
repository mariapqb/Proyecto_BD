-- =====================================================
-- QUINDIOFLIX: PROFILE, ROLES, USUARIOS Y PRIVILEGIOS
-- Ejecutar conectado como SYSTEM o DBA
-- =====================================================

-- =====================================================
-- 1. PROFILE
-- =====================================================
CREATE PROFILE perfil_quindioflix LIMIT
    SESSIONS_PER_USER      3
    IDLE_TIME              30
    CONNECT_TIME           480
    FAILED_LOGIN_ATTEMPTS  5
    PASSWORD_LOCK_TIME     1/24
    PASSWORD_LIFE_TIME     90
    PASSWORD_GRACE_TIME    7;

-- Aplicar al usuario principal del esquema
ALTER USER quindioflix PROFILE perfil_quindioflix;

-- =====================================================
-- 2. ROLES
-- =====================================================
CREATE ROLE ROL_ADMIN;
CREATE ROLE ROL_ANALISTA;
CREATE ROLE ROL_SOPORTE;
CREATE ROLE ROL_CONTENIDO;

-- =====================================================
-- 3. USUARIOS OPERATIVOS
-- =====================================================
CREATE USER ADMIN_QF
    IDENTIFIED BY Admin123
    PROFILE perfil_quindioflix;

CREATE USER ANALISTA_QF
    IDENTIFIED BY Analista123
    PROFILE perfil_quindioflix;

CREATE USER SOPORTE_QF
    IDENTIFIED BY Soporte123
    PROFILE perfil_quindioflix;

CREATE USER CONTENIDO_QF
    IDENTIFIED BY Contenido123
    PROFILE perfil_quindioflix;

-- =====================================================
-- 4. PERMISO DE LOGIN
-- =====================================================
GRANT CREATE SESSION TO ADMIN_QF;
GRANT CREATE SESSION TO ANALISTA_QF;
GRANT CREATE SESSION TO SOPORTE_QF;
GRANT CREATE SESSION TO CONTENIDO_QF;

-- =====================================================
-- 5. PRIVILEGIOS ROL_ADMIN
-- CRUD completo en todas las tablas
-- =====================================================
GRANT ALL PRIVILEGES ON quindioflix.paises                TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.departamentos_geo     TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.ciudades              TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.departamentos         TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.empleados             TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.usuarios              TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.perfiles              TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.planes                TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.categorias            TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.generos               TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.contenido             TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.contenido_genero      TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.contenido_relacionado TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.temporadas            TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.episodios             TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.reproducciones        TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.favoritos             TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.calificaciones        TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.metodos_pago          TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.pagos                 TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.reportes              TO ROL_ADMIN;
GRANT CREATE USER             TO ROL_ADMIN;
GRANT DROP USER               TO ROL_ADMIN;
GRANT EXECUTE ANY PROCEDURE   TO ROL_ADMIN;

-- =====================================================
-- 6. PRIVILEGIOS ROL_ANALISTA
-- SELECT en todas las tablas de negocio
-- =====================================================
GRANT SELECT ON quindioflix.usuarios              TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.perfiles              TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.planes                TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.categorias            TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.generos               TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.contenido             TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.contenido_genero      TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.contenido_relacionado TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.temporadas            TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.episodios             TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.reproducciones        TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.calificaciones        TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.metodos_pago          TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.pagos                 TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.reportes              TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.paises                TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.departamentos_geo     TO ROL_ANALISTA;
GRANT SELECT ON quindioflix.ciudades              TO ROL_ANALISTA;

-- =====================================================
-- 7. PRIVILEGIOS ROL_SOPORTE
-- Consulta de cuenta + gestión de pagos
-- =====================================================
GRANT SELECT          ON quindioflix.usuarios     TO ROL_SOPORTE;
GRANT SELECT          ON quindioflix.perfiles     TO ROL_SOPORTE;
GRANT SELECT          ON quindioflix.planes       TO ROL_SOPORTE;
GRANT SELECT          ON quindioflix.metodos_pago TO ROL_SOPORTE;
GRANT SELECT, INSERT,
      UPDATE          ON quindioflix.pagos        TO ROL_SOPORTE;

-- =====================================================
-- 8. PRIVILEGIOS ROL_CONTENIDO
-- CRUD en catálogo + lectura de actividad
-- =====================================================
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.contenido             TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.categorias            TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.generos               TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.contenido_genero      TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.contenido_relacionado TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.temporadas            TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.episodios             TO ROL_CONTENIDO;
GRANT SELECT                         ON quindioflix.reproducciones        TO ROL_CONTENIDO;
GRANT SELECT                         ON quindioflix.calificaciones        TO ROL_CONTENIDO;

-- =====================================================
-- 9. ASIGNAR ROLES A USUARIOS
-- =====================================================
GRANT ROL_ADMIN     TO ADMIN_QF;
GRANT ROL_ANALISTA  TO ANALISTA_QF;
GRANT ROL_SOPORTE   TO SOPORTE_QF;
GRANT ROL_CONTENIDO TO CONTENIDO_QF;

-- =====================================================
-- VERIFICACIONES
-- =====================================================

-- 1. Roles creados
SELECT role
  FROM dba_roles
 WHERE role LIKE 'ROL_%'
 ORDER BY role;

-- 2. Usuarios y sus roles
SELECT grantee      AS usuario,
       granted_role AS rol
  FROM dba_role_privs
 WHERE grantee IN ('ADMIN_QF','ANALISTA_QF','SOPORTE_QF','CONTENIDO_QF')
 ORDER BY grantee;

-- 3. Profile aplicado a cada usuario
SELECT username,
       profile,
       account_status
  FROM dba_users
 WHERE username IN ('QUINDIOFLIX','ADMIN_QF','ANALISTA_QF',
                    'SOPORTE_QF','CONTENIDO_QF')
 ORDER BY username;

-- 4. Detalle del profile
SELECT resource_name,
       limit
  FROM dba_profiles
 WHERE profile = 'PERFIL_QUINDIOFLIX'
 ORDER BY resource_name;

-- 5. Privilegios por rol
SELECT grantee    AS rol,
       table_name,
       privilege
  FROM dba_tab_privs
 WHERE grantee IN ('ROL_ADMIN','ROL_ANALISTA','ROL_SOPORTE','ROL_CONTENIDO')
 ORDER BY grantee, table_name, privilege;