/* /* 🎫 TICKET — Control de envíos con condiciones múltiples

Tabla: envios_internacionales

Columnas:

pais_origen
estado_envio (ej: 'en tránsito', 'entregado', 'pendiente')
codigo_envio
peso_kg
valor_envio
fecha_envio

Requerimientos del área de Logística Internacional:

1️⃣ Considerar solo los envíos cuyo codigo_envio cumpla esta estructura:

comienza con dos letras  
luego un separador único (entre: - _ / :)  
sigue con tres números  
termina con una letra  

2️⃣ Mostrar por país de origen:

pais_origen  
total_envios  
peso_promedio  
valor_promedio  
envios_en_transito → etiqueta textual usando CASE:
    'alto' si más del 30% de los envíos están en tránsito
    'bajo' si menos del 30%  

3️⃣ Agrupar por país de origen.

4️⃣ Incluir solo los países con un valor promedio mayor a 1000.

5️⃣ Ordenar por peso_promedio de mayor a menor.
*/
 */

SELECT 
    pais_origen,
    COUNT(*) AS total_envios,
    AVG(peso_kg) AS peso_promedio,
    AVG(valor_envio) AS valor_promedio,
    CASE
        WHEN 
            COUNT(CASE WHEN estado_envio = 'en tránsito' THEN 1 END) * 100.0
            / COUNT(*) > 30
        THEN 'alto'
        ELSE 'bajo'
    END AS envios_en_transito
FROM envios_internacionales
WHERE codigo_envio ~* '^[a-z]{2}[-_.:/][0-9]{3}[a-z]$'
GROUP BY pais_origen
HAVING AVG(valor_envio) > 1000
ORDER BY peso_promedio DESC;


/* 🔢 Paso 1 — ¿Qué cuenta CADA COUNT?
🔹 COUNT(*)

👉 Cuenta TODOS los envíos

Acá hay:

10 envíos en total

🔹 COUNT(CASE WHEN estado_envio = 'en tránsito' THEN 1 END)

👉 Cuenta SOLO los “en tránsito”

En la tabla:

envío 1 ✅

envío 2 ✅

envío 7 ✅

Entonces:

3 envíos en tránsito

🧮 Paso 2 — La cuenta completa

Ahora metemos los números reales en la fórmula:

(en tránsito * 100) / total


Reemplazamos:

(3 * 100) / 10


Resultado:

300 / 10 = 30


👉 30%

🧠 Paso 3 — La comparación

El SQL hace esto:

30 > 30


❌ FALSO → 'bajo' */