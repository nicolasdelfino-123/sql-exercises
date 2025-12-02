/* ventas(id, producto, categoria, precio, cantidad, fecha)
✔ Requisitos del reporte:
Considerar únicamente las filas donde:

la cantidad esté entre 2 y 20

el precio sea mayor a 1000

el nombre del producto comience con consonante

y además, la categoría sea “Tecnología”
o el producto termine en “ón”, sin importar mayúsculas

Agrupar por categoría.

Mostrar por cada categoría:

la categoría

la cantidad total de ventas

el monto total vendido (precio × cantidad)

el promedio de cantidad vendida

Filtrar los grupos para mostrar solo aquellos que:

tengan al menos 3 ventas

y un monto total superior a 10 000

Ordenar el resultado final por:

monto total descendente

cantidad total de ventas descendente */
SELECT categoria
