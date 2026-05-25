-- =====================================================
-- QUINDIOFLIX - BASE DE DATOS
-- PUNTO 3.2.2 PROCEDIMIENTOS ALMACENADOS
-- =====================================================
-- a) SP_REGISTRAR_USUARIO
-- b) SP_CAMBIAR_PLAN
-- c) SP_REPORTE_CONSUMO
-- =====================================================


-- =====================================================
-- 3.2.2.a PROCEDIMIENTO: SP_REGISTRAR_USUARIO
-- Recibe los datos del usuario y el plan elegido. Valida que
-- el email no exista, crea la cuenta, crea un perfil
-- predeterminado y registra el primer pago en estado PENDIENTE.
-- Maneja excepciones: e_email_existe y NO_DATA_FOUND.
-- =====================================================
CREATE OR REPLACE PROCEDURE quindioflix.sp_registrar_usuario(
    p_nombre         IN  VARCHAR2,
    p_email          IN  VARCHAR2,
    p_telefono       IN  VARCHAR2,
    p_fecha_nac      IN  DATE,
    p_id_ciudad      IN  NUMBER,
    p_id_plan        IN  NUMBER,
    p_id_referente   IN  NUMBER   DEFAULT NULL,
    p_metodo_pago    IN  VARCHAR2,
    p_id_usuario_out OUT NUMBER
) IS
    v_count          NUMBER;
    v_precio_plan    NUMBER;
    v_id_metodo      NUMBER;
    e_email_existe   EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_email_existe, -20001);
BEGIN
    -- 1. Validar unicidad de email
    SELECT COUNT(*)
      INTO v_count
      FROM quindioflix.usuarios
     WHERE LOWER(email) = LOWER(p_email);

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001,
            'El email ya esta registrado en la plataforma');
    END IF;

    -- 2. Validar que el plan existe y obtener precio
    SELECT precio_mensual
      INTO v_precio_plan
      FROM quindioflix.planes
     WHERE id_plan = p_id_plan;

    -- 3. Validar que el metodo de pago existe y obtener su ID
    SELECT id_metodo_pago
      INTO v_id_metodo
      FROM quindioflix.metodos_pago
     WHERE UPPER(nombre_metodo) = UPPER(p_metodo_pago);

    -- 4. Crear el usuario
    INSERT INTO quindioflix.usuarios (
        nombre, email, telefono, fecha_nacimiento,
        id_ciudad, id_plan, estado, id_usuario_referente
    ) VALUES (
        p_nombre, p_email, p_telefono, p_fecha_nac,
        p_id_ciudad, p_id_plan, 'ACTIVO', p_id_referente
    )
    RETURNING id_usuario INTO p_id_usuario_out;

    -- 5. Crear perfil predeterminado tipo ADULTO
    INSERT INTO quindioflix.perfiles (
        id_usuario, nombre, avatar, tipo
    ) VALUES (
        p_id_usuario_out, 'Principal', NULL, 'ADULTO'
    );

    -- 6. Registrar primer pago en estado PENDIENTE
    INSERT INTO quindioflix.pagos (
        id_usuario, id_metodo_pago, fecha_pago,
        monto, estado_pago
    ) VALUES (
        p_id_usuario_out, v_id_metodo, SYSDATE,
        v_precio_plan, 'PENDIENTE'
    );

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario creado con ID: ' || p_id_usuario_out);

EXCEPTION
    WHEN e_email_existe THEN
        ROLLBACK;
        RAISE;
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002,
            'El plan o metodo de pago especificado no existe');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_registrar_usuario;
/

-- ── Pruebas SP_REGISTRAR_USUARIO ─────────────────────
SET SERVEROUTPUT ON;

-- CASO 1: Registro exitoso
DECLARE
    v_id NUMBER;
BEGIN
    quindioflix.sp_registrar_usuario(
        p_nombre         => 'Camilo Cardona',
        p_email          => 'camilo.cardona@mail.com',
        p_telefono       => '3101234567',
        p_fecha_nac      => DATE '2000-06-15',
        p_id_ciudad      => 24,
        p_id_plan        => 2,
        p_id_referente   => NULL,
        p_metodo_pago    => 'NEQUI',
        p_id_usuario_out => v_id
    );
    DBMS_OUTPUT.PUT_LINE('CASO 1 OK - Nuevo ID: ' || v_id);
END;
/

-- CASO 2: Email duplicado → ORA-20001
DECLARE
    v_id NUMBER;
