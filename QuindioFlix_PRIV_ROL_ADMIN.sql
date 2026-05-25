-- CRUD completo en todas las tablas
GRANT ALL PRIVILEGES ON quindioflix.paises TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.departamentos_geo TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.ciudades TO ROL_ADMIN;

GRANT ALL PRIVILEGES ON quindioflix.usuarios TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.perfiles TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.planes TO ROL_ADMIN;

GRANT ALL PRIVILEGES ON quindioflix.categorias TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.generos TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.contenido TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.contenido_genero TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.contenido_relacionado TO ROL_ADMIN;

GRANT ALL PRIVILEGES ON quindioflix.temporadas TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.episodios TO ROL_ADMIN;

GRANT ALL PRIVILEGES ON quindioflix.reproducciones TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.favoritos TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.calificaciones TO ROL_ADMIN;

GRANT ALL PRIVILEGES ON quindioflix.pagos TO ROL_ADMIN;
GRANT ALL PRIVILEGES ON quindioflix.reportes TO ROL_ADMIN;

-- Crear/eliminar usuarios (privilegios de sistema)
GRANT CREATE USER TO ROL_ADMIN;
GRANT DROP USER TO ROL_ADMIN;
GRANT EXECUTE ANY PROCEDURE TO ROL_ADMIN;