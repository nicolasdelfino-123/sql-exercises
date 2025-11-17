/* 🧩 Consigna corta – Reporte rápido para Charles

Generar un resumen numérico de los productos que cumplan:

El nombre contenga la palabra “cuaderno” (sin importar mayúsculas).

El precio esté entre 800 y 2000.

El stock sea mayor a 5.

La categoría no sea “juguetería”.

El reporte debe mostrar:

Cantidad de productos encontrados

Suma total del stock

Precio promedio

Precio mínimo

Precio máximo */
SELECT COUNT(*) AS total_productos,
SUM(stock) AS total_stock,
AVG(precio)  AS precio_promedio
MIN(precio) AS precio_minimo
MAX(precio) AS precio_maximo
FROM productos
WHERE LOWER(nomnbre) LIKE '%cuaderno%'
AND precio BETWEEN 800 AND 2000
AND stock > 5
AND LOWER(categoria) <> 'jugueteria'