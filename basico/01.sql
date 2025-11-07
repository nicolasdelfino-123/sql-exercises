/* 🧠 Ejercicio 1 (con REGEXP, BETWEEN y LENGTH):
Mostrar nombre, ciudad y edad de los clientes que:
    • Su nombre empiece y termine con vocal (a, e, i, o, u)
    • Tenga entre 4 y 6 letras
    • Su edad esté entre 23 y 35 años
    • Y su ciudad no contenga la letra “a” en ninguna parte. */

SELECT nombre, ciudad, edad
FROM clientes 
WHERE nombre REGEXP '^[a,e,i,o,u].*[a,e,i,o,u]$'
    AND LENGTH(nombre) BETWEEN 4 AND 6
    AND edad BETWEEN 23 AND 35
    AND ciudad NOT LIKE '%a%'