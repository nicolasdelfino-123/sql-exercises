/* 🔥 6. EJERCICIO RÁPIDO PARA VOS (cortito)

Mostrá por cada categoría:

categoría

cantidad de productos

precio promedio

precio mínimo

precio máximo

Solo productos con precio > 100.
Ordenar por precio promedio ASC. */
SELECT categoria
COUNT(*) AS cantidad_productos,
AVG(precio) AS promedio_precio,
MIN(precio) AS precio_minimo,
MAX(precio) AS precio_max
FROM productos
WHERE precio > 100
ORDER BY categoria 
ORDER BY promedio_precio