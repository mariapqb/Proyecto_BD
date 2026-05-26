-- =====================================================
-- SESION B: Intenta cambiar el plan del mismo usuario 1
-- a BASICO (id_plan = 1).
-- Esta sesión QUEDARÁ BLOQUEADA porque la Sesión A
-- ya tiene un bloqueo FOR UPDATE sobre esa fila.
-- =====================================================
SET SERVEROUTPUT ON;

-- Este SELECT FOR UPDATE quedará en espera (bloqueado)
-- hasta que la Sesión A haga COMMIT o ROLLBACK.
-- En SQL Developer se verá que el script "no termina".
SELECT id_usuario, nombre, id_plan, estado
  FROM quindioflix.usuarios
 WHERE id_usuario = 1
   FOR UPDATE;

-- Esta línea solo se ejecutará cuando se libere el bloqueo
UPDATE quindioflix.usuarios
   SET id_plan = 1  -- BASICO
 WHERE id_usuario = 1;

COMMIT;

-- =====================================================
-- VERIFICACION: ver el estado final del usuario 1
-- y qué sesiones tienen bloqueos activos
-- =====================================================

-- 1. Estado actual del usuario
SELECT u.id_usuario,
       u.nombre,
       u.id_plan,
       p.nombre AS nombre_plan,
       u.estado
  FROM quindioflix.usuarios u
  JOIN quindioflix.planes   p ON u.id_plan = p.id_plan
 WHERE u.id_usuario = 1;

-- Verificación simple sin vistas del sistema
-- Confirmar estado final del usuario después del escenario
SELECT u.id_usuario,
       u.nombre,
       p.nombre  AS plan_actual,
       u.estado
  FROM quindioflix.usuarios u
  JOIN quindioflix.planes   p ON u.id_plan = p.id_plan
 WHERE u.id_usuario = 1;

-- Historial de pagos del usuario para ver los cambios
SELECT id_pago,
       id_metodo_pago,
       monto,
       estado_pago,
       fecha_pago
  FROM quindioflix.pagos
 WHERE id_usuario = 1
 ORDER BY fecha_pago DESC;