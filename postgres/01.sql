/* 🧩 CONSINGA (PostgreSQL — regex + ilike + or/and)

Mostrar nombre, categoría y precio de los productos que:

Su nombre empiece con una consonante
(usar ~)

Su nombre contenga la sílaba “ma” sin importar mayúsculas
(usar ~* o ILIKE)

Y que su categoría NO termine en vocal
(usar !~)

Ordenar por precio de mayor a menor

Mostrar solo los primeros 7 */

SELECT nombre, categoria, precio
FROM productos
WHERE LOWER(nombre) ~ '^[^aeiou]'
AND nombre ILIKE '%ma%'
/* AND nombre ~* hacelo con eso y explicalo porque no lo aprendi aun*/
AND categoria !~ '[aeiouAEIOU]$'
ORDER BY precio DESC
LIMIT 7;