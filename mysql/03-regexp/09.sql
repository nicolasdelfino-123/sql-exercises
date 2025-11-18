/* 💡 Consigna fundamental – Validación de formato de correo electrónico

🧩 Ejercicio:
Mostrar los nombres y correos de los clientes que:

Tengan un correo válido en formato básico (es decir: algo@algo.algo
).

El correo no contenga espacios ni caracteres especiales distintos de . o _.

El dominio (la parte después del @) termine en “.com” o “.net”. */

SELECT nombre, correo
FROM cliente
WHERE correo REGEXP '[a-z0-9.-]+@[a-z0-9.-]\\.(com|net)$'
    