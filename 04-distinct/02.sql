/* Charles quiere un mini–reporte sobre los productos de la sección Útiles y Papelería, pero solo aquellos cuyos precios estén entre 500 y 2000 pesos, y cuyo nombre no empiece con la letra R.

Tenés que obtener, en una sola consulta, lo siguiente:

la cantidad total de productos que cumplen esas condiciones

la suma total de stock de esos productos

el precio promedio

el precio mínimo

el precio máximo

Condiciones que deben cumplirse al mismo tiempo:

categoría sea Útiles o Papelería

precio entre 500 y 2000

nombre no empiece con “R” (sin importar mayúsculas)

📌 Solo podés usar lo que ya viste: COUNT, SUM, AVG, MIN, MAX, AND, OR, WHERE, BETWEEN. */

SELECT SUM(stock) AS total_stock,
       AVG(precio) AS precio_promedio,
       MIN(precio) AS precio_min,
       MAX(precio) AS precio_max
FROM productos
WHERE categoria REGEXP ('Utiles'|'Papeleria')
 AND precio BETWEEN 500 AND 2000
    AND LOWER(nombre) NOT LIKE 'r%'
    