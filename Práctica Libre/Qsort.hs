-- Algoritmo de ordenamiento Quick Sort

-- qsort :: (Ord a)=>[a]->[a]

particion :: (Ord a)=> a -> [a] -> ([a], [a])
particion x [] = ([], [])
particion p (y:ys)
    | y <= p = (y:menores, mayores)
    | y > p  = (menores, y:mayores)
        where (menores, mayores) = particion p ys

qsort :: (Ord a)=> [a] -> [a]
qsort [] = []
qsort (x:xs) = resultado 
    where
    (menores, mayores) = particion x xs
    resultado = qsort menores ++ [x] ++ qsort mayores

