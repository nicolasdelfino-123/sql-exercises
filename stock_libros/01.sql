/* 🎫 TICKET REAL — Análisis de stock crítico por editorial

Schema: stock_charles_schema
Tabla: libros

Columnas relevantes:
titulo
autor
editorial
isbn
stock
precio
ubicacion
fecha_alta
fecha_baja

Requerimiento del área de Compras y Stock:

La librería necesita identificar editoriales con riesgo de quiebre de stock.

1️⃣ Considerar solo los libros que cumplan TODAS estas condiciones:

- el ISBN tenga este formato:
  comienza con tres números
  luego un guion (-)
  termina con al menos 5 números

- la fecha_baja sea NULL (libros activos)

- la ubicación NO contenga la palabra 'deposito' (case-insensitive)

2️⃣ Mostrar por editorial:

editorial  
total_titulos → cantidad de libros distintos  
ejemplares_totales → suma del stock  
precio_promedio  
libros_sin_stock → cantidad de libros con stock = 0  

3️⃣ Agrupar por editorial.

4️⃣ Incluir solo las editoriales que cumplan AL MENOS UNA de estas condiciones:

- tengan más de 3 libros sin stock  
- o el stock promedio por libro sea menor a 2  

5️⃣ Ordenar:

primero por libros_sin_stock de mayor a menor  
si empatan, por ejemplares_totales de menor a mayor.
*/
SELECT 
    l.editorial,
    COUNT(*) AS total_titulos,
    SUM(l.stock) AS total_ejemplares,
    AVG(l.stock) AS stock_promedio,
    AVG(l.precio) AS precio_promedio,
    SUM(CASE WHEN l.stock = 0 THEN 1 ELSE 0 END) AS libros_sin_stock
FROM stock_charles_schema.libros l
WHERE l.isbn ~* '^[0-9]{10,}$'
  AND l.fecha_baja IS NULL
  AND l.ubicacion NOT ILIKE '%deposito%'
GROUP BY l.editorial
HAVING 
    COUNT(*) >= 1
ORDER BY 
    libros_sin_stock DESC,
    total_ejemplares ASC;

/* CONSULTA REAL QUE SI DA RESULTADOS */

SELECT 
    l.editorial,
	l.ubicacion,
    COUNT(*) AS total_titulos,
    SUM(l.stock) AS total_ejemplares,
    AVG(l.stock) AS stock_promedio,
    SUM(CASE WHEN l.stock = 0 THEN 1 ELSE 0 END) AS libros_sin_stock
FROM stock_charles_schema.libros l
WHERE l.isbn ~* '^[0-9]{10,}$'
  AND l.fecha_baja IS NULL
  AND l.ubicacion NOT ILIKE '%deposito%'
GROUP BY l.editorial, l.ubicacion
HAVING 
    COUNT(*) >= 1
ORDER BY 
    total_titulos DESC;
	
  
