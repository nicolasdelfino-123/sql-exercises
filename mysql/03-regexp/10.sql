/* 🧩 Consigna final – Validación avanzada de nombres completos

Mostrar el nombre completo de los clientes que:

Empiecen con mayúscula, seguida de letras solo minúsculas.

Tengan uno o dos nombres (por ejemplo, “Ana” o “Juan Pablo”).

No contengan números, tildes, símbolos ni espacios extras al final. */

SELECT nombre
FROM clientes
WHERE nombre REGEXP '^[A-Z][a-z]+(\\s[A-Z][a-z]+)?$'

/* NO SALIÓ  */ 