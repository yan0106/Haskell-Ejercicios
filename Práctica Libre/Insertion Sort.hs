-- Insertion Sort

insert :: (Ord a)=> a -> [a] -> [a] -- inserta un elemento en una lista ordenada
insert x [] = [x]
insert x (y:t) = if x < y then (x:y:t) 
                 else (y:x:t)

isort :: (Ord a)=> [a] -> [a]
isort [] = []
isort [x] = [x]
isort (x:t) = insert x (isort t)
-- desarmo (voy hacia abajo) 
-- reconstruyo ordenado (voy hacia arriba)