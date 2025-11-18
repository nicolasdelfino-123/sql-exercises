/* 🧩 1️⃣ Filtrado mixto con REGEXP y rangos
Mostrar nombre, ciudad y edad de los clientes que:

Su nombre comience con vocal.

Tenga entre 4 y 6 letras.

Su edad esté entre 25 y 38 años inclusive.

Y su ciudad no termine con la letra “a”. */

SELECT nombre, ciudad, edad
FROM clientes
WHERE LOWER(nombre) REGEXP '^[aeiou]'
    AND LENGTH(nombre) BETWEEN 4 AND 6
    AND edad BETWEEN 25 AND 38
    AND LOWER(ciudad) NOT REGEXP 'a$';