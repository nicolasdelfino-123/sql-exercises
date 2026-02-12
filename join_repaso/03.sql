/* 
🟢 EJERCICIO 3 — SOLO JOIN

Queremos ver qué cliente hizo cada pedido.

Construir una consulta que una las tablas pedidos y clientes.

El resultado que buscás tiene que mostrar estas tres cosas:

1️⃣ El id del pedido
2️⃣ El nombre del cliente que hizo ese pedido
3️⃣ El total del pedido

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
total */

SELECT clientes.nombre,
       pedidos.id,
       pedidos.total
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
