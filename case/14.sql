/* 🎫 NUEVA CONSIGNA (con separadores para fijarlo bien)

Tabla: transacciones_bancarias

Columnas:

tipo (ej: 'debito', 'credito')

codigo_tx (string complejo)

monto

sucursal

🎫 TICKET — Transacciones con código estructurado y anomalías por sucursal

El área de Riesgo Bancario solicita un informe basado en la tabla transacciones_bancarias.

Requerimientos:

1️⃣ Incluir solo las transacciones cuyo codigo_tx cumpla este patrón:

Comienza con dos dígitos

Luego un separador (solo uno, entre: - _ / . :)

Luego tres letras

Termina con dos dígitos

(No te doy el regex. Lo construís vos.)

2️⃣ Para cada sucursal mostrar:

sucursal

total_transacciones → COUNT(*)

monto_max → MAX(monto)

alertas_monto → SUM(CASE que cuente 1 si monto < 1000)

3️⃣ Agrupar por sucursal.

4️⃣ Incluir solo sucursales cuyo monto_max sea mayor a 5000.

5️⃣ Ordenar por total_transacciones, de mayor a menor. */

SELECT sucursal,
    COUNT(*) AS total_transacciones,
    MAX(monto) AS monto_max,
    SUM(
        CASE WHEN monto < 1000 THEN 1
        ELSE 0
        END
    ) AS alertas_monto
FROM transacciones_bancarias
WHERE codigo_tx ~* '^[0-9]{2}[-_:/.][a-z]{3}[0-9]{2}$'
GROUP BY sucursal
HAVING MAX(monto) > 5000
ORDER BY COUNT(*) DESC;