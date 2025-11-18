/*Charles quiere preparar un listado especial para revisar productos.

Mostrá nombre, categoría y precio de los productos que:

El nombre comience con vocal mayúscula (A-E-I-O-U).

El nombre NO contenga números.

El nombre NO contenga guiones (“-”).

Además:

La categoría sea “Útiles”,
o el nombre termine en una letra mayúscula (A-Z).

Precio entre 500 y 3000 inclusive.

Ordenar los resultados de mayor a menor precio.

Mostrar los primeros 6.  */

SELECT nombre, categoria, precio
FROM productos
WHERE nombre REGEXP '^[AEIUO]'
    AND nombre NOT REGEXP '(0-9|-)'
    AND (categoria = 'Utiles'
    OR
    nombre REGEXP '[A-Z]$')
    AND precio BETWEEN 500 AND 3000
    ORDER BY precio DESC
    LIMIT 6;