-- Ordenamiento

-- Selection Sort
-- (minimo, quitar, ssort)
{- HLINT ignore "Use foldr" -}

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

-- Insertion Sort
-- (insertar, isort )

insertar :: (Ord a)=> a -> [a] -> [a]
insertar x [] = [x]
insertar x (y:ys) 
    | x < y = x : y : ys -- duda
    | otherwise = y : insertar x ys

isort :: (Ord a)=> [a] -> [a]
isort [] = []
isort (x:xs) = insertar x (isort xs)  {- El (isort xs) va "achicando" la lista hasta que no queda nada, 
y después, cuando empieza a volver, va "armando" la lista de nuevo, pero usando insertar para que cada 
pieza nueva entre en el lugar justo. -}