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

--e) restos, que calcula la lista de los restos de la división de los elementos de una lista de números dada por otro número dado
restos :: [Int] -> Int -> [Int]
restos [] n = []
restos (x:xs) n = mod x n : restos xs n -- la f mod de Haskell calcula los restos de la división de enteros
-- mod se puede usar: mod x n // x `mod` n

--f) cuadrados, que dada una lista de números, devuelva la lista de sus cuadrados
cuadrados :: [Int] -> [Int]
cuadrados [] = []
cuadrados (x:xs) = x * x : cuadrados xs

--g) longitudes, que dada una lista de listas, devuelva la lista de sus longitudes
longitudes :: [[a]] -> [Int] -- recibe lista de listas
longitudes [] = []
longitudes (x:xs) = length x : longitudes xs
-- por más que reciba lista de listas, se usa el patron (x:xs)
-- x va a ser la primera sub-lista, xs las restantes sub-listas

--h) orden, que dada una lista de pares de números, devuelve la lista de aquellos pares en los que la primera componente es menor que el triple de la segunda
orden :: [(Int, Int)] -> [(Int, Int)]
orden [] = []
orden ((a, b):xs) = if a < (3*b) 
                    then (a, b) : orden xs -- si el par cumple, lo agrego al resultado y sigo evaluando
                    else orden xs -- si el par no cumple, no lo agrego y sigo evaluando el resto

--i) pares, que dada una lista de enteros, devuelve la lista de los elementos pares
pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) = if even x then x : pares xs -- even, es una f propia de Haskell para saber si un num es par
                else pares xs

--j) letras, que dada una lista de caracteres, devuelve la lista de aquellos que son letras (minúsculas o mayúsculas)
letras :: [Char] -> [Char]
letras [] = []
letras (x:xs) = if (x >= 'a' && x <= 'z') || (x >= 'A' && x <= 'Z') then x : letras xs -- hay otros caracteres que no son letras, por ejemplo '@', '4'
                else letras xs

--k) masDe, que dada una lista de listas xxs y un número n, devuelve la lista de aquellas listas de xxs con longitud mayor que n
masDe :: [[a]] -> Int -> [[a]] -- recibe una lista de listas y un núm y devuelve una lista de listas
masDe [] n = []
masDe (x:xs) n = if length x > n then x : masDe xs n
                else masDe xs n


