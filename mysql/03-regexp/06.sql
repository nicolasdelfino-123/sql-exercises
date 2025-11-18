/* 🧩 3️⃣ Nombre complejo + varias condiciones lógicas

Mostrar nombre, ciudad y edad de los clientes que:

Su nombre empiece con consonante, termine con vocal,
y tenga entre 5 y 7 letras.

Su ciudad empiece con “b” o “c” (sin importar mayúsculas).

Y su edad esté entre 25 y 38. */

SELECT nombre, ciudad, edad
FROM clientes
WHERE LOWER(nombre) REGEXP '^[^aeiou].*[aeiou]$'
    AND LENGTH(nombre) BETWEEN 5 AND 7
    AND LOWER(ciudad) REGEXP '^(b|c)'
    AND edad BETWEEN 25 AND 38;