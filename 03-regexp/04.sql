/* 🧩 1️⃣ Validar formato de nombres

Mostrar los nombres de los clientes que:

Empiecen con una letra mayúscula.

Sigan con solo letras minúsculas.

No contengan números ni símbolos. */

SELECT nombres
FROM clientes
WHERE nombre REGEXP '[A-z].*[^0-9]'
