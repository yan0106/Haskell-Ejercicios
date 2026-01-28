--7)
{- El producto escalar de dos listas de enteros de igual longitud es la suma de los productos de
los elementos sucesivos (misma posición) de ambas listas. Usando listas por comprensión de una
una función 'scalarproduct' que devuelva el producto escalar de dos listas.
Sugerencia: Usar las funciones zip y sum.

zip [1,2,3] [4,5,6] = [(1,4),(2,5),(3,6)] -- ayuda a emparejar los elementos que van juntos
listas por comprención -> sirven para transformar cada par en un producto
sum [1,2,3] = 6 -- va a junar todos los productos en un solo valor, resultado. -}

-- multiplica los elementos de la misma posición y después suma todos esos productos --
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct lista1 lista2 = sum [x*y | (x,y) <- zip lista1 lista2] 
