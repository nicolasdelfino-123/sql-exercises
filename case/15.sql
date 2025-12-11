/* 🎫 TICKET — Indicadores de devoluciones por región (nivel intermedio con REGEX + CASE + HAVING)

Tabla: envios

Columnas:

region

estado_envio (ej: entregado, devuelto, en_transito)

codigo_paquete

costo

Requerimiento del área logística:

1️⃣ Considerar solo los envíos cuyo codigo_paquete cumpla un patrón estructurado con separadores, que responde a esta lógica:

Comienza con tres letras

Sigue un separador único (entre: - _ : . /)

Termina con cuatro dígitos

(No te doy la regex ni pistas.)

2️⃣ Para cada región se debe mostrar:

region

total_envios → cantidad total de paquetes válidos

monto_total → suma del costo total

envios_devuelto → cantidad de envíos marcados como “devuelto” mediante un CASE con lógica 1/0
(Vos definís cómo es ese CASE.)

3️⃣ Agrupar por región.

4️⃣ Filtrar regiones que tengan más de 5 devoluciones usando el criterio adecuado.

5️⃣ Ordenar por envios_devuelto de mayor a menor.*/

SELECT 
    region,
    COUNT(*) AS total_envios,
    SUM(costo) AS monto_total,
    SUM(
        CASE 
            WHEN estado_envio = 'devuelto' THEN 1 
            ELSE 0 
        END
    ) AS envios_devuelto
FROM envios
WHERE codigo_paquete ~* '^[a-z]{3}[-_:/\.][0-9]{4}$'
GROUP BY region
HAVING SUM(
            CASE 
                WHEN estado_envio = 'devuelto' THEN 1 
                ELSE 0 
            END
        ) > 5
ORDER BY envios_devuelto DESC;
