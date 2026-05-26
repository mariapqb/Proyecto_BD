-- =====================================================
-- TRANSACCION 1: Registro integral de un usuario
-- =====================================================
SET SERVEROUTPUT ON;

DECLARE
    v_id_usuario    NUMBER;
    v_precio_plan   NUMBER;
    v_id_plan       NUMBER := 2;  -- 2 = ESTANDAR
    v_id_ciudad     NUMBER;
    v_id_metodo     NUMBER;
    v_msg           VARCHAR2(200);
BEGIN
    -- Resolver ciudad por nombre (no depender del ID hardcodeado)
    SELECT id_ciudad
      INTO v_id_ciudad
      FROM quindioflix.ciudades
     WHERE nombre = 'Armenia';

    -- Resolver método de pago por nombre
    SELECT id_metodo_pago
      INTO v_id_metodo
      FROM quindioflix.metodos_pago
     WHERE nombre_metodo = 'PSE';

    -- Estado: ACTIVA
    -- (1) Crear el usuario
    INSERT INTO quindioflix.usuarios (
        nombre, email, telefono, fecha_nacimiento,
        id_ciudad, id_plan, estado
    ) VALUES (
        'Laura Gomez', 'laura.gomez@correo.com', '3001234567',
        DATE '1995-06-20', v_id_ciudad, v_id_plan, 'ACTIVO'
    )
    RETURNING id_usuario INTO v_id_usuario;
    -- Estado: PARCIALMENTE CONFIRMADA (1/3)

    -- (2) Crear el perfil predeterminado
    INSERT INTO quindioflix.perfiles (id_usuario, nombre, tipo)
    VALUES (v_id_usuario, 'Principal', 'ADULTO');
    -- Estado: PARCIALMENTE CONFIRMADA (2/3)

    -- (3) Obtener precio del plan y registrar primer pago
    SELECT precio_mensual
      INTO v_precio_plan
      FROM quindioflix.planes
     WHERE id_plan = v_id_plan;

    INSERT INTO quindioflix.pagos (
        id_usuario, id_metodo_pago, monto, estado_pago, fecha_pago
    ) VALUES (
        v_id_usuario, v_id_metodo, v_precio_plan, 'PENDIENTE', SYSDATE
    );
    -- Estado: PARCIALMENTE CONFIRMADA (3/3)

    -- Guardar mensaje ANTES del COMMIT
    v_msg := 'Transaccion 1 CONFIRMADA. Usuario id = ' || v_id_usuario
          || ' | Plan = ' || v_id_plan
          || ' | Monto = ' || v_precio_plan
          || ' | Metodo = PSE (id=' || v_id_metodo || ')';

    COMMIT;
    -- Estado: CONFIRMADA

    DBMS_OUTPUT.PUT_LINE(v_msg);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        -- Estado: ABORTADA
        DBMS_OUTPUT.PUT_LINE('Transaccion 1 REVERTIDA (dato no encontrado): ' || SQLERRM);
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        -- Estado: ABORTADA
        DBMS_OUTPUT.PUT_LINE('Transaccion 1 REVERTIDA (email duplicado): ' || SQLERRM);
    WHEN OTHERS THEN
        ROLLBACK;
        -- Estado: ABORTADA
        DBMS_OUTPUT.PUT_LINE('Transaccion 1 REVERTIDA: ' || SQLERRM);
END;
/

-- =====================================================
-- TRANSACCION 2: Procesamiento de un lote de pagos
-- SAVEPOINT por pago: si uno falla se descarta solo ese,
-- los anteriores quedan confirmados al final con COMMIT.
-- =====================================================
SET SERVEROUTPUT ON;

