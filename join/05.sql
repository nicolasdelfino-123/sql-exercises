/* /* 🧩 MICRO CONSIGNA — JOIN básico (nivel 1)

Tablas:

facturas
- id
- proveedor_id
- fecha

proveedores
- id
- nombre

Objetivo:
Mostrar en una sola consulta:
- la fecha de la factura
- el nombre del proveedor

Reglas:
- usar JOIN
- una fila por factura
- no usar GROUP BY
*/
 */
 SELECT f.fecha,
        p.nombre
FROM facturas f 
JOIN proveedores p 
ON f.proveedor_id = p.id;