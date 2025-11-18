/* 🔥 EJERCICIO 1 (ORDER BY + REGEXP básico)

📌 Mostrar nombre, categoría y precio de los productos que:

Su nombre comience con vocal (a, e, i, o, u)

Y el precio sea mayor a 300

Ordenados por precio de mayor a menor */

SELECT nombre, categoria, precio
FROM productos
WHERE LOWER(nombre) REGEXP '^[aeiou]'
AND precio > 300
ORDER BY precio DESC