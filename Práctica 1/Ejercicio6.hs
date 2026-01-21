--6) Sin usar funciones predefinidas, defina recursivamente las siguientes funciones y determine su tipo más general:

--a) suma, que suma todos los elementos de una lista de números:
suma :: Num a => [a] -> a
suma [] = 0 -- 1. Caso base: Si la lista está vacía. Es cuando la condición frena.
suma (x:xs) = x + suma xs -- 2. Caso recursivo: Sumo el primero (x) con el resultado de sumar el resto (xs)
-- Nota: usamos los : para desarmar la lista. 
-- No se usan guardas para la recursividad. Se usa pattern matching, escribimos 2 patrones

--b) 