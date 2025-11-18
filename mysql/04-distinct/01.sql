/* 🧩 CONSIGNA (versión resumida)

Escribí tres consultas:

a) Cantidad total de productos de la tabla.
b) Cantidad de productos cuya categoría sea “Papelería”.
c) Cantidad de productos cuyo stock sea mayor a 50. */

SELECT COUNT(*) AS total_productos
FROM productos

SELECT COUNT(*) AS total_productos_papeleria
FROM productos
WHERE categoria = 'Papeleria'

SELECT COUNT(*) AS total_stock
FROM productos
WHERE stock > 50