/*La empresa necesita un pequeño reporte de categorías de productos.

Requisitos:

Considerar únicamente los productos que:

tengan stock > 0

tengan un precio entre 500 y 4000

cuyo nombre no empiece con vocal

y además cumplan:

la categoría sea "Útiles"
o

el nombre contenga la sílaba "ma" (ignorando mayúsculas/minúsculas)

Agrupar los resultados por categoría.

Mostrar por cada categoría:

la categoría

la cantidad total de productos

el precio promedio

el stock máximo

Filtrar los grupos para mostrar solo aquellos que:

tengan al menos 2 productos

y un precio promedio mayor a 1000

Ordenar el resultado por:

precio promedio (descendente)

cantidad total de productos (descendente)  ESTAAA MALLLLLL*/
SELECT categoria,
FROM productos
WHERE stock > 0
AND precio BETWEEN 500 AND 4000
AND nombre !~* '^[aeiou]'
AND (LOWER(categoria) = 'útiles' OR nombre ILIKE '%ma%')
GROUP BY categoria
LOWER(nombre) AS nombre_categoria,
COUNT(*) AS total_productos,
AVG(precio) AS precio_promedio,
MAX(stock) AS stock_max,
HAVING COUNT(*) >= 2
AND precio_promedio > 1000
ORDER BY precio DESC
ORDER BY total_productos DESC