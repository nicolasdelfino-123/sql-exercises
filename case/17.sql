/* 🎫 TICKET — Movimientos de stock con validación de código y análisis por depósito

Tabla: movimientos_stock

Columnas:

deposito

tipo_mov (ej: ingreso, egreso, ajuste)

codigo_mov

cantidad

Requerimientos del área de Inventario:

1️⃣ Considerar solo los movimientos cuyo codigo_mov cumpla esta estructura:

comienza con una letra

sigue un número

luego un separador único (entre: - _ / : .)

termina con dos números

2️⃣ Mostrar por depósito:

depósito

total_movimientos

cantidad_total

movimientos_egreso → aplicar lógica 1/0 mediante CASE

3️⃣ Agrupar por depósito.

4️⃣ Incluir solo depósitos cuya cantidad_total sea mayor a 200.

5️⃣ Ordenar por movimientos_egreso de mayor a menor. */
SELECT 
    deposito,
    COUNT(*) AS total_movimientos,
    SUM(cantidad) AS cantidad_total,
    SUM(
        CASE 
            WHEN tipo_mov = 'egreso' THEN 1 
            ELSE 0 
        END
    ) AS movimientos_egreso
FROM movimientos_stock
WHERE codigo_mov ~* '^[a-z][0-9][-_:./][0-9]{2}$'
GROUP BY deposito
HAVING SUM(cantidad) > 200
ORDER BY movimientos_egreso DESC;
