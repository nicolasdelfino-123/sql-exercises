/* /* 🧩 MICRO CONSIGNA — Primer JOIN

Tablas:

personas
- id
- nombre

mascotas
- id
- nombre
- persona_id

Objetivo:
Mostrar en una sola consulta:
- el nombre de la persona
- el nombre de la mascota

Reglas:
- usar JOIN
- una fila por mascota
- no usar GROUP BY
*/
 */

SELECT p.nombre,
        m.nombre
FROM mascotas m
JOIN personas p
ON p.id = m.persona_id
