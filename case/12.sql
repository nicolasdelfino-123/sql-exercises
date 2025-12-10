/* 🎫 TICKET — Departamentos con irregularidades en legajos y variación salarial

El área de Recursos Humanos requiere un informe basado en la tabla empleados.

Requerimientos

1️⃣ Incluir únicamente los empleados cuyo legajo NO comience con dos letras (regex negativa).

2️⃣ Mostrar por departamento:

departamento

total_empleados → COUNT(*)

dispersion_salarial → STDDEV(salario)

alertas_legajo → SUM(CASE WHEN legajo ~ '[0-9]{3}$' THEN 1 ELSE 0 END)

3️⃣ Agrupar por departamento.

4️⃣ Incluir solo los departamentos cuya dispersion_salarial sea mayor a 3000.

5️⃣ Ordenar por alertas_legajo en orden descendente. */

SELECT departamento,
    COUNT(*) AS total_empleados,
    STDDEV(salario) AS dispersion_salarial,
    SUM(CASE WHEN legajo ~ '[0-0]{3}$' THEN 1 ELSE 0 END) AS alertas_legajo
FROM empleados
WHERE legajo !~* '[a-z]{2}'
GROUP BY departamentos
HAVING   STDDEV(salario) > 3000
ORDER BY alertas_legajo DESC;