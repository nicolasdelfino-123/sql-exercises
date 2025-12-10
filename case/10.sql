/* 🎫 TICKET — Detección de categorías con riesgo de sobreprecio

El área de Auditoría necesita un informe a partir de la tabla productos.

Requerimientos

Incluir únicamente los productos cuyo nombre termine en vocal (expresión regular, sin distinguir mayúsculas/minúsculas).

Para cada categoría, mostrar:

categoría

total_items → cantidad total de productos

riesgo_precio → SUM de un CASE que cuente 1 si el precio supera 9500, y 0 en caso contrario

Agrupar por categoría.

Considerar únicamente las categorías que tengan más de 2 productos en el resultado.

Ordenar el informe por riesgo_precio en orden descendente. */


SELECT categoria,
    COUNT(*) AS total_items,
    SUM(CASE WHEN precio > 9500 THEN 1 ELSE 0 END) AS riesgo_precio
FROM productos
WHERE nombre ~* '[aeiou]$'
GROUP BY categoria
HAVING COUNT(*) > 2
ORDER BY riesgo_precio DESC;
