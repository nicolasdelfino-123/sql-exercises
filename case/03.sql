/* 🎫 TICKET — Clasificación rápida por rango de precio

El área de Catálogo quiere un resumen simple sobre cómo se distribuyen los productos por precio.

Requerimientos:

Filtrar productos que cumplan:

categoría: Electro, Audio

precio mayor a 2000

Crear una etiqueta llamada rango_precio:

"Bajo" si el precio es menor a 4000

"Medio" si el precio está entre 4000 y 7000

"Alto" si el precio es mayor a 7000

Agrupar por:

categoría

rango_precio

Mostrar:

categoría

rango_precio

Ordenar:

primero por categoría (de A a Z)

luego por rango_precio (de A a Z) */

SELECT 
    categoria,
    CASE
        WHEN precio < 4000 THEN 'Bajo'
        WHEN precio BETWEEN 4000 AND 7000 THEN 'Medio'
        ELSE 'Alto'
    END AS rango_precio
FROM productos
WHERE categoria IN ('Electro', 'Audio')
  AND precio > 2000
GROUP BY categoria, rango_precio
ORDER BY categoria, rango_precio;
