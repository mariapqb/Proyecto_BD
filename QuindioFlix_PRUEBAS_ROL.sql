-- =====================================================
-- 3.5.2 punto c): DEMOSTRAR RESTRICCIONES POR ROL
-- =====================================================
-- =====================================================
-- PRUEBA 1: ANALISTA_QF
-- Conectar en SQL Developer como: ANALISTA_QF / Analista123
-- =====================================================

-- SI debe funcionar (SELECT permitido)
SELECT id_usuario, nombre, id_plan, estado
  FROM quindioflix.usuarios
 WHERE ROWNUM <= 3;

-- NO debe funcionar (INSERT no tiene)
-- Error esperado: ORA-01031: insufficient privileges
INSERT INTO quindioflix.usuarios (
    nombre, email, fecha_nacimiento, id_ciudad, id_plan
) VALUES (
    'Test', 'test@test.com', DATE '2000-01-01', 1, 1
);
-- =====================================================
-- PRUEBA 2: SOPORTE_QF
-- Conectar en SQL Developer como: SOPORTE_QF / Soporte123
-- =====================================================

-- SI debe funcionar (SELECT en pagos)
SELECT id_pago, id_usuario, monto, estado_pago
  FROM quindioflix.pagos
 WHERE ROWNUM <= 3;

-- NO debe funcionar (contenido no está en su rol)
-- Error esperado: ORA-00942: table or view does not exist
SELECT id_contenido, titulo
  FROM quindioflix.contenido
 WHERE ROWNUM <= 3;
-- =====================================================
-- PRUEBA 3: CONTENIDO_QF
-- Conectar en SQL Developer como: CONTENIDO_QF / Contenido123
-- =====================================================

-- SI debe funcionar (INSERT en contenido)
INSERT INTO quindioflix.contenido (
    titulo, tipo_contenido, anio_lanzamiento,
    clasificacion_edad, es_original, id_categoria
) VALUES (
    'Prueba Contenido QF', 'PELICULA', 2025, 'TP', 'N', 1
);
ROLLBACK;

-- NO debe funcionar (pagos no está en su rol)
-- Error esperado: ORA-00942: table or view does not exist
SELECT id_pago, monto
  FROM quindioflix.pagos
 WHERE ROWNUM <= 3;
-- =====================================================
-- PRUEBA 4: ADMIN_QF
-- Conectar en SQL Developer como: ADMIN_QF / Admin123
-- =====================================================

-- SI debe funcionar (SELECT en cualquier tabla)
SELECT id_pago, monto, estado_pago
  FROM quindioflix.pagos
 WHERE ROWNUM <= 3;

-- SI debe funcionar (DELETE permitido)
-- Usamos ROLLBACK para no borrar datos reales
DELETE FROM quindioflix.reportes
 WHERE id_reporte = -1; -- ID inexistente, solo prueba el permiso
ROLLBACK;