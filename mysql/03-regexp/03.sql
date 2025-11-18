/* 🧩 1️⃣ Nombres y ciudades con condiciones mixtas

Mostrar nombre, ciudad y edad de los clientes que:

Su nombre empiece con vocal y termine con consonante.

Tengan una edad entre 25 y 40 años.

Y su ciudad contenga la cadena “or” o “an” (por ejemplo: Rosario, Buenos Aires).

💡 Usá REGEXP para el patrón de nombre, BETWEEN para la edad y LIKE o REGEXP para la ciudad. */

SELECT nombre, ciudad, edad
FROM clientes
WHERE LOWER(nombre) REGEXP '^[aeiou].*[^aeiou]$'
    AND edad BETWEEN 25 AND 40
    AND LOWER(ciudad) REGEXP '(or|an)'
