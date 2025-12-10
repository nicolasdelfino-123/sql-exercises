/* 🎫 TICKET — Categorías con productos de nombre “segmentado” y alerta de stock

El área de Operaciones requiere un informe usando la tabla productos.

Requerimientos

Incluir solo los productos cuyo nombre contenga un guion medio “-” (regex).

Para cada categoría, mostrar:

categoría

total_items → cantidad de productos

alerta_stock → SUM de un CASE que cuente 1 si el stock es menor a 20, y 0 en caso contrario

precio_max → MAX(precio)

Agrupar por categoría.

Considerar únicamente las categorías donde precio_max sea mayor a 5000.

Ordenar por precio_max de mayor a menor. */

SELECT categoria,
    COUNT(*) AS total_items,
    SUM(CASE WHEN stock < 20 THEN 1 ELSE 0 END) AS alerta_stock
FROM productos
WHERE nombre ILIKE '%-%'
GROUP BY categoria
HAVING MAX(precio) > 5000
ORDER BY MAX(precio) DESC;
