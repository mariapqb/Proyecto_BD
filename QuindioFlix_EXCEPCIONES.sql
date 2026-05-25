-- =====================================================
-- QUINDIOFLIX - BASE DE DATOS
-- PUNTO 3.2.4 MANEJO DE EXCEPCIONES
-- =====================================================
-- a) Excepciones en SP_REGISTRAR_USUARIO
--    - e_email_existe  (-20001): email duplicado
--    - NO_DATA_FOUND   (-20002): plan o metodo de pago inexistente
--
-- b) Excepciones en SP_CAMBIAR_PLAN
--    - e_excede_perfiles (-20010): perfiles superan limite del plan
--    - ORA-20011: usuario inexistente
--    - NO_DATA_FOUND    (-20012): plan destino inexistente
--
-- c) Excepciones en SP_REPORTE_CONSUMO
--    - ORA-20020: usuario no encontrado
--    - ORA-20021: rango de fechas invertido
--
-- d) Excepciones en FN_CALCULAR_MONTO
--    - NO_DATA_FOUND -> RETURN NULL: usuario inexistente
--    - v_primer_pago IS NULL -> RETURN NULL: sin pagos exitosos
--
-- NOTA: Los procedimientos y funciones ya estan creados
-- en los archivos 3_2_2 y 3_2_3. Este archivo demuestra
-- de forma aislada cada excepcion con su caso de prueba.
-- =====================================================


-- =====================================================
-- 3.2.4.a EXCEPCIONES EN SP_REGISTRAR_USUARIO
--
-- EXCEPCION 1: e_email_existe (-20001)
--   Definida con PRAGMA EXCEPTION_INIT para asociar el
--   codigo -20001 a una variable de excepcion nombrada.
--   Se lanza con RAISE_APPLICATION_ERROR cuando el COUNT
--   del email devuelve un valor mayor a cero.
--   El bloque EXCEPTION la captura, ejecuta ROLLBACK y
--   relanza con RAISE para que el llamador la reciba.
--
-- EXCEPCION 2: NO_DATA_FOUND (-20002)
--   Oracle lanza NO_DATA_FOUND automaticamente cuando un
--   SELECT INTO no retorna filas (plan o metodo inexistente).
--   El bloque EXCEPTION la transforma en -20002 con un
--   mensaje descriptivo mediante RAISE_APPLICATION_ERROR.
--
-- Estructura del manejo:
--
--   DECLARE
--       e_email_existe EXCEPTION;
--       PRAGMA EXCEPTION_INIT(e_email_existe, -20001);
--   BEGIN
--       IF v_count > 0 THEN
--           RAISE_APPLICATION_ERROR(-20001,
--               'El email ya esta registrado en la plataforma');
--       END IF;
--
--       SELECT precio_mensual INTO v_precio_plan   -- NO_DATA_FOUND si no existe
--         FROM quindioflix.planes WHERE id_plan = p_id_plan;
--
--   EXCEPTION
--       WHEN e_email_existe THEN
--           ROLLBACK; RAISE;
--       WHEN NO_DATA_FOUND THEN
--           ROLLBACK;
--           RAISE_APPLICATION_ERROR(-20002,
--               'El plan o metodo de pago especificado no existe');
--       WHEN OTHERS THEN
--           ROLLBACK; RAISE;
--   END;
-- =====================================================
SET SERVEROUTPUT ON;

-- PRUEBA 3.2.4.a-1: Email duplicado → ORA-20001
-- Precondicion: 'camilo.cardona@mail.com' ya existe en la BD
DECLARE
    v_id NUMBER;
