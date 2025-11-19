/* Mostrar nombre, categoría y stock de los productos que:

Su nombre termine con una consonante.

Su categoría contenga la palabra “libro” sin importar mayúsculas.

Su stock sea mayor a 20.

Ordenar por nombre de A a Z.

Mostrar solo los primeros 6 resultados. */

SELECT nombre, categoria, stock
FROM productos
WHERE nombre ~* '[^aeiou]$'
AND categoria ILIKE '%libro%'
AND stock > 20
ORDER BY nombre ASC
limit 6;