-- Ordenamiento

-- Selection Sort
-- (minimo, quitar, ssort)

minimo :: (Ord a)=> [a] -> a
minimo [] = error "Lista vacía"
minimo [x] = x
minimo (x:xs) 
    | x < resto = x
    | otherwise = resto
    where resto = minimo xs 

quitar :: (Ord a)=> a -> [a] -> [a]
quitar x [] = []
quitar x (y:ys)
    | x == y    = ys
    | otherwise = y : quitar x ys

ssort :: (Ord a)=> [a] -> [a]
ssort [] = []
ssort lista = m : ssort resto
    where m = minimo lista
          resto = quitar m lista

--------------------------------------------------------
