/* 🎫 TICKET — Segmentación básica de productos por nivel de stock
Tabla: productos

1️⃣ Filtrar productos (ACLARADO DE FORMA EXPLÍCITA)

Incluir solo los productos que cumplan TODAS estas condiciones:

La categoría debe estar entre estas:

Electro

Hogar

Audio

El proveedor NO debe estar entre estos:

TestCorp

FakeSupplier

El precio debe estar dentro de un rango considerado “válido para venta”:

mayor o igual a 2000

menor o igual a 9000

El nombre del producto NO debe tener indicios de ser un artículo de muestra, por ejemplo:

que incluya la palabra “test” en cualquier parte

que termine con códigos raros usados para pruebas // esto lo elimine porque no lo se ahcer y es complejo

(La forma exacta de escribir estos filtros es decisión tuya.)

2️⃣ Crear la etiqueta nivel_stock (CASE clásico)

Clasificar cada producto en:

"Crítico"

"Bajo"

"Adecuado"
✅ Condiciones exactas para la etiqueta nivel_stock

Usá estas tres reglas dentro del CASE:

"Crítico" → cuando el stock sea menor a 10

"Bajo" → cuando el stock esté entre 10 y 30 (incluidos)

"Adecuado" → cuando el stock sea mayor a 30

según los valores de stock que vos definas dentro del CASE.

3️⃣ Agrupar por

categoría

nivel_stock

4️⃣ Mostrar

categoría

nivel_stock

total_items (COUNT)

precio_promedio (AVG)

5️⃣ Filtro de agregados (HAVING)

Mostrar solo las combinaciones categoría + nivel_stock que:

tengan al menos 2 productos,

y cuyo precio_promedio sea mayor a 4000.

6️⃣ Orden final

primero por precio_promedio de mayor a menor

si empatan, por categoria de menor a mayor */


SELECT 
    categoria,
    CASE 
        WHEN stock < 10 THEN 'Crítico'
        WHEN stock BETWEEN 10 AND 30 THEN 'Bajo'
        ELSE 'Adecuado'
    END AS nivel_stock,
    COUNT(*) AS total_items,
    AVG(precio) AS precio_promedio
FROM productos
WHERE categoria IN ('Electro','Hogar','Audio')
  AND proveedor NOT IN ('TestCorp','FakeSupplier')
  AND precio BETWEEN 2000 AND 9000
  AND nombre NOT ILIKE '%test%'
GROUP BY categoria, nivel_stock
HAVING COUNT(*) >= 2
   AND AVG(precio) > 4000
ORDER BY 
    precio_promedio DESC,
    categoria ASC;


