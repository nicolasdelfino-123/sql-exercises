/* /* 🎫 TICKET REAL — Ranking de libros por stock dentro de cada editorial

Schema: stock_charles_schema
Tabla: libros

Columnas:
titulo
autor
editorial
isbn
stock
precio
ubicacion
fecha_alta
fecha_baja

Requerimiento del área de Stock y Compras:

La librería quiere detectar, dentro de cada editorial,
qué libros concentran más stock y cuáles están más flojos.

1️⃣ Considerar solo libros que cumplan TODAS estas condiciones:

- fecha_baja sea NULL (libros activos)
- stock mayor o igual a 0
- editorial NO sea NULL

2️⃣ Mostrar:

editorial  
titulo  
autor  
stock  

ranking_stock_editorial → posición del libro dentro de su editorial,
ordenado por stock de mayor a menor
(el libro con más stock de esa editorial debe ser ranking 1)

3️⃣ NO agrupar los libros:
- debe seguir habiendo una fila por libro
- pero con un ranking calculado

4️⃣ Incluir solo:

- los 3 libros con MÁS stock por editorial

5️⃣ Ordenar el resultado final:

primero por editorial (A–Z)  
luego por ranking_stock_editorial (1, 2, 3)
*/
 */

 SELECT l.editorial,
        l.titulo,
        l.autor,
        l.stock.
        ROW_NUMBER() OVER(
                PARTITION BY l.editorial
                ORDER BY L.STOCK DESC

        ) AS ranking_stock_editorial
FROM stock_charles_schema.libros l
WHERE l.fecha_baja IS NULL
ORDER BY 
    l.editorial,
    ranking_stock_editorial;
