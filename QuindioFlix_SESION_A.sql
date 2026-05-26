-- =====================================================
-- SESION A: Intenta cambiar el plan del usuario 1
-- a PREMIUM (id_plan = 3).
-- Ejecutar COMPLETO pero NO hacer COMMIT todavía.
-- Dejar esta sesión abierta y pasar a la Sesión B.
-- =====================================================
SET SERVEROUTVEMENT ON;

-- Paso 1: Bloquear la fila del usuario 1
-- Ninguna otra sesión podrá modificar esta fila
-- hasta que esta transacción termine.
SELECT id_usuario, nombre, id_plan, estado
  FROM quindioflix.usuarios
 WHERE id_usuario = 1
   FOR UPDATE;

-- Paso 2: Aplicar el cambio
UPDATE quindioflix.usuarios
   SET id_plan = 3  -- PREMIUM
 WHERE id_usuario = 1;

-- *** NO ejecutar COMMIT todavía ***
-- *** Abrir Sesión B ahora        ***

-- =====================================================
-- SESION A: Confirmar o revertir para liberar el bloqueo
-- =====================================================

-- OPCION 1: Confirmar el cambio de la Sesión A
-- La Sesión B se desbloquea y aplica su propio cambio.
COMMIT;

-- OPCION 2: Revertir el cambio de la Sesión A
-- La Sesión B se desbloquea y aplica su cambio sobre
-- el valor original (sin el cambio de A).
-- ROLLBACK;