BEGIN
    quindioflix.sp_registrar_usuario(
        p_nombre         => 'Duplicado Test',
        p_email          => 'camilo.cardona@mail.com',
        p_telefono       => '3100000000',
        p_fecha_nac      => DATE '1990-01-01',
        p_id_ciudad      => 24,
        p_id_plan        => 1,
        p_id_referente   => NULL,
        p_metodo_pago    => 'PSE',
        p_id_usuario_out => v_id
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[3.2.4.a-1] Email duplicado capturado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
END;
/

-- PRUEBA 3.2.4.a-2: Plan inexistente → ORA-20002
DECLARE
    v_id NUMBER;
BEGIN
    quindioflix.sp_registrar_usuario(
        p_nombre         => 'Plan Test',
        p_email          => 'plan.test@mail.com',
        p_telefono       => '3100000001',
        p_fecha_nac      => DATE '1992-05-20',
        p_id_ciudad      => 24,
        p_id_plan        => 99,
        p_id_referente   => NULL,
        p_metodo_pago    => 'TARJETA',
        p_id_usuario_out => v_id
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[3.2.4.a-2] Plan inexistente capturado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
END;
/

-- PRUEBA 3.2.4.a-3: Metodo de pago inexistente → ORA-20002
DECLARE
    v_id NUMBER;
BEGIN
    quindioflix.sp_registrar_usuario(
        p_nombre         => 'Metodo Test',
        p_email          => 'metodo.test@mail.com',
        p_telefono       => '3100000002',
        p_fecha_nac      => DATE '1995-08-15',
        p_id_ciudad      => 24,
        p_id_plan        => 1,
        p_id_referente   => NULL,
        p_metodo_pago    => 'BITCOIN',
        p_id_usuario_out => v_id
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[3.2.4.a-3] Metodo de pago inexistente capturado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
END;
/


-- =====================================================
-- 3.2.4.b EXCEPCIONES EN SP_CAMBIAR_PLAN
--
-- EXCEPCION 1: e_excede_perfiles (-20010)
--   Se lanza cuando el usuario tiene mas perfiles activos
--   de los que permite el nuevo plan. Usa PRAGMA EXCEPTION_INIT
--   para asociar el codigo -20010 a la variable nombrada.
--
-- EXCEPCION 2: ORA-20011
--   Se lanza con RAISE_APPLICATION_ERROR cuando el COUNT
--   del usuario devuelve cero.
--
-- EXCEPCION 3: NO_DATA_FOUND → -20012
--   Oracle la lanza al hacer SELECT INTO sobre un plan
--   que no existe. Se transforma en -20012.
-- =====================================================

-- PRUEBA 3.2.4.b-1: Exceso de perfiles → ORA-20010
-- Usuario 3 tiene 3 perfiles, BASICO permite maximo 2
BEGIN
    quindioflix.sp_cambiar_plan(
        p_id_usuario    => 3,
        p_id_nuevo_plan => 1
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[3.2.4.b-1] Exceso de perfiles capturado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
END;
/

-- PRUEBA 3.2.4.b-2: Usuario inexistente → ORA-20011
BEGIN
    quindioflix.sp_cambiar_plan(
        p_id_usuario    => 999,
        p_id_nuevo_plan => 2
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[3.2.4.b-2] Usuario inexistente capturado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
END;
/

-- PRUEBA 3.2.4.b-3: Plan destino inexistente → ORA-20012
BEGIN
    quindioflix.sp_cambiar_plan(
        p_id_usuario    => 2,
        p_id_nuevo_plan => 99
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[3.2.4.b-3] Plan destino inexistente capturado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
END;
/


-- =====================================================
-- 3.2.4.c EXCEPCIONES EN SP_REPORTE_CONSUMO
--
-- EXCEPCION 1: ORA-20020
--   RAISE_APPLICATION_ERROR cuando COUNT del usuario = 0.
--
-- EXCEPCION 2: ORA-20021
--   RAISE_APPLICATION_ERROR cuando p_fecha_inicio > p_fecha_fin.
--   No depende de datos de la BD, es validacion de negocio pura.
-- =====================================================

-- PRUEBA 3.2.4.c-1: Usuario inexistente → ORA-20020
BEGIN
    quindioflix.sp_reporte_consumo(
        p_id_usuario   => 999,
        p_fecha_inicio => DATE '2026-01-01',
        p_fecha_fin    => DATE '2026-12-31'
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[3.2.4.c-1] Usuario inexistente capturado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
END;
/

-- PRUEBA 3.2.4.c-2: Rango de fechas invertido → ORA-20021
BEGIN
    quindioflix.sp_reporte_consumo(
        p_id_usuario   => 1,
        p_fecha_inicio => DATE '2026-12-31',
        p_fecha_fin    => DATE '2026-01-01'
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            '[3.2.4.c-2] Fechas invertidas capturado correctamente' || CHR(10) ||
            '  Codigo : ' || SQLCODE || CHR(10) ||
            '  Mensaje: ' || SQLERRM
        );
END;
/


-- =====================================================
-- 3.2.4.d EXCEPCIONES EN FN_CALCULAR_MONTO
--
-- EXCEPCION 1: NO_DATA_FOUND → RETURN NULL
--   El SELECT INTO del plan lanza NO_DATA_FOUND si el
--   usuario no existe. La funcion retorna NULL en lugar
--   de propagar la excepcion al llamador.
--
-- EXCEPCION 2: v_primer_pago IS NULL → RETURN NULL
--   No es una excepcion de Oracle sino una validacion
--   explicita: si MIN(fecha_pago) devuelve NULL (ningun
--   pago EXITOSO), se retorna NULL antes de calcular.
-- =====================================================

-- PRUEBA 3.2.4.d-1: Usuario inexistente → RETURN NULL
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        '[3.2.4.d-1] Usuario inexistente:' || CHR(10) ||
        '  Resultado: ' ||
        NVL(TO_CHAR(quindioflix.fn_calcular_monto(999)), 'NULL — NO_DATA_FOUND capturado')
    );
END;
/

-- PRUEBA 3.2.4.d-2: Sin pagos exitosos → RETURN NULL
-- Usuario 3 solo tiene pagos FALLIDO en el DML
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        '[3.2.4.d-2] Sin pagos exitosos:' || CHR(10) ||
        '  Resultado: ' ||
        NVL(TO_CHAR(quindioflix.fn_calcular_monto(3)), 'NULL — v_primer_pago IS NULL')
    );
END;
/
