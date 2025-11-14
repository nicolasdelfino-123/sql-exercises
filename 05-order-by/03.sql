/*  
Charles quiere revisar productos para una promo de fin de mes.

Mostrar nombre, categoría, precio y stock de los productos que:

- Su nombre comience con vocal (sin importar mayúsculas).
- Su precio esté entre 300 y 2000 pesos (inclusive).
- Su categoría sea Papelería o el nombre contenga la palabra “Cuaderno”.
- Su stock sea mayor a 10.
- Ordenado por precio de menor a mayor.
- Mostrar solo los primeros 3 resultados.
*/

SELECT nombre, categoria, precio, stock
FROM productos
WHERE (LOWER(nombre) REGEXP '^[aeiou]'
    AND precio BETWEEN 300 AND 2000
    AND LOWER(categoria) = 'papeleria') 
    OR
    (LOWER(nombre) LIKE '%cuaderno%'
    AND stock > 10)
    ORDER BY precio ASC
    LIMIT 3;

