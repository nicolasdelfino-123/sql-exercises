/* Mostrar por categoría:

categoría

precio mínimo

precio promedio
Solo productos con nombre que comience con vocal (~* '^[aeiou]')
Ordenar por precio promedio ASC. */

SELECT categoria
MIN(precio) AS precio_min,
AVG(precio) AS precio_promedio
FROM productos
WHERE nombre ~* '^[aeiou]'
ORDER BY categoria
ORDER BY precio_promedio ASC