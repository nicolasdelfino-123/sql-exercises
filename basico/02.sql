/* 🧠 Ejercicio 2 (más nivel):
Mostrar nombre, ciudad y edad de los clientes que:
    • Su nombre empiece con consonante y termine con vocal
    • Contenga al menos una letra doble (como “ll”, “nn”, “rr”, etc.)
    • Su edad NO esté entre 20 y 30
    • Y su ciudad termine en “os” o “es” (ej: “Rosario”, “Cordobes”).
 */

SELECT nombre, ciudad, edad
FROM clientes
WHERE nombre REGEXP '^[^aeiou].*[aeiou]$'
    AND LOWER(nombre) REGEXP '(.)\1'
    AND edad NOT BETWEEN 20 AND 30
    AND 
        ( LOWER(ciudad) LIKE '%os'
          OR LOWER(ciudad) LIKE '%es'
        );

/* otr forma de regexp */


SELECT nombre, ciudad, edad
FROM clientes
WHERE nombre REGEXP '^[^aeiou].*[aeiou]$'
    AND LOWER(nombre) REGEXP '(.)\1'
    AND edad NOT BETWEEN 20 AND 30
    AND LOWER(ciudad) REGEXP '(es|os)$'
