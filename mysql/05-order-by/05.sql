/* Charles quiere un mini–listado de productos.

Mostrá nombre, precio y categoría de los productos que:

Su nombre comience con vocal (ignorar mayúsculas).

Su categoría NO sea “Juguetes” (ignorar mayúsculas).

Su precio sea mayor a 1000.

Ordenar los resultados de menor a mayor precio. */

SELECT nombre, precio, categoria
FROM productos
WHERE LOWER(nombre) REGEXP '^[aeiou]'
    AND LOWER(categoria) <> 'juguetes'
    AND precio > 1000
    ORDER BY precio ASC;