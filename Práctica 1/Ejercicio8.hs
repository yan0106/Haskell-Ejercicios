--8) Definir las siguientes funciones usando listas por comprensión:
--a) divisors, que dado un entero positivo x devuelve la lista de los divisores de x (y la lista vacía si el entero no es positivo)

divisors :: Int -> [Int]
divisors x
    | x <= 0 = []
    | x > 0 = [n | n <- [1..x], mod x n == 0]

--b) matches, que dados un entero x y una lista de enteros descarta de la lista los elementos distintos a x

matches :: Int -> [Int] -> [Int]
matches n lista = [x | x <- lista, n == x]

