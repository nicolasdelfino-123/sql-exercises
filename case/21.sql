/* 🎫 TICKET — Análisis de pagos y comportamiento por sucursal

Tabla: pagos_clientes

Columnas:

sucursal
estado_pago (ej: 'pagado', 'rechazado', 'pendiente')
codigo_pago
monto
fecha_pago

Requerimientos del área de Finanzas:

1️⃣ Considerar solo los pagos cuyo codigo_pago cumpla esta estructura:

comienza con una letra  
sigue con un número  
luego un separador único (entre: - _ / :)  
continúa con dos letras  
termina con dos números  

2️⃣ Mostrar por sucursal:

sucursal  
total_pagos  
monto_promedio  
pagos_rechazados → etiqueta textual usando CASE:
    'alto' si más del 25% de los pagos están rechazados  
    'bajo' si el porcentaje es menor o igual al 25%  

3️⃣ Agrupar por sucursal.

4️⃣ Incluir solo las sucursales cuyo monto_promedio sea mayor a 5000.

5️⃣ Ordenar por monto_promedio de mayor a menor.
*/
SELECT sucursal,
    COUNT(*) AS total_pagos,
    AVG(monto) AS monto_promedio,
    CASE
        WHEN
            COUNT(CASE WHEN estado_pago = 'rechazado' THEN 1 END) * 100.0 / COUNT(*) > 25
            THEN 'alto'
            ELSE 'bajo'
        END AS pagos_rechazados
FROM pagos_clientes
WHERE codigo_pago ~* '^[a-z]{1}[0-9]{1}[-_.:/]{1}[a-z]{2}[0-9]{2}'
GROUP BY sucursal
HAVING  AVG(monto) > 5000
ORDER BY  AVG(monto) DESC;