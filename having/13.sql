/* 3. Consigna fácil para practicar (nivel tranquilo)

Usamos la misma tabla productos que venimos usando.

🧩 Consigna fácil (HAVING + COUNT)

Mostrar por categoría:

categoria

COUNT(*) como total_productos

Pero SOLO las categorías que tengan 2 o más productos.

Ordenar el resultado por total_productos de mayor a menor.

Pistas:

Vas a necesitar: GROUP BY, COUNT(*), HAVING, ORDER BY.

No uses WHERE todavía, enfocáte solo en agrupar y filtrar con HAVING.

✏️ Tu trabajo: escribir el SELECT ... completo.
Después me lo pegás y lo corregimos juntos, como siempre. */
SELECT categoria,
COUNT(*) AS total_productos
FROM productos
GROUP BY categoria
HAVING COUNT(*) >= 2
ORDER BY total_productos DESC