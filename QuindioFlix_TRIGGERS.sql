-- =====================================================
-- QUINDIOFLIX - BASE DE DATOS
-- PUNTO 3.2.5 DISPARADORES (TRIGGERS)
-- =====================================================
-- a) trg_rep_usuario_activo   — BEFORE INSERT en REPRODUCCIONES
-- b) trg_perfil_limite_plan   — BEFORE INSERT en PERFILES
-- c) trg_calif_consumo_min    — BEFORE INSERT en CALIFICACIONES
-- d) trg_pagos_activar_usuario — COMPOUND TRIGGER en PAGOS
-- =====================================================


-- =====================================================
-- 3.2.5.a TRIGGER: trg_rep_usuario_activo
-- Nivel: fila (FOR EACH ROW)
-- Momento: BEFORE INSERT en REPRODUCCIONES
-- Proposito: rechazar reproducciones de usuarios cuya
--   cuenta no este en estado 'ACTIVO'.
-- Excepcion: ORA-20030
-- =====================================================
CREATE OR REPLACE TRIGGER quindioflix.trg_rep_usuario_activo
BEFORE INSERT ON quindioflix.reproducciones
FOR EACH ROW
DECLARE
    v_estado VARCHAR2(15);
BEGIN
    SELECT u.estado
      INTO v_estado
      FROM quindioflix.usuarios u
      JOIN quindioflix.perfiles p
        ON u.id_usuario = p.id_usuario
     WHERE p.id_perfil = :NEW.id_perfil;

    IF v_estado <> 'ACTIVO' THEN
        RAISE_APPLICATION_ERROR(-20030,
            'No se puede reproducir contenido: la cuenta del usuario esta ' ||
            v_estado);
    END IF;
END trg_rep_usuario_activo;
/

-- ── Pruebas trg_rep_usuario_activo ───────────────────
SET SERVEROUTPUT ON;

-- PRUEBA a-1: Reproduccion con usuario ACTIVO → debe pasar
-- Perfil 1 pertenece al usuario 1 (ACTIVO)
BEGIN
    INSERT INTO quindioflix.reproducciones
        (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance)
    VALUES (1, 10, SYSDATE, NULL, 'TV', 30);

    DBMS_OUTPUT.PUT_LINE('[trg a-1] INSERT aceptado: usuario ACTIVO puede reproducir');
    ROLLBACK;
END;
/

-- PRUEBA a-2: Reproduccion con usuario INACTIVO → debe rechazar ORA-20030
-- Se suspende el usuario 10 temporalmente para la prueba
BEGIN
    UPDATE quindioflix.usuarios
       SET estado = 'INACTIVO'
     WHERE id_usuario = 10;

    -- Perfil del usuario 10 (id_perfil obtenido desde el DML)
    INSERT INTO quindioflix.reproducciones
        (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance)
    VALUES (
        (SELECT id_perfil FROM quindioflix.perfiles WHERE id_usuario = 10 AND ROWNUM = 1),
        5, SYSDATE, NULL, 'CELULAR', 20
    );

    ROLLBACK;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[trg a-2] INSERT rechazado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
        ROLLBACK;
END;
/


-- =====================================================
-- 3.2.5.b TRIGGER: trg_perfil_limite_plan
-- Nivel: fila (FOR EACH ROW)
-- Momento: BEFORE INSERT en PERFILES
-- Proposito: rechazar la insercion de un perfil si el
--   usuario ya alcanzo el maximo permitido por su plan.
--   El limite se lee de PLANES.max_perfiles (no hardcodeado).
-- Excepcion: ORA-20031
-- =====================================================
CREATE OR REPLACE TRIGGER quindioflix.trg_perfil_limite_plan
BEFORE INSERT ON quindioflix.perfiles
FOR EACH ROW
DECLARE
    v_max_perfiles      NUMBER;
    v_perfiles_actuales NUMBER;
BEGIN
    -- Obtener el limite del plan del usuario
    SELECT pl.max_perfiles
      INTO v_max_perfiles
      FROM quindioflix.usuarios u
      JOIN quindioflix.planes   pl
        ON u.id_plan = pl.id_plan
     WHERE u.id_usuario = :NEW.id_usuario;

    -- Contar perfiles existentes
    SELECT COUNT(*)
      INTO v_perfiles_actuales
      FROM quindioflix.perfiles
     WHERE id_usuario = :NEW.id_usuario;

    IF v_perfiles_actuales >= v_max_perfiles THEN
        RAISE_APPLICATION_ERROR(-20031,
            'El usuario ya alcanzo el limite de ' ||
            v_max_perfiles || ' perfiles permitido por su plan');
    END IF;
END trg_perfil_limite_plan;
/

-- ── Pruebas trg_perfil_limite_plan ───────────────────
SET SERVEROUTPUT ON;

