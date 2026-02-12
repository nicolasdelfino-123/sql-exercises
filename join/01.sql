/* 🧱 LA PLANTILLA MÍNIMA DE UN JOIN (esto es lo que tenés que aprender)
Grabatela así, siempre igual:
SELECT columnas_que_quiero_ver
FROM tabla_principal
JOIN tabla_secundaria
    ON columna_tabla_principal = columna_tabla_secundaria;
👉 Siempre en este orden
👉 Siempre así de simple

📦 EJEMPLO CON NOMBRES CLAROS (sin ruido)
Imaginemos dos tablas simples:

Tabla ventas
id | libro_id | fecha


Tabla libros
id | titulo

🎯 MINI CONSIGNA (LA TENÉS QUE ESCRIBIR VOS)
Consigna 1 (nivel bebé, pero real):
Quiero ver:
    • el id de la venta
    • el título del libro
Usando las tablas:
    • ventas
    • libros
📌 Pista mínima (solo estructura, no solución):
    • una fila por venta */

SELECT v.fecha,
        l.titulo
FROM ventas v
JOIN libros l
ON v.libro_id = l.id