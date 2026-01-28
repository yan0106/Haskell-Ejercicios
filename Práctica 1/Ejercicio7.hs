--7)
{- El producto escalar de dos listas de enteros de igual longitud es la suma de los productos de
los elementos sucesivos (misma posición) de ambas listas. Usando listas por comprensión de una
una función 'scalarproduct' que devuelva el producto escalar de dos listas.
Sugerencia: Usar las funciones zip y sum.
zip [1,2,3] [4,5,6] = [(1,4),(2,5),(3,6)]
sum [1,2,3] = 6  -}

-- multiplica los elementos de la misma posición y después suma todos esos productos
scalarproduct :: [Int] -> [Int] -> Int