DECLARE
    TYPE t_pago IS RECORD (
        id_usuario NUMBER,
        monto      NUMBER,
        metodo     VARCHAR2(20)  -- nombre del método, se resuelve a ID
    );
    TYPE t_lote IS TABLE OF t_pago;

    v_lote t_lote := t_lote(
        t_pago(1,   22900, 'NEQUI'),   -- usuario válido
        t_pago(2,   33900, 'PSE'),     -- usuario válido
        t_pago(999, 22900, 'TARJETA') -- usuario 999 inexistente: viola FK → ROLLBACK TO sp
    );

    v_id_metodo   NUMBER;
    v_confirmados NUMBER := 0;
    v_descartados NUMBER := 0;
BEGIN
    -- Estado: ACTIVA
    FOR i IN 1 .. v_lote.COUNT LOOP
        BEGIN
            SAVEPOINT sp_pago;
            -- Estado: SAVEPOINT marcado para pago i

            -- Resolver id_metodo_pago por nombre
            SELECT id_metodo_pago
              INTO v_id_metodo
              FROM quindioflix.metodos_pago
             WHERE nombre_metodo = v_lote(i).metodo;

            INSERT INTO quindioflix.pagos (
                id_usuario, id_metodo_pago, monto, estado_pago, fecha_pago
            ) VALUES (
                v_lote(i).id_usuario, v_id_metodo,
                v_lote(i).monto, 'EXITOSO', SYSDATE
            );

            v_confirmados := v_confirmados + 1;
            DBMS_OUTPUT.PUT_LINE('Pago ' || i || ' OK: usuario '
                || v_lote(i).id_usuario || ' | $' || v_lote(i).monto
                || ' | ' || v_lote(i).metodo);

        EXCEPTION
            WHEN OTHERS THEN
                -- Descarta únicamente este pago, los anteriores se conservan
                ROLLBACK TO sp_pago;
                -- Estado: FALLIDA (solo este pago), transacción continúa
                v_descartados := v_descartados + 1;
                DBMS_OUTPUT.PUT_LINE('Pago ' || i || ' DESCARTADO (usuario '
                    || v_lote(i).id_usuario || '): ' || SQLERRM);
        END;
    END LOOP;

    -- Confirma todos los pagos que sí fueron válidos
    COMMIT;
    -- Estado: CONFIRMADA (pagos válidos persistidos)

    DBMS_OUTPUT.PUT_LINE('--- Transaccion 2 finalizada: '
        || v_confirmados || ' confirmados, '
        || v_descartados || ' descartados. ---');
END;
/

-- =====================================================
-- TRANSACCION 3: Reembolso controlado de un pago
-- Bloquea la fila con FOR UPDATE, valida el estado,
-- aplica el reembolso y confirma. Si el pago no es
-- reembolsable, revierte y libera el bloqueo.
-- =====================================================
SET SERVEROUTPUT ON;

DECLARE
    v_id_pago       NUMBER := 5;
    v_estado_actual VARCHAR2(15);
    e_no_reembolsable EXCEPTION;
BEGIN
    -- Estado: ACTIVA
    -- Bloquea la fila: otra sesión con FOR UPDATE esperará
    -- hasta que esta transacción haga COMMIT o ROLLBACK
    SELECT estado_pago
      INTO v_estado_actual
      FROM quindioflix.pagos
     WHERE id_pago = v_id_pago
       FOR UPDATE;

    SAVEPOINT sp_antes_reembolso;
    -- Estado: SAVEPOINT marcado

    -- Regla de negocio: solo se reembolsa lo que fue EXITOSO
    IF v_estado_actual <> 'EXITOSO' THEN
        RAISE e_no_reembolsable;
    END IF;

    UPDATE quindioflix.pagos
       SET estado_pago = 'REEMBOLSADO'
     WHERE id_pago = v_id_pago;
    -- Estado: PARCIALMENTE CONFIRMADA

    COMMIT;
    -- Estado: CONFIRMADA — bloqueo liberado

    DBMS_OUTPUT.PUT_LINE('Transaccion 3 CONFIRMADA: reembolso aplicado al pago '
        || v_id_pago || ' (estaba en estado ' || v_estado_actual || ')');

