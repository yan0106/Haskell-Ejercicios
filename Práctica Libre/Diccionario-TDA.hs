newtype Diccionario a = Dicc [a]

nuevoDicc :: Diccionario a
nuevoDicc = Dicc []

insertarDicc :: (Ord a)=> a -> Diccionario a -> Diccionario a
insertarDicc x (Dicc lista) = Dicc (insAux x lista) -- el trabajo lo hace la func. aux., luego se encapsula con Dicc
-- inserta un elemento de forma ordenada, utilizando la función auxiliar: insAux

-- Función auxiliar 
insAux :: (Ord a) => a -> [a] -> [a]
insAux x [] = [x]
insAux x (y:ys)
    | x == y    = y:ys
    | x < y     = x:y:ys
    | otherwise = y : insAux x ys

