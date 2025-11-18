/*1) Lo que tenés que mostrar en el SELECT

El reporte final debe incluir estos 5 datos numéricos:
Cantidad de productos que cumplen todas las condiciones.
Suma total del stock.
Precio promedio.
Precio mínimo.
Precio máximo.
2) Desde qué tabla tenés que sacar los datos
Usar la tabla productos.
3) Condiciones que deben cumplir los productos (para el WHERE)
Aplicás estas condiciones una por una, en este orden:
A) Condiciones sobre el nombre del producto
Debe empezar con una vocal (a, e, i, o, u).
No debe contener la palabra “promo” en ninguna parte.
No debe terminar en la letra s.
B) Condición sobre el precio
El precio debe estar entre 600 y 2500 (inclusive).
C) Condición sobre el stock
El stock debe ser mayor o igual a 10.
D) Condición sobre la categoría
La categoría tiene que ser una de estas tres:
Libro
Papelería
Útiles
4) Resultado esperado
El resultado final debe ser una sola fila que tenga:
Cantidad de productos filtrados
Suma total del stock
Precio promedio
Precio más bajo
Precio más alto */

SELECT COUNT(*) AS total_productos
       SUM(stock) AS total_stock
       AVG(precio) AS precio_promedio
       MIN(precio)
       MAX(precio)
FROM productos
WHERE nombre REGEXP '^[aeiou]'
AND LOWER(nombre) NOT LIKE '%promo%' 
AND LOWER(nombre) NOT LIKE '%s' 
AND precio BETWEEN 600 AND 2500
AND stock >= 10
AND LOWER(categoria) REGEXP '(libro|papeleria|utiles)'