-- PRUEBA b-1: Insertar perfil dentro del limite → debe pasar
-- Usuario 1: BASICO (max=2), tiene 1 perfil actualmente
BEGIN
    INSERT INTO quindioflix.perfiles (id_usuario, nombre, avatar, tipo)
    VALUES (1, 'Secundario', NULL, 'ADULTO');

    DBMS_OUTPUT.PUT_LINE('[trg b-1] INSERT aceptado: perfil 2/2 permitido por plan BASICO');
    ROLLBACK;
END;
/

-- PRUEBA b-2: Insertar perfil superando el limite → debe rechazar ORA-20031
-- Usuario 2: ESTANDAR (max=4), tiene 2 perfiles
-- Se insertan 2 mas para llegar al limite, luego se intenta el 5to
BEGIN
    -- Completar hasta el limite
    INSERT INTO quindioflix.perfiles (id_usuario, nombre, avatar, tipo)
    VALUES (2, 'Extra1', NULL, 'ADULTO');
    INSERT INTO quindioflix.perfiles (id_usuario, nombre, avatar, tipo)
    VALUES (2, 'Extra2', NULL, 'ADULTO');

    -- Este debe pasar (perfil 4/4)
    INSERT INTO quindioflix.perfiles (id_usuario, nombre, avatar, tipo)
    VALUES (2, 'Extra3', NULL, 'ADULTO');

    DBMS_OUTPUT.PUT_LINE('[trg b-2] Perfiles 3 y 4 insertados (dentro del limite)');

    -- Este debe ser rechazado (perfil 5/4, excede ESTANDAR)
    INSERT INTO quindioflix.perfiles (id_usuario, nombre, avatar, tipo)
    VALUES (2, 'Extra4', NULL, 'ADULTO');

    ROLLBACK;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[trg b-2] INSERT rechazado correctamente al exceder limite' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
        ROLLBACK;
END;
/


-- =====================================================
-- 3.2.5.c TRIGGER: trg_calif_consumo_min
-- Nivel: fila (FOR EACH ROW)
-- Momento: BEFORE INSERT en CALIFICACIONES
-- Proposito: rechazar una calificacion si el perfil no
--   ha visto al menos el 50% del contenido en ninguna
--   de sus reproducciones.
-- Excepcion: ORA-20032
-- =====================================================
CREATE OR REPLACE TRIGGER quindioflix.trg_calif_consumo_min
BEFORE INSERT ON quindioflix.calificaciones
FOR EACH ROW
DECLARE
    v_max_avance NUMBER;
BEGIN
    SELECT NVL(MAX(porcentaje_avance), 0)
      INTO v_max_avance
      FROM quindioflix.reproducciones
     WHERE id_perfil    = :NEW.id_perfil
       AND id_contenido = :NEW.id_contenido;

    IF v_max_avance < 50 THEN
        RAISE_APPLICATION_ERROR(-20032,
            'No se puede calificar: el perfil ha visto solo ' ||
            v_max_avance || '% del contenido (minimo requerido 50%)');
    END IF;
END trg_calif_consumo_min;
/

-- ── Pruebas trg_calif_consumo_min ────────────────────
SET SERVEROUTPUT ON;

-- PRUEBA c-1: Calificar con avance >= 50% → debe pasar
-- Perfil 2, contenido 2: max avance = 60% (verificado en DML)
BEGIN
    INSERT INTO quindioflix.calificaciones
        (id_perfil, id_contenido, estrellas, resena, fecha_calificacion)
    VALUES (2, 2, 4, 'Buena pelicula', SYSDATE);

    DBMS_OUTPUT.PUT_LINE('[trg c-1] INSERT aceptado: avance 60% supera el minimo de 50%');
    ROLLBACK;
END;
/

-- PRUEBA c-2: Calificar con avance < 50% → debe rechazar ORA-20032
-- Perfil 19, contenido 7: max avance = 45% (verificado en DML)
BEGIN
    INSERT INTO quindioflix.calificaciones
        (id_perfil, id_contenido, estrellas, resena, fecha_calificacion)
    VALUES (19, 7, 3, 'Intento de calificacion', SYSDATE);

    ROLLBACK;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[trg c-2] INSERT rechazado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
        ROLLBACK;
END;
/

-- PRUEBA c-3: Calificar sin ninguna reproduccion previa → debe rechazar ORA-20032
-- Se inserta una reproduccion con 0% de avance para simular inicio sin completar
BEGIN
    INSERT INTO quindioflix.reproducciones
        (id_perfil, id_contenido, fecha_inicio, fecha_fin, dispositivo, porcentaje_avance)
    VALUES (1, 8, SYSDATE, NULL, 'TV', 10);

    INSERT INTO quindioflix.calificaciones
        (id_perfil, id_contenido, estrellas, resena, fecha_calificacion)
    VALUES (1, 8, 5, 'Solo vi el inicio', SYSDATE);

    ROLLBACK;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[trg c-3] INSERT rechazado correctamente (avance 10%)' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
        ROLLBACK;
