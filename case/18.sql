/* 🎫 TICKET — Validación de operaciones y análisis por sucursal

Tabla: operaciones_financieras

Columnas:

sucursal
tipo_op (ej: 'credito', 'debito', 'reversion')
codigo_op
monto

Requerimientos del área de Control Financiero:

1️⃣ Considerar solo las operaciones cuyo codigo_op cumpla esta estructura:

comienza con dos números  
luego un separador único (entre: - _ / : .)  
continúa con tres letras  
termina con un número  

2️⃣ Mostrar por sucursal:

sucursal  
total_operaciones  
monto_total  
operaciones_debito → aplicar lógica 1/0 mediante CASE  

3️⃣ Agrupar por sucursal.

4️⃣ Incluir solo las sucursales cuyo monto_total sea mayor a 50000.

5️⃣ Ordenar por operaciones_debito de mayor a menor.
*/

SELECT sucursal,
    COUNT(*) AS total_operaciones,
    SUM(monto) AS monto_total,
    SUM(
        CASE WHEN tipo_op = 'debito' THEN 1 
        ELSE 0 END
    ) AS operaciones_debito
FROM operaciones_financieras
WHERE codigo_op ~* '^[0-9]{2}[-_.:/][a-z]{3}[0-9]{1}$'
GROUP BY sucursal
HAVING SUM(monto) > 5000
ORDER BY operaciones_debito DESC;