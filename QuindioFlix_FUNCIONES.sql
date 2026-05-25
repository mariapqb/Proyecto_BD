-- =====================================================
-- QUINDIOFLIX - BASE DE DATOS
-- PUNTO 3.2.3 FUNCIONES
-- =====================================================
-- a) FN_CALCULAR_MONTO
-- b) FN_CONTENIDO_RECOMENDADO
-- =====================================================


-- =====================================================
-- 3.2.3.a FUNCION: FN_CALCULAR_MONTO
-- Recibe un id_usuario y retorna el monto a cobrar el proximo
-- mes, considerando el plan actual y descuento por antiguedad:
--   * Mas de 12 meses: 10% de descuento
--   * Mas de 24 meses: 15% de descuento
-- La antiguedad se calcula desde el primer pago EXITOSO,
-- ya que el esquema no almacena fecha de registro.
-- Si el usuario no tiene ningun pago EXITOSO, retorna NULL.
-- =====================================================
CREATE OR REPLACE FUNCTION quindioflix.fn_calcular_monto(
    p_id_usuario IN NUMBER
) RETURN NUMBER
IS
    v_precio_plan   NUMBER;
    v_primer_pago   DATE;
    v_meses_activo  NUMBER;
    v_descuento     NUMBER := 0;
    v_monto_final   NUMBER;
BEGIN
    -- Obtener precio del plan del usuario
    SELECT pl.precio_mensual
      INTO v_precio_plan
      FROM quindioflix.usuarios u
      JOIN quindioflix.planes   pl
        ON u.id_plan = pl.id_plan
     WHERE u.id_usuario = p_id_usuario;

    -- Calcular antiguedad desde el primer pago exitoso
    SELECT MIN(fecha_pago)
      INTO v_primer_pago
      FROM quindioflix.pagos
     WHERE id_usuario  = p_id_usuario
       AND estado_pago = 'EXITOSO';

    -- Si nunca tuvo pago exitoso, no hay monto que cobrar
    IF v_primer_pago IS NULL THEN
        RETURN NULL;
    END IF;

    -- Aplicar descuento segun antiguedad
    v_meses_activo := MONTHS_BETWEEN(SYSDATE, v_primer_pago);

    IF v_meses_activo > 24 THEN
        v_descuento := 0.15;
    ELSIF v_meses_activo > 12 THEN
        v_descuento := 0.10;
    END IF;

    v_monto_final := v_precio_plan * (1 - v_descuento);

    RETURN ROUND(v_monto_final, 2);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END fn_calcular_monto;
/

-- ── Pruebas FN_CALCULAR_MONTO ─────────────────────────
SET SERVEROUTPUT ON;

-- CASO 1: Sin descuento — antiguedad < 12 meses
-- Usuario 1: plan ESTANDAR $24.900, primer pago 2026-01-01 (4 meses)
-- Esperado: $24.900
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'CASO 1 - Usuario 1 (4 meses, sin desc): $' ||
        quindioflix.fn_calcular_monto(1)
    );
END;
/

-- CASO 2: Descuento 10% — antiguedad > 12 meses
-- Usuario 4: BASICO $14.900, pago simulado hace 15 meses
-- Esperado: 14.900 * 0.90 = $13.410
BEGIN
    INSERT INTO quindioflix.pagos (id_usuario, id_metodo_pago, fecha_pago, monto, estado_pago)
    VALUES (4, 1, ADD_MONTHS(SYSDATE, -15), 14900, 'EXITOSO');

    DBMS_OUTPUT.PUT_LINE(
        'CASO 2 - Usuario 4 (15 meses, 10% desc): $' ||
        quindioflix.fn_calcular_monto(4)
    );

    ROLLBACK;
END;
/

-- CASO 3: Descuento 15% — antiguedad > 24 meses
-- Usuario 6: PREMIUM $34.900, pago simulado hace 30 meses
-- Esperado: 34.900 * 0.85 = $29.665
BEGIN
    INSERT INTO quindioflix.pagos (id_usuario, id_metodo_pago, fecha_pago, monto, estado_pago)
    VALUES (6, 1, ADD_MONTHS(SYSDATE, -30), 34900, 'EXITOSO');

    DBMS_OUTPUT.PUT_LINE(
        'CASO 3 - Usuario 6 (30 meses, 15% desc): $' ||
        quindioflix.fn_calcular_monto(6)
    );

    ROLLBACK;
END;
/

-- CASO 4: Usuario sin ningun pago EXITOSO → NULL
-- Usuario 3: solo tiene pagos FALLIDO en el DML
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'CASO 4 - Usuario 3 (sin pagos exitosos): ' ||
        NVL(TO_CHAR(quindioflix.fn_calcular_monto(3)), 'NULL — sin pago exitoso')
    );
END;
/

