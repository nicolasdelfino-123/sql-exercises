/* 🎫 TICKET — Control de órdenes por tienda

Tabla: ordenes_tienda

Columnas:

tienda
estado_orden (ej: 'completada', 'cancelada', 'en proceso')
codigo_orden
monto_total
fecha_orden

Requerimientos del área Comercial:

1️⃣ Considerar solo las órdenes cuyo codigo_orden cumpla esta estructura:

comienza con una letra  
sigue con dos números  
luego un separador único (entre: - _ / :)  
termina con dos letras  

2️⃣ Mostrar por tienda:

tienda  
total_ordenes  
monto_promedio  
ordenes_canceladas → etiqueta textual usando CASE:
    'alto' si más del 20% de las órdenes están canceladas  
    'bajo' si el porcentaje es menor o igual al 20%  

3️⃣ Agrupar por tienda.

4️⃣ Incluir solo las tiendas cuyo monto_promedio sea mayor a 3000.

5️⃣ Ordenar por monto_promedio de mayor a menor.
*/
SELECT 
    tienda,
    COUNT(*) AS total_ordenes,
    AVG(monto_total) AS monto_promedio,
    CASE
        WHEN
            SUM(
                CASE 
                    WHEN estado_orden = 'cancelada' THEN 1 
                    ELSE 0
                END
            ) * 100.0 / COUNT(*) > 20
        THEN 'alto'
        ELSE 'bajo'
    END AS ordenes_canceladas
FROM ordenes_tienda
WHERE codigo_orden ~* '^[a-z][0-9]{2}[-_.:/][a-z]{2}$'
GROUP BY tienda
HAVING AVG(monto_total) > 3000
ORDER BY monto_promedio DESC;
