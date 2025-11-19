/* 🧩 CONSIGNA NIVEL EXPERTO (PostgreSQL — agregaciones + regex + ILIKE)

A partir de la tabla productos, obtener un reporte agregado que muestre:

La categoría,

La cantidad total de productos en esa categoría,

El precio promedio,

El precio mínimo,

El precio máximo,

pero solo para las categorías que cumplan:

el nombre de la categoría empiece con una letra,

O el nombre de la categoría contenga la palabra “tech” sin importar mayúsculas,

y además el stock de los productos sea mayor a 10.

Agrupar por categoría,
ordenar por precio promedio de mayor a menor,
y mostrar solo los primeros 5 grupos. */
SELECT COUNT(*)
       AVG(precio)
       MIN(precio)
       MAX(precio)
FROM categoria
WHERE (categoria ~ '^[a-z]'
OR
nombre ILIKE '%tech%')
AND stock < 10
GROUP BY categoria, AVG(precio) DESC
LIMIT 5;