-- CASO 5: Usuario inexistente → NULL por NO_DATA_FOUND
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'CASO 5 - Usuario 999 (inexistente): ' ||
        NVL(TO_CHAR(quindioflix.fn_calcular_monto(999)), 'NULL — usuario no existe')
    );
END;
/


-- =====================================================
-- 3.2.3.b FUNCION: FN_CONTENIDO_RECOMENDADO
-- Recibe un id_perfil y retorna el titulo del contenido mas
-- afin al perfil, basandose en el genero mas reproducido por
-- ese perfil. Excluye contenido ya reproducido y prioriza
-- titulos con mejor calificacion promedio.
-- Si el perfil no tiene reproducciones o no hay candidatos,
-- retorna 'Sin recomendacion disponible para este perfil'.
-- =====================================================
CREATE OR REPLACE FUNCTION quindioflix.fn_contenido_recomendado(
    p_id_perfil IN NUMBER
) RETURN VARCHAR2
IS
    v_genero_favorito    NUMBER;
    v_titulo_recomendado VARCHAR2(150);
BEGIN
    -- 1. Determinar el genero mas reproducido por el perfil
    SELECT id_genero
      INTO v_genero_favorito
      FROM (
            SELECT cg.id_genero,
                   COUNT(*) AS total
              FROM quindioflix.reproducciones   r
              JOIN quindioflix.contenido_genero cg
                ON r.id_contenido = cg.id_contenido
             WHERE r.id_perfil = p_id_perfil
             GROUP BY cg.id_genero
             ORDER BY COUNT(*) DESC
           )
     WHERE ROWNUM = 1;

    -- 2. Buscar contenido de ese genero NO reproducido aun,
    --    ordenado por mejor calificacion promedio.
    --    En caso de empate, se usa id_contenido como desempate
    --    para garantizar resultado determinístico.
    SELECT titulo
      INTO v_titulo_recomendado
      FROM (
            SELECT c.titulo,
                   NVL(AVG(cal.estrellas), 0) AS prom_estrellas
              FROM quindioflix.contenido        c
              JOIN quindioflix.contenido_genero cg
                ON c.id_contenido = cg.id_contenido
              LEFT JOIN quindioflix.calificaciones cal
                ON cal.id_contenido = c.id_contenido
             WHERE cg.id_genero    = v_genero_favorito
               AND c.id_contenido NOT IN (
                       SELECT id_contenido
                         FROM quindioflix.reproducciones
                        WHERE id_perfil = p_id_perfil
                   )
             GROUP BY c.id_contenido, c.titulo
             ORDER BY NVL(AVG(cal.estrellas), 0) DESC, c.id_contenido ASC
           )
     WHERE ROWNUM = 1;

    RETURN v_titulo_recomendado;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Sin recomendacion disponible para este perfil';
END fn_contenido_recomendado;
/

-- ── Pruebas FN_CONTENIDO_RECOMENDADO ─────────────────
SET SERVEROUTPUT ON;

-- CASO 1: Recomendacion normal
-- Perfil 1: genero favorito = ACCION
-- Candidatos: Rapidos de la Selva (4.0), Reinos Perdidos (4.5),
--             El Ultimo Samurai Urbano (5.0), Heroinas del Futuro (0)
-- Esperado: 'El Ultimo Samurai Urbano'
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'CASO 1 - Perfil 1 (ACCION): ' ||
        quindioflix.fn_contenido_recomendado(1)
    );
END;
/

-- CASO 2: Empate en calificacion
-- Perfil 7: genero favorito = CIENCIA FICCION
-- Operacion Sigma, Guardianes del Tiempo y Codigo Humano con 5.0
-- Desempate por id_contenido ASC → Operacion Sigma (id=3)
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'CASO 2 - Perfil 7 (CIENCIA FICCION, empate 5 estrellas): ' ||
        quindioflix.fn_contenido_recomendado(7)
    );
END;
/

-- CASO 3: Perfil sin reproducciones → NO_DATA_FOUND en genero favorito
-- Se crea un perfil temporal con ROLLBACK al final
DECLARE
    v_id_perfil NUMBER;
BEGIN
    INSERT INTO quindioflix.perfiles (id_usuario, nombre, avatar, tipo)
    VALUES (1, 'Test', NULL, 'ADULTO')
    RETURNING id_perfil INTO v_id_perfil;

    DBMS_OUTPUT.PUT_LINE(
        'CASO 3 - Perfil sin reproducciones (id=' || v_id_perfil || '): ' ||
        quindioflix.fn_contenido_recomendado(v_id_perfil)
    );

    ROLLBACK;
END;
/

-- CASO 4: Perfil inexistente → NO_DATA_FOUND
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'CASO 4 - Perfil 9999 (inexistente): ' ||
        quindioflix.fn_contenido_recomendado(9999)
    );
END;
/
