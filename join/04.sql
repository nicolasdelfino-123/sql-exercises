/* /* 🧩 MICRO CONSIGNA — JOIN básico (nivel 1)

Tablas:

pedidos
- id
- cliente_id
- fecha

clientes
- id
- nombre

Objetivo:
Mostrar en una sola consulta:
- la fecha del pedido
- el nombre del cliente

Reglas:
- usar JOIN
- una fila por pedido
- no usar GROUP BY
*/
 */

SELECT p.fecha,
       c.nombre
FROM pedidos p
JOIN clientes c
ON p.cliente_id = c.id;