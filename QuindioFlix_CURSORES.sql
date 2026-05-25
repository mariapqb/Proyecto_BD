-- =====================================================
-- QUINDIOFLIX - BASE DE DATOS
-- PUNTO 3.2.1 CURSORES
-- =====================================================
-- a) Cursor: Usuarios con suscripcion vencida (>30 dias)
-- b) Cursor: Popularidad por contenido (reproducciones >= 90%)
-- =====================================================


-- =====================================================
-- 3.2.1.a CURSOR: Usuarios con suscripcion vencida (>30 dias)
-- Recorre todos los usuarios cuyo ultimo pago EXITOSO tiene
-- mas de 30 dias o que nunca han pagado, y genera un reporte
-- con nombre, email, plan, dias de mora y monto adeudado.
-- =====================================================
SET SERVEROUTPUT ON;

SAVEPOINT antes_de_prueba;

DECLARE
    CURSOR c_morosos IS
        SELECT u.id_usuario,
               u.nombre,
               u.email,
               pl.nombre        AS plan_actual,
               pl.precio_mensual,
               (SELECT MAX(pg.fecha_pago)
                  FROM quindioflix.pagos pg
                 WHERE pg.id_usuario  = u.id_usuario
                   AND pg.estado_pago = 'EXITOSO') AS ultimo_pago
          FROM quindioflix.usuarios u
          JOIN quindioflix.planes   pl
            ON u.id_plan = pl.id_plan
         WHERE u.estado = 'ACTIVO';

    v_dias_mora       NUMBER;
    v_monto_adeudado  NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== REPORTE DE USUARIOS EN MORA ===');

    FOR r IN c_morosos LOOP
        IF r.ultimo_pago IS NULL THEN
            v_dias_mora      := NULL;
            v_monto_adeudado := r.precio_mensual;
        ELSE
            v_dias_mora      := TRUNC(SYSDATE - r.ultimo_pago);
            v_monto_adeudado := r.precio_mensual;
        END IF;

        IF v_dias_mora IS NULL OR v_dias_mora > 30 THEN
            DBMS_OUTPUT.PUT_LINE(
                'Usuario: '   || r.nombre      ||
                ' | Email: '  || r.email        ||
                ' | Plan: '   || r.plan_actual  ||
                ' | Mora: '   || NVL(TO_CHAR(v_dias_mora), 'Sin pagos') || ' dias' ||
                ' | Monto: $' || v_monto_adeudado
            );
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('=== FIN DEL REPORTE ===');
END;
/

ROLLBACK TO SAVEPOINT antes_de_prueba;


-- =====================================================
-- 3.2.1.b CURSOR: Popularidad por contenido
-- Recorre el catalogo y para cada contenido calcula cuantas
-- reproducciones completas (porcentaje_avance >= 90%) ha tenido.
-- NOTA DE ADAPTACION: El esquema no posee la columna 'popularidad'
-- en CONTENIDO, por lo cual el resultado se imprime via
-- DBMS_OUTPUT en lugar de actualizar la tabla.
-- =====================================================
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_popularidad IS
        SELECT c.id_contenido,
               c.titulo,
               c.tipo_contenido,
               (SELECT COUNT(*)
                  FROM quindioflix.reproducciones r
                 WHERE r.id_contenido      = c.id_contenido
                   AND r.porcentaje_avance >= 90) AS reproducciones_completas
          FROM quindioflix.contenido c
         ORDER BY c.id_contenido;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== POPULARIDAD POR CONTENIDO ===');

    FOR r IN c_popularidad LOOP
        DBMS_OUTPUT.PUT_LINE(
            'ID: '        || r.id_contenido     ||
            ' | Titulo: ' || r.titulo            ||
            ' | Tipo: '   || r.tipo_contenido    ||
            ' | Reproducciones completas: ' || r.reproducciones_completas
        );
    END LOOP;
END;
/
