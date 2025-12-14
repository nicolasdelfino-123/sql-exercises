/* 🎫 TICKET — Análisis de reclamos por canal (CORREGIDO)

Tabla: reclamos_clientes

Columnas:

canal
estado_reclamo (ej: 'abierto', 'cerrado', 'escalado')
codigo_reclamo
monto_compensacion
fecha_reclamo

Requerimientos del área de Atención al Cliente:

1️⃣ Considerar solo los reclamos cuyo codigo_reclamo cumpla esta estructura:

comienza con dos números

luego un separador único (entre: - _ / :)

NO continúa con una vocal

termina con tres números

2️⃣ Mostrar por canal:

canal  
total_reclamos  
compensacion_promedio  
reclamos_escalados → etiqueta textual usando CASE:
    'alto' si más del 15% de los reclamos están escalados  
    'bajo' si el porcentaje es menor o igual al 15%  

3️⃣ Agrupar por canal.

4️⃣ Incluir solo los canales donde:
    más del 15% de los reclamos estén en estado 'escalado'
    (usar la operación matemática en el HAVING, sin texto)

5️⃣ Ordenar por compensacion_promedio de mayor a menor.
*/

SELECT canal,
    COUNT(*) AS total_reclamos,
    AVG(monto_compensacion) AS compensacion_promedio,
    CASE 
        WHEN
            SUM(CASE WHEN estado_reclamo = 'escalado' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) > 15
            THEN 'alto'
            ELSE 'bajo'
    END AS reclamos_escalados
FROM reclamos_clientes
WHERE codigo_reclamo ~* '^[0-9]{2}[-_.:/][^aeiou][0-9]{3}$' 
GROUP BY canal
HAVING SUM(CASE WHEN estado_reclamo = 'escalado' THEN 1) * 100.0 / COUNT(*) > 15 
ORDER BY compensacion_promedio DESC;

