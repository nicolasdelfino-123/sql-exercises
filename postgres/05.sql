/* 🧩 CONSIGNA NIVEL EXPERTO (PostgreSQL)

Mostrar nombre, categoría y stock de los productos que:

Su nombre tenga dos palabras, cada una compuesta solo de letras.

O su categoría empiece con la palabra “super” sin importar mayúsculas.

Y su stock esté entre 15 y 60.

Ordenar por categoría alfabéticamente.

Mostrar los primeros 7 resultados. */

SELECT nombre, categoria, stock
FROM productos
WHERE (nombre ~* '[a-z]+ [a-z]$'
OR
categoria ILIKE '%super')
AND stock BETWEEN 15 AND 60
ORDER BY categoria
LIMIT 7;