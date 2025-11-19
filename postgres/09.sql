/* 🔥 EJERCICIO MINI PARA QUE LO CONFIRMES

Escribime este:

Mostrá por categoría:

categoría

cantidad de productos

precio máximo
Solo productos con stock > 50
Ordenar por precio máximo DESC */

SELECT categoria
COUNT(*) AS cantidad_productos,
MAX(precio),
FROM productos
WHERE precio > 50
ORDER BY precio DESC;
