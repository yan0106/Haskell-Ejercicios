{- a) Escriba una función "minimo :: (Ord a) => [a] -> a"
que devuelva el elemento más pequeño de una lista no vacía. -}
{- b) Escriba una función "quitar :: (Ord a) => a -> [a] -> [a]"
que reciba un elemento y una lista, y devuelva la lista sin la
primera aparición de dicho elemento. -}
{- c) Escriba la función "ssort :: (Ord a) => [a] -> [a]".
Observación: Para ordenar la lista, ssort debe encontrar el
mínimo, ponerlo al inicio y llamar recursivamente a ssort con el
resto de la lista (la lista original sin el mínimo). -}