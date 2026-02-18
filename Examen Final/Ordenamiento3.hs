-- Insertion Sort

{- a) Escriba la función "isort :: (Ord a) => [a] -> [a]"
utilizando la función "insertar" definida previamente.
Observación: El algoritmo debe tomar el primer elemento de la
lista y utilizar la función "insertar" para ubicarlo en la
posición correcta dentro del resto de la lista ya ordenada
recursivamente. -}
{- HLINT ignore "Use foldr" -}

insertar :: (Ord a)=> a -> [a] -> [a]
insertar x [] = [x]
insertar x (y:ys)
    | x < y = x : y : ys
    | otherwise = y : insertar x ys

isort :: (Ord a)=> [a] -> [a]
isort [] = []
isort (x:xs) = insertar x (isort xs)