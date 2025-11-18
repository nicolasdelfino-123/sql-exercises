/*  
Charles necesita preparar un reporte rápido para decidir qué productos poner en la góndola de entrada.

Mostrar nombre, categoría, precio y stock de los productos que:

- Su nombre termine en vocal (sin importar mayúsculas).
- Su precio esté entre 400 y 1800 pesos.
- Su stock sea mayor a 30.
- Y además:
      • la categoría sea “Útiles”
      • o el nombre contenga la palabra “Agenda” (sin importar mayúsculas).
- Excluir los productos cuyo nombre empiece con la letra “R”.
- Ordenado por precio de mayor a menor.
- Mostrar solo los primeros 4 resultados.
*/

SELECT nombre, categoria, precio, stock
FROM productos
WHERE LOWER(nombre) LIKE '[aeiou]$'
AND precio BETWEEN 400 AND 1800
AND stock > 30
AND (LOWER(categoria) = 'utiles'
OR LOWER(nombre) LIKE '%agenda%')
AND LOWER(nombre) NOT LIKE 'r%'
ORDER BY precio DESC
LIMIT 4;