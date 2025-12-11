/* 🎫 NUEVO TICKET (MISMO NIVEL, NUEVA TABLA, CON REGEX + CASE + HAVING)

Tabla: operaciones_envio

Columnas:

zona

tipo_operacion (ej: retiro, entrega, fallido)

codigo_operacion

importe

Requerimiento del área operativa:

1️⃣ Considerar solo filas cuyo codigo_operacion siga esta estructura:

empieza con dos números

sigue un separador único (entre: - _ : / .)

luego dos letras

termina en tres números

2️⃣ Mostrar por zona:

zona

total_operaciones

importe_promedio

operaciones_fallidas → usando lógica 1/0 con CASE

3️⃣ Agrupar por zona.

4️⃣ Incluir solo zonas con importe_promedio mayor a 5000
(Usar el criterio correcto.)

5️⃣ Ordenar por total_operaciones de mayor a menor. */
SELECT zona,
    COUNT(*) AS total_operaciones,
    AVG(importe) AS importe_promedio,
    SUM(
        CASE WHEN tipo_operacion = 'fallido' THEN 1 
        ELSE 0 END) 
        AS operaciones_fallidas
WHERE CODIGO_OPERACION ~* '^[0-9]{2}[-_.:/\][a-z]{2}[0-9]{3}$'
GROUP BY zona
HAVING AVG(importe) > 5000
ORDER BY total_operaciones DESC;
    