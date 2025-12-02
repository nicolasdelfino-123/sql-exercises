/* 🎫 TICKET — Estado de precio por categoría

Filtrar productos que cumplan:

categoría: Electro, Hogar

precio entre 3000 y 9000

el nombre no debe contener la palabra “test”

Crear una columna:

"Barato" si el precio es menor a 5000

"Medio" si está entre 5000 y 7000

"Caro" si es mayor a 7000

Agrupar por:

categoría

nivel_precio (la etiqueta del CASE)

Mostrar:

categoría

nivel_precio

total_items (COUNT)

precio_promedio (AVG)

Filtrar con HAVING:

solo combinaciones con al menos 1 producto

Ordenar:

primero por precio_promedio de mayor a menor

si empatan, por categoría de menor a mayor */

SELECT 
    categoria,
    CASE 
        WHEN precio < 5000 THEN 'Barato'
        WHEN precio BETWEEN 5000 AND 7000 THEN 'Medio'
        ELSE 'Caro'
    END AS nivel_precio,
    COUNT(*) AS total_items,
    AVG(precio) AS precio_promedio
FROM productos
WHERE categoria IN ('Electro','Hogar')
  AND precio BETWEEN 3000 AND 9000
  AND nombre NOT ILIKE '%test%'
GROUP BY categoria, nivel_precio
HAVING COUNT(*) >= 1
ORDER BY precio_promedio DESC, categoria ASC;




