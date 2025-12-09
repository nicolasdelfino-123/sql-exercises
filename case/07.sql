/* 🧾 TICKET 1 — Nivel Medio/Alto (requiere HAVING)

Área: Auditoría Comercial
Tabla: productos

La empresa quiere detectar categorías con productos de precio inconsistente.

Requerimientos:

1️⃣ Filtrar productos que cumplan todo:

categoría esté en: ('Electro', 'Audio', 'Hogar')

precio entre 3000 y 12000

nombre NO contenga la palabra "demo" (usá ILIKE o regex)

2️⃣ Calcular por categoría:

total_items

precio_promedio

productos_altos → cantidad de productos con precio > 9000

3️⃣ Mostrar solo las categorías que cumplan:

tener al menos 2 productos altos

y precio_promedio > 5000

4️⃣ Ordenar por productos_altos de mayor a menor.

👉 Este ticket obligatoriamente usa HAVING. */

SELECT categoria,
    COUNT(*) AS total_items,
    AVG(precio) AS precio_promedio,
    SUM(CASE WHEN precio > 9000 THEN 1 ELSE 0 END) AS productos_altos
FROM productos
      WHERE categoria IN ('Electro', 'Audio', 'Hogar')
      AND precio BETWEEN 3000 AND 9000
      AND nombre NOT LIKE '%demo%'
GROUP BY categoria
HAVING productos_altos > 2
        AND  AVG(precio) > 5000
ORDER BY productos_altos DESC;



