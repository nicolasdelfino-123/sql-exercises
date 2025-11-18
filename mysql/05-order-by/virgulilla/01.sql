/* 🧩 CONSIGNA (PostgreSQL — usando virgulilla)

Mostrá nombre, categoría y stock de los productos que:

Su nombre comience con consonante
(usar REGEX con ~).

El nombre NO termine en vocal
(usar !~).

La categoría sea “Papelería”
o el nombre contenga la sílaba “ma”
(usar ~* para ignorar mayúsculas).

Ordenar por stock de menor a mayor.

Mostrar solo los primeros 5. */
SELECT nombre, categoria, stock
FROM productos
WHERE nombre ~ '^[^aeiou]'
    AND nombre ~! '[aeiou]$'
    AND