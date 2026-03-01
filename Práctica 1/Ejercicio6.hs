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
alguno (x:xs)
    | x == True = True
    | otherwise = alguno xs

--c) todos, que devuelve True si todos los elementos de una lista de valores booleanos son True, y False en caso contrario
todos :: [Bool] -> Bool
todos [] = True -- si no hay nada que sea False, entonces podemos decir que "todos" (el conjunto vacío) cumplen la condición
todos (x:xs)
    | x == True = todos xs
    | otherwise = False

--d) codes, que dada una lista de caracteres, devuelve la lista de sus ordinales
codes :: [Char] -> [Int]
codes [] = []
codes (x:xs) = (ascii x) : codes xs

ascii :: Char -> Int
ascii 'a' = 97
ascii 'b' = 98
ascii 'c' = 99
ascii 'd' = 100 
-- ...

--e) restos, que calcula la lista de los restos de la división de los elementos de una lista de números dada por otro número dado
restos :: [Int] -> Int -> [Int]
restos [] n = []
restos (x:xs) n = (resto x n) : restos xs n

resto :: Int -> Int -> Int
resto x 0 = error "No se puede dividir por 0"
resto x 1 = 0  -- resto 0
resto x n
    | x >= n    = resto (x - n) n  -- mientras sea grande, le sigo quitando "paquetes"
    | otherwise = x                -- cuando ya es chico, econtré el resto
-- el resto es, por definición, lo que sobra de una división entera. Y lo que sobra siempre tiene que ser menor 
-- al divisor.

--f) cuadrados, que dada una lista de números, devuelva la lista de sus cuadrados
cuadrados :: [Int] -> [Int]
cuadrados [] = []
cuadrados (x:xs) = x * x : cuadrados xs

--g) longitudes, que dada una lista de listas, devuelva la lista de sus longitudes
longitudes :: [[a]] -> [Int] -- recibe lista de listas
longitudes [] = []
longitudes (x:xs) = calculaLong x : longitudes xs
-- por más que reciba lista de listas, se usa el patron (x:xs)
-- x va a ser la primera sub-lista, xs las restantes sub-listas

calculaLong :: [a] -> Int
calculaLong [] = 0
calculaLong [x] = 1
calculaLong (x:xs) = 1 + calculaLong xs

--h) orden, que dada una lista de pares de números, devuelve la lista de aquellos pares en los que la primera componente es menor que el triple de la segunda
orden :: [(Int, Int)] -> [(Int, Int)]
orden [] = []
orden ((a, b):xs) = if a < (3*b) 
                    then (a, b) : orden xs -- si el par cumple, lo agrego al resultado y sigo evaluando
                    else orden xs -- si el par no cumple, no lo agrego y sigo evaluando el resto

--i) pares, que dada una lista de enteros, devuelve la lista de los elementos pares
pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) 
    | esPar x = x : pares xs
    | otherwise = pares xs

esPar :: Int -> Bool
esPar 0 = True
esPar 1 = False
esPar x 
    | x > 0 = esPar (x - 2)
    | otherwise = esPar (x + 2)

--j) letras, que dada una lista de caracteres, devuelve la lista de aquellos que son letras (minúsculas o mayúsculas)
letras :: [Char] -> [Char]
letras [] = []
letras (x:xs) = if (x >= 'a' && x <= 'z') || (x >= 'A' && x <= 'Z') then x : letras xs -- hay otros caracteres que no son letras, por ejemplo '@', '4'
                else letras xs

--k) masDe, que dada una lista de listas xxs y un número n, devuelve la lista de aquellas listas de xxs con longitud mayor que n
masDe :: [[a]] -> Int -> [[a]] -- recibe una lista de listas y un núm y devuelve una lista de listas
masDe [] n = []
masDe (x:xs) n
    | longitud x > n = x : masDe xs n
    | otherwise      = masDe xs n

longitud :: [a] -> Int
longitud [] = 0
longitud [x] = 1
longitud (x:xs) = 1 + longitud xs

--l) Saber si un elemento está adentro de una lista.

pertenece :: (Eq a) => a -> [a] -> Bool
pertenece x [] = False
pertenece x (y:ys)
    | x == y = True
    | otherwise = pertenece x ys
