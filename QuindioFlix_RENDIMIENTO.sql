-- =====================================================
-- PASO 1: EXPLAIN PLAN SIN indice
-- =====================================================
DROP INDEX quindioflix.idx_rep_perfil_fecha;

EXPLAIN PLAN
    SET STATEMENT_ID = 'ANTES_INDICE'
    FOR
    SELECT r.id_reproduccion,
           r.fecha_inicio,
           r.fecha_fin,
           r.dispositivo,
           r.porcentaje_avance,
           c.titulo,
           c.tipo_contenido
      FROM quindioflix.reproducciones r
      JOIN quindioflix.contenido      c ON r.id_contenido = c.id_contenido
     WHERE r.id_perfil = 1
     ORDER BY r.fecha_inicio DESC;

SELECT plan_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE', 'ANTES_INDICE', 'TYPICAL'));

-- =====================================================
-- PASO 2: RECREAR indice y actualizar estadisticas
-- =====================================================
CREATE INDEX quindioflix.idx_rep_perfil_fecha
    ON quindioflix.reproducciones (id_perfil, fecha_inicio)
    TABLESPACE users;

EXEC DBMS_STATS.GATHER_TABLE_STATS('QUINDIOFLIX', 'REPRODUCCIONES');

-- =====================================================
-- PASO 3: EXPLAIN PLAN CON indice
-- =====================================================
EXPLAIN PLAN
    SET STATEMENT_ID = 'DESPUES_INDICE'
    FOR
    SELECT r.id_reproduccion,
           r.fecha_inicio,
           r.fecha_fin,
           r.dispositivo,
           r.porcentaje_avance,
           c.titulo,
           c.tipo_contenido
      FROM quindioflix.reproducciones r
      JOIN quindioflix.contenido      c ON r.id_contenido = c.id_contenido
     WHERE r.id_perfil = 1
     ORDER BY r.fecha_inicio DESC;

SELECT plan_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE', 'DESPUES_INDICE', 'TYPICAL'));

-- =====================================================
-- PASO 4: COMPARACION numerica lado a lado
-- =====================================================
SELECT statement_id                                        AS escenario,
       LPAD(' ', depth * 2) || operation
           || ' ' || NVL(options, '')                      AS operacion,
       object_name                                         AS objeto,
       cost,
       cardinality                                         AS filas_est
  FROM plan_table
 WHERE statement_id IN ('ANTES_INDICE', 'DESPUES_INDICE')
 ORDER BY statement_id DESC, id;