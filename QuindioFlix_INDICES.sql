-- =====================================================
-- 3.4.1 CREACION Y ADMINISTRACION DE INDICES
-- =====================================================

-- =====================================================
-- LIMPIEZA PREVIA: eliminar indices si ya existen
-- para evitar ORA-01408 al recrearlos
-- =====================================================
DECLARE
    PROCEDURE drop_if_exists(p_index VARCHAR2) IS
    BEGIN
        EXECUTE IMMEDIATE 'DROP INDEX quindioflix.' || p_index;
    EXCEPTION
        WHEN OTHERS THEN NULL; -- si no existe, continua
    END;
BEGIN
    drop_if_exists('IDX_REP_PERFIL_FECHA');
    drop_if_exists('IDX_CONTENIDO_CAT_ANIO');
    drop_if_exists('IDX_PAGOS_USUARIO_ESTADO_FECHA');
    drop_if_exists('IDX_USUARIOS_EMAIL');
    DBMS_OUTPUT.PUT_LINE('Limpieza previa completada.');
END;
/

-- =====================================================
-- INDICE 2 (punto b)
-- Tabla: USUARIOS(email)
-- Tipo: Unico B-Tree
--
-- El constraint UNIQUE del DDL ya creo un indice
-- implicito con nombre del sistema (SYS_Cxxxxxxx).
-- Lo renombramos para darle un nombre descriptivo
-- sin necesidad de recrearlo.
-- =====================================================
DECLARE
    v_index_name VARCHAR2(100);
BEGIN
    -- Buscar el nombre actual del indice implicito sobre email
    SELECT i.index_name
      INTO v_index_name
      FROM user_indexes     i
      JOIN user_ind_columns ic ON i.index_name = ic.index_name
     WHERE i.table_name   = 'USUARIOS'
       AND i.uniqueness   = 'UNIQUE'
       AND ic.column_name = 'EMAIL'
       AND ROWNUM         = 1;

    -- Renombrar al nombre descriptivo
    EXECUTE IMMEDIATE
        'ALTER INDEX quindioflix.' || v_index_name
        || ' RENAME TO idx_usuarios_email';

    DBMS_OUTPUT.PUT_LINE('Indice renombrado: ' || v_index_name
        || ' → IDX_USUARIOS_EMAIL');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontro indice UNIQUE sobre EMAIL.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al renombrar: ' || SQLERRM);
END;
/

-- =====================================================
-- INDICE 1 (punto a)
-- Tabla: REPRODUCCIONES(id_perfil, fecha_inicio)
-- Tipo: Compuesto B-Tree
--
-- Justificacion:
-- La consulta mas frecuente del sistema es "ver el
-- historial de reproducciones de un perfil ordenado
-- por fecha". Sin indice, Oracle hace FULL TABLE SCAN
-- sobre toda la tabla (que crece indefinidamente con
-- cada reproduccion). El indice compuesto permite:
-- 1) Filtrar directamente por id_perfil (primer campo)
-- 2) Obtener fecha_inicio ya ordenada (segundo campo)
-- sin necesidad de un paso adicional de ordenamiento.
-- Un indice solo en id_perfil no evitaria el sort;
-- un indice solo en fecha_inicio no filtraria por
-- perfil eficientemente.
-- =====================================================
CREATE INDEX quindioflix.idx_rep_perfil_fecha
    ON quindioflix.reproducciones (id_perfil, fecha_inicio)
    TABLESPACE users;

-- =====================================================
-- INDICE 3 (punto c)
-- Tabla: CONTENIDO(id_categoria, anio_lanzamiento)
-- Tipo: Compuesto B-Tree
--
-- Justificacion:
-- El catalogo se navega principalmente filtrando por
-- categoria (peliculas, series, etc.) y dentro de
-- cada categoria ordenando por año (contenido reciente
-- primero). El indice compuesto cubre ambas operaciones
-- en un solo recorrido de arbol. Si el usuario filtra
-- solo por categoria, Oracle usa el primer campo del
-- indice (index range scan). Si filtra por categoria
-- Y año, usa ambos campos evitando acceso a la tabla.
-- =====================================================
CREATE INDEX quindioflix.idx_contenido_cat_anio
    ON quindioflix.contenido (id_categoria, anio_lanzamiento)
    TABLESPACE users;

-- =====================================================
-- INDICE 4 (eleccion propia)
-- Tabla: PAGOS(id_usuario, estado_pago, fecha_pago)
-- Tipo: Compuesto B-Tree
--
-- Justificacion:
-- Las consultas financieras mas frecuentes son:
-- "todos los pagos de un usuario" (facturacion),
-- "pagos EXITOSOS de un usuario en un rango de fechas"
-- (renovaciones), y "pagos PENDIENTES del sistema"
-- (cobros pendientes). El indice cubre el filtro por
-- usuario (campo 1), luego por estado (campo 2) y
-- finalmente por fecha (campo 3) para rangos temporales.
-- Sin este indice cada consulta de facturacion hace
-- FULL SCAN sobre la tabla de pagos que acumula un
-- registro por mes por usuario activo.
-- =====================================================
CREATE INDEX quindioflix.idx_pagos_usuario_estado_fecha
    ON quindioflix.pagos (id_usuario, estado_pago, fecha_pago)
    TABLESPACE users;

-- =====================================================
-- VERIFICACION FINAL: los 4 indices con nombre
-- descriptivo correctamente asignado
-- =====================================================
SELECT i.index_name,
       i.table_name,
       i.index_type,
       i.uniqueness,
       i.status,
       LISTAGG(ic.column_name, ', ')
           WITHIN GROUP (ORDER BY ic.column_position) AS columnas
  FROM user_indexes     i
  JOIN user_ind_columns ic ON i.index_name = ic.index_name
 WHERE i.index_name IN (
           'IDX_REP_PERFIL_FECHA',
           'IDX_USUARIOS_EMAIL',
           'IDX_CONTENIDO_CAT_ANIO',
           'IDX_PAGOS_USUARIO_ESTADO_FECHA'
       )
 GROUP BY i.index_name, i.table_name, i.index_type, i.uniqueness, i.status
 ORDER BY i.table_name, i.index_name;