BEGIN
    quindioflix.sp_registrar_usuario(
        p_nombre         => 'Otro Usuario',
        p_email          => 'camilo.cardona@mail.com',
        p_telefono       => '3109999999',
        p_fecha_nac      => DATE '1995-01-01',
        p_id_ciudad      => 24,
        p_id_plan        => 1,
        p_id_referente   => NULL,
        p_metodo_pago    => 'PSE',
        p_id_usuario_out => v_id
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CASO 2 OK - Error esperado: ' || SQLERRM);
END;
/

-- CASO 3: Plan inexistente → ORA-20002
DECLARE
    v_id NUMBER;
BEGIN
    quindioflix.sp_registrar_usuario(
        p_nombre         => 'Test Plan',
        p_email          => 'test.plan@mail.com',
        p_telefono       => '3108888888',
        p_fecha_nac      => DATE '1990-03-10',
        p_id_ciudad      => 24,
        p_id_plan        => 99,
        p_id_referente   => NULL,
        p_metodo_pago    => 'TARJETA',
        p_id_usuario_out => v_id
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CASO 3 OK - Error esperado: ' || SQLERRM);
END;
/


-- =====================================================
-- 3.2.2.b PROCEDIMIENTO: SP_CAMBIAR_PLAN
-- Recibe el id del usuario y el nuevo plan. Valida que el
-- cambio sea posible: si el nuevo plan permite menos perfiles
-- que los que el usuario ya tiene, rechaza el cambio.
-- Excepciones: e_excede_perfiles y validacion de usuario.
-- =====================================================
CREATE OR REPLACE PROCEDURE quindioflix.sp_cambiar_plan(
    p_id_usuario     IN NUMBER,
    p_id_nuevo_plan  IN NUMBER
) IS
    v_max_perfiles_nuevo NUMBER;
    v_perfiles_actuales  NUMBER;
    v_count_usuario      NUMBER;
    v_plan_actual        NUMBER;
    e_excede_perfiles    EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_excede_perfiles, -20010);
BEGIN
    -- Validar existencia del usuario
    SELECT COUNT(*), MAX(id_plan)
      INTO v_count_usuario, v_plan_actual
      FROM quindioflix.usuarios
     WHERE id_usuario = p_id_usuario;

    IF v_count_usuario = 0 THEN
        RAISE_APPLICATION_ERROR(-20011,
            'El usuario con id ' || p_id_usuario || ' no existe');
    END IF;

    -- Si el plan nuevo es igual al actual, no hacer nada
    IF v_plan_actual = p_id_nuevo_plan THEN
        DBMS_OUTPUT.PUT_LINE('El usuario ya posee ese plan. No se realizan cambios.');
        RETURN;
    END IF;

    -- Obtener limite de perfiles del nuevo plan
    SELECT max_perfiles
      INTO v_max_perfiles_nuevo
      FROM quindioflix.planes
     WHERE id_plan = p_id_nuevo_plan;

    -- Contar perfiles actuales del usuario
    SELECT COUNT(*)
      INTO v_perfiles_actuales
      FROM quindioflix.perfiles
     WHERE id_usuario = p_id_usuario;

    -- Validar que el nuevo plan soporte los perfiles actuales
    IF v_perfiles_actuales > v_max_perfiles_nuevo THEN
        RAISE_APPLICATION_ERROR(-20010,
            'Cambio de plan rechazado: el usuario tiene ' ||
            v_perfiles_actuales || ' perfiles y el nuevo plan solo permite ' ||
            v_max_perfiles_nuevo || '. Elimine perfiles antes de cambiar.');
    END IF;

    -- Actualizar el plan
    UPDATE quindioflix.usuarios
       SET id_plan = p_id_nuevo_plan
     WHERE id_usuario = p_id_usuario;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Plan actualizado correctamente para el usuario ' || p_id_usuario);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20012,
            'El plan destino con id ' || p_id_nuevo_plan || ' no existe');
    WHEN e_excede_perfiles THEN
        ROLLBACK;
        RAISE;
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_cambiar_plan;
/

-- ── Pruebas SP_CAMBIAR_PLAN ───────────────────────────
SET SERVEROUTPUT ON;

-- CASO 1: Subida de plan exitosa
-- Usuario 1 (BASICO, 1 perfil) → ESTANDAR (max 4) → OK
BEGIN
    quindioflix.sp_cambiar_plan(
        p_id_usuario    => 1,
        p_id_nuevo_plan => 2
    );
END;
/

