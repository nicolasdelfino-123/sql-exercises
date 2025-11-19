 /* 🧩 CONSINGA (PostgreSQL — agregaciones + filtros + ORDER BY)

A partir de la tabla productos, obtener un reporte que muestre por categoría:

La cantidad de productos

El precio promedio

El precio mínimo

El precio máximo

Pero solo considerar las categorías cuyos productos:

Tengan stock mayor a 20

Y además:

la categoría sea “Oficina”,

o el nombre contenga “cuad” (ignorar mayúsculas con ~*)

Ordenar el resultado por precio promedio de mayor a menor.
Mostrar solo los primeros 5. */

SELECT categoria
COUNT(*) AS total_categoria