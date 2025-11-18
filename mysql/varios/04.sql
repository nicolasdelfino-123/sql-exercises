/* Charles quiere preparar una oferta relámpago para redes sociales y necesita analizar un conjunto específico de productos.

Mostrar nombre, categoría, precio y stock de los productos que:

Su nombre empiece con vocal (sin importar mayúsculas).

Su nombre no contenga números.

Su precio esté entre 700 y 2200 pesos.

Su stock sea mayor a 15.

Y además:
• la categoría sea “Libros”
• o el nombre termine en “ción” (sin importar mayúsculas).

Excluir los productos cuyo nombre termine en la letra “s”.

Ordenados por stock de mayor a menor.

Mostrar solo los primeros 5 resultados.

Además, mostrar en otra consulta la cantidad total de productos que cumplen esas condiciones (usá COUNT(*)). */

SELECT nombre, categoria, precio, stock
FROM productos
WHERE LOWER(nombre) REGEXP '^[aeiou]'
AND LOWER(nombre) REGEXP '^[^0-9]'
AND precio BETWEEN 700 AND 2200
AND stock > 15
AND (LOWER(categoria) = 'libros' OR LOWER(nombre) REGEXP '$ción')
AND LOWER(productos) NOT LIKE '%s'
ORDER BY stock ASC 
LIMIT 5;