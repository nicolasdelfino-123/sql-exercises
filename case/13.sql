/* 🎫 TICKET — Canales con pedidos de código estructurado y montos altos

El área de E-commerce necesita un informe a partir de la tabla pedidos_online.

Requerimientos:

Incluir solo los pedidos cuyo codigo_pedido cumpla este patrón (usar expresión regular):

Comience con tres letras

Siga algún tipo de separador

Termine con cuatro dígitos

(No te doy el patrón, lo armás vos.)

Para cada canal, mostrar:

canal

total_pedidos → cantidad de pedidos

monto_promedio → promedio del monto

alertas_monto → suma de un CASE que cuente 1 cuando el monto sea mayor a 20.000, y 0 en caso contrario

Agrupar por canal.

Incluir solo los canales donde el monto_promedio sea mayor a 10.000.

Ordenar los resultados por monto_promedio de mayor a menor. */

SELECT canal,
       COUNT(*) AS cantidad_pedidos,
       AVG(monto) AS monto_promedio,
       SUM(CASE WHEN monto > 20000 THEN 1 ELSE 0 END) AS alertas_monto
FROM pedidos_online
WHERE codigo_pedido ~* '^[a-z]{3}[-_./:][0-9]{4}$'
GROUP BY canal
HAVING AVG(monto) > 10000
ORDER BY monto_promedio DESC;
