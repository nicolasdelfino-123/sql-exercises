/* /* 🎫 TICKET — Auditoría de envíos con códigos irregulares

Tabla: envios_logistica

Columnas:

region
estado_envio (ej: 'entregado', 'devuelto', 'pendiente')
codigo_envio
peso_kg
fecha_envio

Requerimientos del área de Logística:

1️⃣ Considerar solo los envíos cuyo codigo_envio cumpla esta estructura:

empieza con una letra  
continúa con dos letras  
luego un separador único (entre: - _ / :)  
sigue con cuatro números  

2️⃣ Mostrar por región:

region  
total_envios  
peso_promedio  
envios_devuelto → etiqueta textual usando CASE:
    'alto' si hay más de 5
    'bajo' en caso contrario  

3️⃣ Agrupar por región.

4️⃣ Incluir solo regiones con peso_promedio mayor a 12.

5️⃣ Ordenar por peso_promedio de mayor a menor.
*/
 */

SELECT 
    region,
    COUNT(*) AS total_envios,
    AVG(peso_kg) AS peso_promedio,
    CASE 
        WHEN COUNT(CASE WHEN estado_envio = 'devuelto' THEN 1 END) > 5 THEN 'alto' 
        ELSE 'bajo'
    END AS envios_devuelto
FROM envios_logistica
WHERE codigo_envio ~* '^[a-z]{1}[a-z]{2}[-_.:/][0-9]{4}$'
GROUP BY region
HAVING AVG(peso_kg) > 12
ORDER BY peso_promedio DESC;


    
