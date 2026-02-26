-- Quick Sort

qsort :: (Ord a)=> [a] -> [a]
qsort [] = []
qsort [x] = [x]
qsort (x:t) = qsort menores ++ [x] ++ qsort mayores
              where menores = [j | j <- t, j < x]
                    mayores = [j | j <- t, j >= x]

