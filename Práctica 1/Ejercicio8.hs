--8) Definir las siguientes funciones usando listas por comprensión:
--a) divisors, que dado un entero positivo x devuelve la lista de los divisores de x (y la lista vacía si el entero no es positivo)

divisors :: Int -> [Int]
divisors x
    | x <= 0 = []
    | x > 0 = [n | n <- [1..x], mod x n == 0]

--b) matches, que dados un entero x y una lista de enteros descarta de la lista los elementos distintos a x

matches :: Int -> [Int] -> [Int]
matches n lista = [x | x <- lista, n == x]

--c) unique, que dada una lista xs de enteros, devuelve la lista con los elementos no repetidos de xs

unique :: [Int] -> [Int]
unique [] = []
unique (x:xs) = x : unique [ y | y <- xs, y /= x ] -- con ':' me guardo a x y sigo filtrando el resto con recursión

--d) 
{- cuadrupla, que dados cuatro enteros a, b, c, d tales que 0 < a, b, c, d <= 100, devuelve las cuadruplas (a,b,c,d)
que cumplen a^2 + b^2 = c^2 + d^2 -}

cuadrupla :: Int -> [(Int, Int, Int, Int)]
cuadrupla n = [(a, b, c, d) | a <- [1..tope], b <- [1..tope], c <- [1..tope], d <- [1..tope], a^2 + b^2 == c^2 + d^2]
        where tope = min n 100
-- el rango empieza en 1 (por la consigna 0 < a) y tiene un techo de 100 (<= 100)
-- la función 'min' de Haskell compara dos números y devuelve el valor más chico

