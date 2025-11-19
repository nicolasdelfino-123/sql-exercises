/*  🧩 CONSINGA (PostgreSQL — GROUP BY + agregados + ORDER BY)

A partir de la tabla productos, obtener un reporte que muestre por categoría:

la cantidad total de productos,

el precio promedio,

el precio máximo.

Pero solo considerar los productos cuyo stock sea mayor a 20.

Ordenar el resultado final por el precio promedio de menor a mayor.*/
SELECT categoria
COUNT(*) AS cantidad_productos
AVG(precio) AS precio_promedio
MAX(precio) AS precio_max
FROM productos
WHERE stock > 20
ORDER BY categoria
GROUP BY precio_promedio ASC;