/* 🧩 CONSIGNA (PostgreSQL — virgulilla + ILIKE + OR + AND)

Mostrar nombre, precio y categoría de los productos que:

Su nombre empiece con vocal

O su categoría contenga la palabra “oferta” (sin importar mayúsculas)

Y además su precio esté entre 300 y 1200

Ordenar por precio de menor a mayor

Mostrar solo los primeros 8 resultados */

SELECT nombre, precio, categoria
FROM productos
WHERE (nombre ~* '^[aeiou]' OR categoria ILIKE '%oferta%')
AND precio BETWEEN 300 AND 1200
ORDER BY precio ASC
LIMIT 8;