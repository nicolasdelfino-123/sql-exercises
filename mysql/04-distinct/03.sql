/* Charles quiere preparar un reporte para reacomodar los productos de su depósito.

Mostrá nombre, categoría, precio y stock de los productos que cumplan:

El nombre comience con consonante (sin importar mayúsculas).

El nombre NO contenga números.

El precio esté entre 800 y 2500 inclusive.

El stock sea menor a 50.

Además:

La categoría sea “Papelería”,
o el nombre termine con “ón” (aceptar acentos, ignorar mayúsculas).

Excluir los productos cuyo nombre termine con la letra “s”.

El resultado no debe mostrar filas repetidas.

Ordenar por precio DESC.

Mostrar solo los primeros 7 resultados. */

SELECT DISTINCT nombre, categoria, precio, stock
FROM productos
WHERE LOWER(nombre) REGEXP '^[^aeiou]'
    AND nombre regexp '[^0-9]'
    AND precio BETWEEN 800 AND 2500
    AND stock < 50
    AND (categoria = 'Papelería' 
    OR
    nombre LIKE '%ón')
    AND LOWER(pruductos) REGEXP '[^s]$'
    AND precio DESC
    LIMIT 7;



/* EXPLICAME COMO IGNORO LOS ACENTOS EN MIS CONSULTAS 
y NO USES LA PALABRA DESC O ASC EN LAS CONSIGNAS SOLO DI DE MAYOR A MENOS O BICEVERSA SINO YA SE Q DEBO USAR
Y AUN ME CUENTA DISTINGUIR Q ES ASC Y DESC DEBO PRACTICARLO*/