EXCEPTION
    WHEN e_no_reembolsable THEN
        -- El UPDATE nunca se ejecutó, solo hace falta cerrar la transacción
        ROLLBACK;
        -- Estado: ABORTADA — bloqueo FOR UPDATE liberado
        DBMS_OUTPUT.PUT_LINE('Transaccion 3 RECHAZADA: el pago ' || v_id_pago
            || ' esta en estado ' || v_estado_actual
            || ' y no puede ser reembolsado.');

    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        -- Estado: ABORTADA
        DBMS_OUTPUT.PUT_LINE('Transaccion 3 RECHAZADA: el pago '
            || v_id_pago || ' no existe.');

    WHEN OTHERS THEN
        ROLLBACK;
        -- Estado: ABORTADA
        DBMS_OUTPUT.PUT_LINE('Transaccion 3: error - ' || SQLERRM);
END;
/

SELECT id_pago, id_usuario, monto, estado_pago
FROM quindioflix.pagos
WHERE estado_pago = 'EXITOSO'
  AND ROWNUM <= 5;
  
-- =====================================================
-- TRANSACCION 3: Reembolso controlado de un pago
-- =====================================================
SET SERVEROUTPUT ON;

DECLARE
    v_id_pago       NUMBER := 102;  -- pago EXITOSO de la TX2
    v_estado_actual VARCHAR2(15);
    e_no_reembolsable EXCEPTION;
BEGIN
    SELECT estado_pago
      INTO v_estado_actual
      FROM quindioflix.pagos
     WHERE id_pago = v_id_pago
       FOR UPDATE;

    SAVEPOINT sp_antes_reembolso;

    IF v_estado_actual <> 'EXITOSO' THEN
        RAISE e_no_reembolsable;
    END IF;

    UPDATE quindioflix.pagos
       SET estado_pago = 'REEMBOLSADO'
     WHERE id_pago = v_id_pago;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Transaccion 3 CONFIRMADA: reembolso aplicado al pago '
        || v_id_pago || ' (estaba en estado ' || v_estado_actual || ')');

EXCEPTION
    WHEN e_no_reembolsable THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Transaccion 3 RECHAZADA: el pago ' || v_id_pago
            || ' esta en estado ' || v_estado_actual
            || ' y no puede ser reembolsado.');
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Transaccion 3 RECHAZADA: el pago '
            || v_id_pago || ' no existe.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Transaccion 3: error - ' || SQLERRM);
END;
/

-- =====================================================
-- VERIFICACION: confirmar que el estado cambio
-- =====================================================
SELECT id_pago,
       id_usuario,
       monto,
       estado_pago,
       fecha_pago
  FROM quindioflix.pagos
 WHERE id_pago = 102;
 
 -- =====================================================
-- TRANSACCION 3: Reembolso controlado de un pago
-- CASO 1: Pago EXITOSO → debe CONFIRMARSE
-- CASO 2: Pago PENDIENTE → debe RECHAZARSE
-- CASO 3: Pago inexistente → debe lanzar NO_DATA_FOUND
-- =====================================================
SET SERVEROUTPUT ON;

-- =====================================================
-- CASO 1: id_pago = 102 (estado EXITOSO) → CONFIRMADA
-- =====================================================
DECLARE
    v_id_pago         NUMBER := 102;
    v_estado_actual   VARCHAR2(15);
    e_no_reembolsable EXCEPTION;
BEGIN
    SELECT estado_pago
      INTO v_estado_actual
      FROM quindioflix.pagos
     WHERE id_pago = v_id_pago
       FOR UPDATE;

    SAVEPOINT sp_antes_reembolso;

    IF v_estado_actual <> 'EXITOSO' THEN
        RAISE e_no_reembolsable;
    END IF;

    UPDATE quindioflix.pagos
       SET estado_pago = 'REEMBOLSADO'
     WHERE id_pago = v_id_pago;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('[CASO 1] Transaccion 3 CONFIRMADA: reembolso aplicado al pago '
        || v_id_pago || ' (estaba en estado ' || v_estado_actual || ')');

