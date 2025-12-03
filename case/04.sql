/* 🎫 TICKET — Categorías con riesgo de precio y stock

El área de Operaciones quiere un pequeño reporte por categoría usando la tabla productos.

📌 Tabla: productos
📌 Columnas relevantes (supuestas):

id

nombre

categoria

precio

stock

Requerimientos

Filtrar productos:
-----------------

Considerar solo los productos cuyo precio esté entre 3.000 y 9.000.

-----------------
Agrupar:

SELECT
-------------
Agrupar los resultados por categoria.

Columnas a mostrar:

categoria

total_items → cantidad de productos en esa categoría.

precio_promedio → precio promedio de la categoría.

nivel_riesgo → etiqueta calculada según esta lógica:

'alto' si el producto tiene stock menor a 10 o precio mayor a 8.000.

'normal' en caso contrario.

-------------------
Filtrado por grupo (después de agrupar):

Incluir solo las categorías que:

tengan al menos 3 productos,
y

tengan un precio promedio mayor a 4.000.

-----------------
Orden:

Ordenar el resultado por precio_promedio de mayor a menor.

En caso de empate, ordenar por total_items de menor a mayor.

Notas del área:

No necesitan ver productos individuales, solo el resumen por categoría.

Quieren poder ver claramente qué categorías tienen nivel_riesgo más presente en la tabla. */

SELECT
    categoria,
    COUNT(*)      AS total_items,
    AVG(precio)   AS precio_promedio,
    CASE
        WHEN MIN(stock) < 10
          OR MAX(precio) > 8000
        THEN 'alto'
        ELSE 'normal'
    END           AS nivel_riesgo
FROM productos
WHERE precio BETWEEN 3000 AND 9000
GROUP BY categoria
HAVING
    COUNT(*)    >= 3
    AND AVG(precio) > 4000
ORDER BY
    precio_promedio DESC,
    total_items     ASC;
