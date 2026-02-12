/* 🟢 EJERCICIO 1 — Traer todos los pedidos con el nombre del cliente
Mostrar:
    • nombre del cliente
    • total del pedido 
    
TABLAS

clientes
--------
id (PK)
nombre
ciudad

pedidos
--------
id (PK)
cliente_id (FK → clientes.id)
total
====================================================
*/



SELECT clientes.nombre,
       pedidos.total
FROM pedidos
JOIN clientes ON clientes.id = pedidos.cliente_id
       