END;
/


-- =====================================================
-- 3.2.5.d TRIGGER: trg_pagos_activar_usuario
-- Nivel: sentencia (COMPOUND TRIGGER)
-- Momento: AFTER INSERT en PAGOS
-- Proposito: cuando se inserta un pago con estado_pago
--   = 'EXITOSO', actualizar el estado del usuario a 'ACTIVO'.
-- Implementado como COMPOUND TRIGGER para evitar el error
--   mutating-table al combinar logica de fila y sentencia.
-- NOTA: el esquema no posee columna fecha_ultimo_pago en
--   USUARIOS; el dato queda en MAX(fecha_pago) de PAGOS.
-- =====================================================
CREATE OR REPLACE TRIGGER quindioflix.trg_pagos_activar_usuario
FOR INSERT ON quindioflix.pagos
COMPOUND TRIGGER

    TYPE t_ids IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    v_usuarios_exitosos t_ids;
    v_idx               PLS_INTEGER := 0;

    AFTER EACH ROW IS
    BEGIN
        IF :NEW.estado_pago = 'EXITOSO' THEN
            v_idx := v_idx + 1;
            v_usuarios_exitosos(v_idx) := :NEW.id_usuario;
        END IF;
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        FOR i IN 1 .. v_usuarios_exitosos.COUNT LOOP
            UPDATE quindioflix.usuarios
               SET estado = 'ACTIVO'
             WHERE id_usuario = v_usuarios_exitosos(i)
               AND estado    <> 'ACTIVO';
        END LOOP;
    END AFTER STATEMENT;

END trg_pagos_activar_usuario;
/

-- ── Pruebas trg_pagos_activar_usuario ────────────────
SET SERVEROUTPUT ON;

-- PRUEBA d-1: Pago EXITOSO reactiva usuario INACTIVO → estado debe volver a ACTIVO
BEGIN
    -- Desactivar usuario 14 temporalmente
    UPDATE quindioflix.usuarios
       SET estado = 'INACTIVO'
     WHERE id_usuario = 14;

    DBMS_OUTPUT.PUT_LINE('[trg d-1] Estado antes del pago: ' ||
        (SELECT estado FROM quindioflix.usuarios WHERE id_usuario = 14));

    -- Insertar pago EXITOSO → el trigger debe reactivar el usuario
    INSERT INTO quindioflix.pagos (id_usuario, id_metodo_pago, fecha_pago, monto, estado_pago)
    VALUES (14, 1, SYSDATE, 14900, 'EXITOSO');

    DBMS_OUTPUT.PUT_LINE('[trg d-1] Estado despues del pago EXITOSO: ' ||
        (SELECT estado FROM quindioflix.usuarios WHERE id_usuario = 14));

    ROLLBACK;
END;
/

-- PRUEBA d-2: Pago FALLIDO no cambia el estado del usuario
BEGIN
    UPDATE quindioflix.usuarios
       SET estado = 'INACTIVO'
     WHERE id_usuario = 17;

    DBMS_OUTPUT.PUT_LINE('[trg d-2] Estado antes del pago: ' ||
        (SELECT estado FROM quindioflix.usuarios WHERE id_usuario = 17));

    -- Insertar pago FALLIDO → el trigger NO debe cambiar el estado
    INSERT INTO quindioflix.pagos (id_usuario, id_metodo_pago, fecha_pago, monto, estado_pago)
    VALUES (17, 2, SYSDATE, 14900, 'FALLIDO');

    DBMS_OUTPUT.PUT_LINE('[trg d-2] Estado despues del pago FALLIDO: ' ||
        (SELECT estado FROM quindioflix.usuarios WHERE id_usuario = 17));

    ROLLBACK;
END;
/

-- PRUEBA d-3: Usuario ya ACTIVO no es modificado (condicion AND estado <> 'ACTIVO')
BEGIN
    DBMS_OUTPUT.PUT_LINE('[trg d-3] Estado antes del pago: ' ||
        (SELECT estado FROM quindioflix.usuarios WHERE id_usuario = 1));

    INSERT INTO quindioflix.pagos (id_usuario, id_metodo_pago, fecha_pago, monto, estado_pago)
    VALUES (1, 1, SYSDATE, 24900, 'EXITOSO');

    DBMS_OUTPUT.PUT_LINE('[trg d-3] Estado despues del pago (sin cambio): ' ||
        (SELECT estado FROM quindioflix.usuarios WHERE id_usuario = 1));

    ROLLBACK;
END;
/
