-- CRUD en contenido
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.contenido TO ROL_CONTENIDO;

-- estructura de contenido
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.temporadas TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.episodios TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON quindioflix.generos TO ROL_CONTENIDO;

-- solo consulta de uso del contenido
GRANT SELECT ON quindioflix.reproducciones TO ROL_CONTENIDO;
GRANT SELECT ON quindioflix.calificaciones TO ROL_CONTENIDO;