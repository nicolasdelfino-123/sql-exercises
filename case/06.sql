/* TICKET — Categorías con alerta de precio y nombre sospechoso

El área de Auditoría Comercial detectó que ciertos productos podrían estar mal cargados en el sistema, y necesitan un resumen por categoría para revisar dónde concentrar la verificación.

📌 Tabla: productos
Columnas relevantes: categoria, nombre, precio, stock

Requerimientos
1️⃣ Filtrar productos (antes de agrupar)

Incluir solo los productos que cumplan:

el nombre NO contenga un patrón sospechoso usando regex:
→ el patrón es: terminar en un número

(Esto implica usar nombre ~* con negación, pero sin decirte la sintaxis exacta.)

2️⃣ Agrupar

Agrupar los resultados por categoria.

3️⃣ Columnas a mostrar
----------select

Mostrar para cada categoría:

categoria

total_items → cantidad de productos en esa categoría

estado_categoria → etiqueta generada con CASE:

'caro' si algún producto supera los 8000

'barato' si todos los productos están por debajo de 5000

'mixto' en cualquier otro caso

(Deberás resolverlo usando MIN(precio) y MAX(precio), como corresponde en un GROUP BY.)

4️⃣ Filtro por grupo (HAVING)

Incluir solo las categorías que:

tengan al menos 3 productos

y tengan un precio_promedio mayor a 3000

5️⃣ Orden del reporte

Ordenar:

por precio_promedio de mayor a menor

si empatan, por total_items de menor a mayor */

SELECT
    categoria,
    COUNT(*)        AS total_items,
    AVG(precio)     AS precio_promedio,
    CASE
        WHEN MAX(precio) > 8000 THEN 'caro'
        WHEN MAX(precio) < 5000 THEN 'barato'
        ELSE 'mixto'
    END             AS estado_categoria
FROM productos
WHERE nombre !~* '[0-9]$'
GROUP BY categoria
HAVING
       COUNT(*) >= 3
   AND AVG(precio) > 3000
ORDER BY
    precio_promedio DESC,
    total_items     ASC;