-- CASO 2: Bajada bloqueada por exceso de perfiles
-- Usuario 3 (PREMIUM, 3 perfiles) → BASICO (max 2) → ORA-20010
BEGIN
    quindioflix.sp_cambiar_plan(
        p_id_usuario    => 3,
        p_id_nuevo_plan => 1
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CASO 2 OK - Error esperado: ' || SQLERRM);
END;
/

-- CASO 3: Plan identico al actual → sin cambios
-- Usuario 2 ya tiene ESTANDAR (id=2)
BEGIN
    quindioflix.sp_cambiar_plan(
        p_id_usuario    => 2,
        p_id_nuevo_plan => 2
    );
END;
/

-- CASO 4: Usuario inexistente → ORA-20011
BEGIN
    quindioflix.sp_cambiar_plan(
        p_id_usuario    => 999,
        p_id_nuevo_plan => 1
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CASO 4 OK - Error esperado: ' || SQLERRM);
END;
/

-- CASO 5: Plan destino inexistente → ORA-20012
BEGIN
    quindioflix.sp_cambiar_plan(
        p_id_usuario    => 1,
        p_id_nuevo_plan => 99
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CASO 5 OK - Error esperado: ' || SQLERRM);
END;
/


-- =====================================================
-- 3.2.2.c PROCEDIMIENTO: SP_REPORTE_CONSUMO
-- Recibe un id_usuario y un rango de fechas, y genera un
-- reporte detallado con las reproducciones de cada perfil
-- del usuario, agrupadas por categoria de contenido, con
-- totales de reproducciones y minutos consumidos estimados.
-- =====================================================
CREATE OR REPLACE PROCEDURE quindioflix.sp_reporte_consumo(
    p_id_usuario   IN NUMBER,
    p_fecha_inicio IN DATE,
    p_fecha_fin    IN DATE
) IS
    CURSOR c_consumo IS
        SELECT p.id_perfil,
               p.nombre                              AS nombre_perfil,
               NVL(cat.nombre, 'Sin consumo')        AS categoria,
               COUNT(r.id_perfil)                    AS total_reproducciones,
               NVL(SUM(r.porcentaje_avance *
                       c.duracion_min / 100), 0)     AS minutos_consumidos
          FROM quindioflix.perfiles        p
          LEFT JOIN quindioflix.reproducciones r
                 ON r.id_perfil    = p.id_perfil
                AND r.fecha_inicio BETWEEN p_fecha_inicio AND p_fecha_fin
          LEFT JOIN quindioflix.contenido  c
                 ON r.id_contenido = c.id_contenido
          LEFT JOIN quindioflix.categorias cat
                 ON c.id_categoria = cat.id_categoria
         WHERE p.id_usuario = p_id_usuario
         GROUP BY p.id_perfil, p.nombre, cat.nombre
         ORDER BY p.id_perfil, cat.nombre;

    v_count NUMBER;
BEGIN
    -- Validar existencia del usuario
    SELECT COUNT(*)
      INTO v_count
      FROM quindioflix.usuarios
     WHERE id_usuario = p_id_usuario;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20020,
            'Usuario no encontrado: ' || p_id_usuario);
    END IF;

    -- Validar rango de fechas
    IF p_fecha_inicio > p_fecha_fin THEN
        RAISE_APPLICATION_ERROR(-20021,
            'La fecha de inicio no puede ser posterior a la fecha fin');
    END IF;

    DBMS_OUTPUT.PUT_LINE('=== REPORTE DE CONSUMO ===');
    DBMS_OUTPUT.PUT_LINE('Usuario ID : ' || p_id_usuario);
    DBMS_OUTPUT.PUT_LINE('Periodo    : ' ||
        TO_CHAR(p_fecha_inicio, 'YYYY-MM-DD') || ' a ' ||
        TO_CHAR(p_fecha_fin,    'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');

    FOR r IN c_consumo LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Perfil: '            || r.nombre_perfil        ||
            ' | Categoria: '      || r.categoria            ||
            ' | Reproducciones: ' || r.total_reproducciones ||
            ' | Minutos: '        || ROUND(r.minutos_consumidos, 2)
        );
    END LOOP;
END sp_reporte_consumo;
/

-- ── Pruebas SP_REPORTE_CONSUMO ────────────────────────
SET SERVEROUTPUT ON;

-- CASO 1: Reporte con datos reales
-- Usuario 3, periodo 2026-01-01 a 2026-04-30
-- Esperado:
--   Principal | SERIE   | 2 reprod | 60 min
--   Kids      | SERIE   | 2 reprod | 30,5 min
--   Pareja    | PODCAST | 2 reprod | 90 min
BEGIN
    quindioflix.sp_reporte_consumo(
        p_id_usuario   => 3,
        p_fecha_inicio => DATE '2026-01-01',
        p_fecha_fin    => DATE '2026-04-30'
    );
END;
/

-- CASO 2: Periodo sin reproducciones
-- LEFT JOIN garantiza que los perfiles aparecen con 0 y "Sin consumo"
BEGIN
    quindioflix.sp_reporte_consumo(
        p_id_usuario   => 3,
        p_fecha_inicio => DATE '2030-01-01',
        p_fecha_fin    => DATE '2030-12-31'
    );
END;
/

-- CASO 3: Rango de fechas invertido → ORA-20021
BEGIN
    quindioflix.sp_reporte_consumo(
        p_id_usuario   => 3,
        p_fecha_inicio => DATE '2026-12-31',
        p_fecha_fin    => DATE '2026-01-01'
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CASO 3 OK - Error esperado: ' || SQLERRM);
END;
/

-- CASO 4: Usuario inexistente → ORA-20020
BEGIN
    quindioflix.sp_reporte_consumo(
        p_id_usuario   => 999,
        p_fecha_inicio => DATE '2026-01-01',
        p_fecha_fin    => DATE '2026-12-31'
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CASO 4 OK - Error esperado: ' || SQLERRM);
END;
/
