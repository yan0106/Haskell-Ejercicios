--6) Sin usar funciones predefinidas, defina recursivamente las siguientes funciones y determine su tipo más general:

--a) suma, que suma todos los elementos de una lista de números:
suma :: Num a => [a] -> a
suma [] = 0 -- 1. Caso base: Si la lista está vacía. Es cuando la condición frena.
suma (x:xs) = x + suma xs -- 2. Caso recursivo: Sumo el primero (x) con el resultado de sumar el resto (xs)
-- Nota: usamos los : para desarmar la lista. 
-- Se prioriza el Patern Matching para la recursividad. Escribimos 2 patrones

--b) alguno, que devuelve True si algún elemento de una lista de valores booleanos son True, y False en caso contrario
alguno :: [Bool] -> Bool
alguno [] = False -- caso base
alguno (x:xs) = x || alguno xs
-- si x es True, el resultado es True; si no, delega la evaluación al resto de la lista xs

--c) todos, que devuelve True si todos los elementos de una lista de valores booleanos son True, y False en caso contrario
todos :: [Bool] -> Bool
todos [] = True
todos (x:xs) = x && todos xs
{- Ejemplo: todos [True] -- lista con 1 elemento
1. Separa x = True, xs = [].
Calcula: True && todos []
2. Llama al base: todos []
El código devuelve: True.
3. Vuelve arriba:
True && True ... Resultado Final: True -}

--d) codes, que dada una lista de caracteres, devuelve la lista de sus ordinales
codes :: [Char] -> [Int]
codes [] = []
codes (x:xs) = fromEnum x : codes xs
-- fromEnum es una función propia de Haskell que convierte cualquier cosa enumerable a un número entero
-- en el caso de los char, ese número entero coincide con el código ASCII




