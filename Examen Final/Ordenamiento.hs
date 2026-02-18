-- Ordenamiento

{-a) Escribir una función que inserta elementos en una lista de manera de mantenerla ordenada de
menor a mayor. De esta forma cada operación Head sobre la lista devuelve el elemento más
chico almacenado en ella.-}

insertar :: (Ord a)=> a -> [a] -> [a]
insertar x [] = [x]
insertar x (y:ys)
    | x < y = x : y : ys
    | otherwise = y : insertar x ys

-- Quick Sort

{-b) Escriba una función Qsort::(Ord a)=>[a]→[a]. Sin utilizar listas por comprensión.
Observación: Escriba una función particion que reciba como argumento, un valor de referencia o
pivot y a una lista de valores del mismo tipo que el pivot. Esta función da como resultado una
tupla con dos listas ( l1 , l2) ... de modo que en l1 están todos los valores de la lista original que
son menores o iguales que el pivot y en l2 todos los mayores que el pivot.
Particion :: Ord a =>a->[a]->([a],[a])-}

particion :: (Ord a)=> a -> [a] -> ([a], [a])
particion pivote [] = ([], []) -- caso base
particion pivote (x:xs)
    | x <= pivote  = (x : menores, mayores) -- qué pasa con un elem que es menor o igual al pivote
    | otherwise    = (menores, x:mayores) -- qué pasa con un elem que es mayor al pivote
    where (menores, mayores) = particion pivote xs -- recursión de la f sobre el resto (xs)
    -- where: quiénes son menores y mayores? -> son las dos bolsas que va a devolver la f cdo termine de procesar el resto de la lista (xs)
-- la f partición solo separa "menores" de "mayores", pero no garantiza que dentro de esas bolsas los números estén en orden

qsort :: (Ord a)=> [a] -> [a]
qsort [] = []
qsort (x:xs) = let (menores, mayores) = particion x xs -- el resultado de aplicar la f partición al head (x) de la lista como pivote, me da una tupla que la abro con ()
               in qsort menores ++ [x] ++ qsort mayores -- aplico recursivamente qsort a menores y a mayores para que vaya subdividiendo las listas y ordenando hasta llegar al caso base
               -- concateno las listas ya ordenadas con el pivote en el medio

