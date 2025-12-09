/* 🧾 TICKET — Auditoría de Productos con Nombre Sospechoso

Área: Auditoría Interna
Tabla: productos

El área necesita detectar categorías donde hay muchos nombres sospechosos.

1️⃣ WHERE (solo una condición, usando REGEXP):

Incluir solo productos cuyo nombre termine en una vocal
👉 (vos elegís la regex, no te la doy)

2️⃣ Agrupar por:

categoria

3️⃣ Mostrar:

categoria

total_items → COUNT(*)

sospechosos → cantidad de productos cuyo nombre tenga 2 palabras o más
(👉 se resuelve con CASE WHEN … ELSE 0 END)

4️⃣ HAVING:

Mostrar solo categorías con al menos 3 sospechosos

5️⃣ ORDER:

Ordenar por sospechosos DESC.

🟦 Resumen técnico:

WHERE → 1 regex

SELECT → COUNT + CASE

HAVING → condición sobre el CASE

ORDER → por el CASE */
SELECT 
    categoria,
    COUNT(*) AS total_items,
    SUM(CASE WHEN nombre ~* '[a-z]+ [a-z]' THEN 1 ELSE 0 END) AS sospechosos
FROM productos
WHERE nombre ~* '[aeiou]$'
GROUP BY categoria
HAVING SUM(CASE WHEN nombre ~* '[a-z]+ [a-z]' THEN 1 ELSE 0 END) >= 3
ORDER BY sospechosos DESC;

CASE 
    WHEN nombre ~* '\w+\s+\w+' THEN 1
    ELSE 0
END
✔️ \w+ → una palabra
✔️ \s+ → espacio(s)
✔️ \w+ → segunda palabra
✔️ ~* → case-insensitive