EXCEPTION
    WHEN e_no_reembolsable THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('[CASO 1] Transaccion 3 RECHAZADA: el pago ' || v_id_pago
            || ' esta en estado ' || v_estado_actual || ' y no puede ser reembolsado.');
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('[CASO 1] Transaccion 3 RECHAZADA: el pago '
            || v_id_pago || ' no existe.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('[CASO 1] Transaccion 3: error - ' || SQLERRM);
END;
/

-- =====================================================
-- CASO 2: id_pago = 5 (estado PENDIENTE) → RECHAZADA
-- =====================================================
DECLARE
    v_id_pago         NUMBER := 5;
    v_estado_actual   VARCHAR2(15);
    e_no_reembolsable EXCEPTION;
BEGIN
    SELECT estado_pago
      INTO v_estado_actual
      FROM quindioflix.pagos
     WHERE id_pago = v_id_pago
       FOR UPDATE;

    SAVEPOINT sp_antes_reembolso;

    IF v_estado_actual <> 'EXITOSO' THEN
        RAISE e_no_reembolsable;
    END IF;

    UPDATE quindioflix.pagos
       SET estado_pago = 'REEMBOLSADO'
     WHERE id_pago = v_id_pago;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('[CASO 2] Transaccion 3 CONFIRMADA: reembolso aplicado al pago '
        || v_id_pago || ' (estaba en estado ' || v_estado_actual || ')');

EXCEPTION
    WHEN e_no_reembolsable THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('[CASO 2] Transaccion 3 RECHAZADA: el pago ' || v_id_pago
            || ' esta en estado ' || v_estado_actual || ' y no puede ser reembolsado.');
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('[CASO 2] Transaccion 3 RECHAZADA: el pago '
            || v_id_pago || ' no existe.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('[CASO 2] Transaccion 3: error - ' || SQLERRM);
END;
/

-- =====================================================
-- CASO 3: id_pago = 9999 (inexistente) → NO_DATA_FOUND
-- =====================================================
DECLARE
    v_id_pago         NUMBER := 9999;
    v_estado_actual   VARCHAR2(15);
    e_no_reembolsable EXCEPTION;
BEGIN
    SELECT estado_pago
      INTO v_estado_actual
      FROM quindioflix.pagos
     WHERE id_pago = v_id_pago
       FOR UPDATE;

    SAVEPOINT sp_antes_reembolso;

    IF v_estado_actual <> 'EXITOSO' THEN
        RAISE e_no_reembolsable;
    END IF;

    UPDATE quindioflix.pagos
       SET estado_pago = 'REEMBOLSADO'
     WHERE id_pago = v_id_pago;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('[CASO 3] Transaccion 3 CONFIRMADA: reembolso aplicado al pago '
        || v_id_pago || ' (estaba en estado ' || v_estado_actual || ')');

EXCEPTION
    WHEN e_no_reembolsable THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('[CASO 3] Transaccion 3 RECHAZADA: el pago ' || v_id_pago
            || ' esta en estado ' || v_estado_actual || ' y no puede ser reembolsado.');
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('[CASO 3] Transaccion 3 RECHAZADA: el pago '
            || v_id_pago || ' no existe.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('[CASO 3] Transaccion 3: error - ' || SQLERRM);
END;
/

-- =====================================================
-- VERIFICACION FINAL: confirmar estado en la BD
-- =====================================================
SELECT id_pago,
       id_usuario,
       monto,
       estado_pago,
       fecha_pago
  FROM quindioflix.pagos
 WHERE id_pago IN (102, 5, 9999)
 ORDER BY id_pago;