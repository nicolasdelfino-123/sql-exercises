/* 🧾 TICKET — Nivel Medio (simple, limpio y al punto)

Área: Control de Stock
Tabla: productos

El equipo quiere identificar qué categorías tienen productos con stock crítico.

Requerimientos:

1️⃣ Filtrar solo productos con:

stock < 40

(Eso es lo ÚNICO en el WHERE.)

2️⃣ Agrupar por categoria.

3️⃣ Mostrar:

categoria

total_items → COUNT(*)

stock_critico → cantidad de productos con stock menor a 15
(👉 Esto se hace con CASE WHEN … ELSE 0 END)
4️⃣ HAVING:

Mostrar solo las categorías que cumplan:

tener al menos 2 productos con stock crítico

4️⃣ Ordenar por stock_critico de mayor a menor.

🟦 Resumen técnico:

WHERE → 1 condición

SELECT → 2 cálculos: COUNT(*) + CASE WHEN

GROUP BY → categoría

ORDER → por el CASE */

SELECT categoria,
    COUNT(*) AS total_items,
    SUM(CASE WHEN stock < 16 THEN 1 ELSE 0 END) AS stock_critico
FROM productos
WHERE stock < 40
GROUP BY categoria
HAVING
    SUM(CASE WHEN stock < 16 THEN 1 ELSE 0 END) >= 2
ORDER BY stock_critico DESC;