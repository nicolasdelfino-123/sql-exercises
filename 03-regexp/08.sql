/* 🧩 2️⃣ Patrón interno y exclusiones
Mostrar nombre y ciudad de los clientes que:

Su nombre contenga al menos una doble letra (como “ll”, “rr”, “ss”, etc.).

Su edad no esté entre 20 y 30 años.

Y su ciudad no contenga la letra “o” ni “O”. */

SELECT nombre, ciudad
FROM clientes
WHERE nombre, ciudad REGEXP '(.)\1'
    AND edad NOT BETWEEN 20 AND 30
    AND ciudad NOT REGEXP '[oO]'