/* Mostrar nombre y precio de los productos que cumplan:

El nombre empiece con vocal o termine en “ón” (como “cartón”, “salón”).
→ Usá OR y REGEXP

El precio sea mayor a 500.

La categoría no sea “juguetería”.

SELECT solo debe mostrar:

nombre

precio

Nada más. */

SELECT nombre, precio
FROM productos
WHERE precio > 500
AND (LOWER(nombre) REGEXP '^[aeiou]' OR LOWER(nombre) LIKE '%on')
AND categoria <> 'jugueteria'