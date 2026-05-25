/*==============================================================
 QUINDIOFLIX - CONSULTAS ORGANIZADAS Y CORREGIDAS
 Basadas en la estructura real del modelo
==============================================================*/


/*==============================================================
1. CONSULTAS PARAMETRIZADAS
==============================================================*/

-- 1.1 Usuarios por ciudad
SELECT u.id_usuario,
       u.nombre,
       u.email,
       c.nombre AS ciudad,
       u.estado
FROM quindioflix.usuarios u
JOIN quindioflix.ciudades c
    ON u.id_ciudad = c.id_ciudad
WHERE UPPER(c.nombre) = UPPER('&CIUDAD');

--------------------------------------------------------------

-- 1.2 Contenido por tipo
SELECT id_contenido,
       titulo,
       tipo_contenido,
       clasificacion_edad,
       anio_lanzamiento
FROM quindioflix.contenido
WHERE UPPER(tipo_contenido) = UPPER('&&TIPO');

--------------------------------------------------------------

-- 1.3 Reproducciones desde fecha
DEFINE FECHA_INICIO = '2026-03-01'

SELECT r.id_reproduccion,
       p.nombre AS perfil,
       c.titulo,
       r.fecha_inicio,
       r.dispositivo
FROM quindioflix.reproducciones r
JOIN quindioflix.perfiles p
    ON r.id_perfil = p.id_perfil
JOIN quindioflix.contenido c
    ON r.id_contenido = c.id_contenido
WHERE r.fecha_inicio >= TO_DATE('&FECHA_INICIO','YYYY-MM-DD');


/*==============================================================
2. CONSULTAS PIVOT Y UNPIVOT
==============================================================*/

-- 2.1 Pagos por método de pago
SELECT *
FROM (
    SELECT mp.nombre_metodo,
           p.estado_pago
    FROM quindioflix.pagos p
    JOIN quindioflix.metodos_pago mp
      ON p.id_metodo_pago = mp.id_metodo_pago
)
PIVOT (
    COUNT(*) FOR nombre_metodo IN (
        'TARJETA',
        'PSE',
        'NEQUI',
        'DAVIPLATA',
        'PAYPAL'
    )
);

--------------------------------------------------------------

-- 2.2 Cantidad de contenido por clasificación
SELECT *
FROM (
    SELECT tipo_contenido,
           clasificacion_edad
    FROM quindioflix.contenido
)
PIVOT (
    COUNT(*) FOR clasificacion_edad IN (
        'TP','+7','+13','+16','+18'
    )
);

--------------------------------------------------------------

-- 2.3 UNPIVOT planes
SELECT *
FROM (
    SELECT id_plan,
           precio_mensual,
           pantallas_simultaneas,
           max_perfiles
    FROM quindioflix.planes
)
UNPIVOT (
    valor FOR atributo IN (
        precio_mensual,
        pantallas_simultaneas,
        max_perfiles
    )
);

--------------------------------------------------------------

-- 2.4 UNPIVOT métricas pagos usuario
SELECT *
FROM (
    SELECT id_usuario,
           COUNT(*) cantidad_pagos,
           SUM(monto) total_pagado
    FROM quindioflix.pagos
    GROUP BY id_usuario
)
UNPIVOT (
    valor FOR tipo IN (
        cantidad_pagos,
        total_pagado
    )
);


/*==============================================================
3. GROUP BY AVANZADO
==============================================================*/

-- 3.1 ROLLUP ingresos por usuario
SELECT id_usuario,
       estado_pago,
       SUM(monto) total
FROM quindioflix.pagos
GROUP BY ROLLUP(id_usuario, estado_pago);

--------------------------------------------------------------

-- 3.2 CUBE pagos por método y estado
SELECT mp.nombre_metodo,
       p.estado_pago,
       COUNT(*) cantidad
FROM quindioflix.pagos p
JOIN quindioflix.metodos_pago mp
  ON p.id_metodo_pago = mp.id_metodo_pago
GROUP BY CUBE(mp.nombre_metodo, p.estado_pago);

--------------------------------------------------------------

-- 3.3 GROUPING()
SELECT id_usuario,
       estado_pago,
       SUM(monto) total,
       GROUPING(id_usuario) g_usuario,
       GROUPING(estado_pago) g_estado
FROM quindioflix.pagos
GROUP BY ROLLUP(id_usuario, estado_pago);

--------------------------------------------------------------

-- 3.4 GROUPING SETS
SELECT mp.nombre_metodo,
       p.estado_pago,
       COUNT(*) cantidad
FROM quindioflix.pagos p
JOIN quindioflix.metodos_pago mp
  ON p.id_metodo_pago = mp.id_metodo_pago
GROUP BY GROUPING SETS (
    (mp.nombre_metodo),
    (p.estado_pago),
    ()
);


/*==============================================================
4. MATERIALIZED VIEWS
==============================================================*/

-- 4.1 Consumo por contenido
CREATE MATERIALIZED VIEW mv_consumo_contenido
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT c.id_contenido,
       c.titulo,
       COUNT(*) total_reproducciones
FROM quindioflix.reproducciones r
JOIN quindioflix.contenido c
   ON r.id_contenido = c.id_contenido
GROUP BY c.id_contenido, c.titulo;

--------------------------------------------------------------

-- 4.2 Ingresos por usuario
CREATE MATERIALIZED VIEW mv_ingresos_usuario
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT u.id_usuario,
       u.nombre,
       SUM(p.monto) total_pagado
FROM quindioflix.pagos p
JOIN quindioflix.usuarios u
   ON p.id_usuario = u.id_usuario
WHERE p.estado_pago = 'EXITOSO'
GROUP BY u.id_usuario, u.nombre;


/*==============================================================
5. CONSULTAS ANALÍTICAS PROFESIONALES
==============================================================*/

-- 5.1 Top 10 contenidos más vistos
SELECT c.titulo,
       COUNT(*) visualizaciones
FROM quindioflix.reproducciones r
JOIN quindioflix.contenido c
   ON r.id_contenido = c.id_contenido
GROUP BY c.titulo
ORDER BY visualizaciones DESC
FETCH FIRST 10 ROWS ONLY;

--------------------------------------------------------------

-- 5.2 Usuarios que más pagan
SELECT u.nombre,
       SUM(p.monto) total_pagado
FROM quindioflix.pagos p
JOIN quindioflix.usuarios u
   ON p.id_usuario = u.id_usuario
WHERE p.estado_pago = 'EXITOSO'
GROUP BY u.nombre
ORDER BY total_pagado DESC;

--------------------------------------------------------------

-- 5.3 Promedio de calificaciones por contenido
SELECT c.titulo,
       ROUND(AVG(cal.estrellas),2) promedio
FROM quindioflix.calificaciones cal
JOIN quindioflix.contenido c
   ON cal.id_contenido = c.id_contenido
GROUP BY c.titulo
ORDER BY promedio DESC;

--------------------------------------------------------------

-- 5.4 Reportes pendientes
SELECT r.id_reporte,
       u.nombre usuario,
       c.titulo contenido,
       r.motivo,
       r.fecha_reporte
FROM quindioflix.reportes r
JOIN quindioflix.usuarios u
   ON r.id_usuario_reporta = u.id_usuario
JOIN quindioflix.contenido c
   ON r.id_contenido = c.id_contenido
WHERE r.estado = 'PENDIENTE';
