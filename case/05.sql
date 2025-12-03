/* TICKET — Reporte de categorías con alerta de inventario

El área de Logística necesita un informe por categoría para detectar categorías que podrían presentar problemas de inventario a fin de mes.

📌 Tabla: productos
📌 Columnas relevantes: categoria, nombre, stock, precio

Requerimientos
------------WHERE
1️⃣ Filtrar productos (antes de agrupar)

Incluir solo los productos que cumplan:

stock entre 5 y 80

precio mayor a 2500
--------------------------GROUP BY
2️⃣ Agrupar

Agrupar los resultados por categoria.

------------SELECT
3️⃣ Columnas a mostrar

Mostrar para cada categoría:

categoria

total_items → cantidad de productos en esa categoría

stock_promedio → promedio de stock

alerta_categoria → etiqueta generada con CASE:

'riesgo' si algún producto de la categoría tiene stock < 10
o si algún producto tiene precio > 7000

'estable' en caso contrario

(O sea: deberás usar MIN(stock) y MAX(precio) dentro del CASE.)

----------HAVING
4️⃣ Filtro por grupo (HAVING)

Incluir solo las categorías que cumplan:

tengan al menos 4 productos

y su stock_promedio sea menor a 40

--------ODEER BY
5️⃣ Orden del reporte

Ordenar:

por stock_promedio de menor a mayor

si empatan, por total_items de mayor a menor */

SELECT
    categoria,
    COUNT(*)        AS total_items,
    AVG(stock)      AS stock_promedio,
    CASE
        WHEN MIN(stock) < 10
          OR MAX(precio) > 7000
        THEN 'riesgo'
        ELSE 'estable'
    END             AS alerta_categoria
FROM productos
WHERE stock BETWEEN 5 AND 80
  AND precio > 2500
GROUP BY categoria
HAVING
       COUNT(*) >= 4
   AND AVG(stock) < 40
ORDER BY
    stock_promedio ASC,
    total_items    DESC;
