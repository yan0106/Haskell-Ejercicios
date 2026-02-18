{- a) Escriba una función "minimo :: (Ord a) => [a] -> a"
que devuelva el elemento más pequeño de una lista no vacía. -}

minimo :: (Ord a)=> [a] -> a
minimo [x] = x
minimo (x:xs)
    | x < minimo_xs = x
    | otherwise = minimo_xs
    where minimo_xs = minimo xs

{- b) Escriba una función "quitar :: (Ord a) => a -> [a] -> [a]"
que reciba un elemento y una lista, y devuelva la lista sin la
primera aparición de dicho elemento. -}

quitar :: (Ord a)=> a -> [a] -> [a]
quitar x [] = []
quitar x (y:ys) 
    | x == y = ys
    | otherwise = resultado
    where resultado = y : quitar x ys

-- Selection Sort

{- c) Escriba la función "ssort :: (Ord a) => [a] -> [a]".
Observación: Para ordenar la lista, ssort debe encontrar el
mínimo, ponerlo al inicio y llamar recursivamente a ssort con el
resto de la lista (la lista original sin el mínimo). -}

ssort :: (Ord a)=> [a] -> [a]
ssort [] = []
ssort lista = valorMinimo : ssort resto
    where 
        valorMinimo = minimo lista
        resto = quitar valorMinimo lista
    