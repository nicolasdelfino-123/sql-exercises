/* 🧩 CONSIGNA (PostgreSQL — OR + AND + regex que NO repite lo anterior)

Mostrar nombre, categoría y precio de los productos que:

Su nombre contenga un número en cualquier parte

O su categoría termine con la palabra “premium” (ignorar mayúsculas)

Y su precio sea mayor a 500

Ordenar por nombre alfabéticamente

Mostrar solo los primeros 5 resultados */

SELECT nombre, categoria, precio
FROM productos
WHERE (nombre ~ '[0-9]'
OR
categoria ~* 'premium$')
AND precio > 500
ORDER BY nombre
LIMIR 5;