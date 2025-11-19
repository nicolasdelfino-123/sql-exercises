/* 🧩 ÚLTIMA CONSIGNA (PostgreSQL — GROUP BY + COUNT + AVG + MAX + ORDER BY)

A partir de la tabla productos, generar un reporte que muestre por cada categoría:

la cantidad de productos

el precio promedio

el precio máximo

Solo incluir las categorías cuyos productos tengan:

stock mayor a 30

y precio mayor a 500

Ordenar el resultado final por el precio máximo de mayor a menor. */
SELECT categoria,
COUNT(*) AS total_productos,
AVG(precio) AS precio_promedio,
MAX(precio) AS precio_max
FROM productos
WHERE stock > 30
AND precio > 500
GROUP BY categoria
ORDER BY precio_max DESC;