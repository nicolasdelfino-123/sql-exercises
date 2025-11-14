/* Mostrar nombre, categoría, precio y stock de los productos que:

Cuestan entre 500 y 1500 pesos (inclusive).

El nombre contenga la palabra “Cuaderno” (mayúsculas o minúsculas).

Su categoría sea Papelería.

Y tengan stock mayor o igual a 20.

Ordenado por precio ascendente. */

SELECT nombre, categoria, precio, stock
FROM productos
WHERE LOWER(nombre) = 'cuaderno'
    AND LOWER(categoria) = 'papeleria'
    AND stock >= 20
    ORDER BY precio ASC