/* /* 🧩 MICRO CONSIGNA — JOIN básico (nivel 1)

Tablas:

alumnos
- id
- nombre

inscripciones
- id
- alumno_id
- curso

Objetivo:
Mostrar en una sola consulta:
- el nombre del alumno
- el nombre del curso

Reglas:
- usar JOIN
- una fila por inscripción
- no usar GROUP BY
*/
 */

SELECT 
    a.nombre,
    i.curso
FROM inscripciones i
JOIN alumnos a
    ON i.alumno_id = a.id;
