-- Ejercicio para el lector: Escriba el modulo diccionario con una implementación de los mismos utilizando List.

module Dictionary (Dict, mkNewDict, insertDict, inDict, delDict) where --en module no estoy definiendo el tipo. Estoy diciendo qué nombre se exporta.
    
    -- representación interna
    newtype Dict a = D [a] -- constructor D del tipo Dict
    --Este tipo Dict depende de un tipo cualquiera 'a'
    --Un Dict a, internamente es una lista [a], pero no quiero que desde afuera sepan que es una lista

    -- crear un diccionario vacío
    mkNewDict :: Dict a 
    mkNewDict = D []

    -- insertar un elemento (sin repetir)
    insertDict :: (Ord a) => a -> Dict a -> Dict a 
    insertDict x (D xs)
        | elem x xs = D xs -- la f 'elem' devuelve true si x pertenece a xs. Si es true, la f insertDict devuelve la lista sin incluir el elemento porque se repetiría
        | otherwise = D (x:xs) -- en cualquier otro caso, agrega el elemento

    -- verificar si pertenece un elemento
    inDict :: (Ord a) => a -> Dict a -> Bool 
    inDict x (D xs) = elem x xs -- elem, devuelve true o false

    -- eliminar un elemento
    delDict :: (Ord a) => a -> Dict a -> Dict a
    delDict x (D xs) = D (del x xs)

    -- func. auxiliar
    del :: (Eq a) => a -> [a] -> [a]
    del _ [] = [] -- caso base
    del x (y:ys)
        | x == y    = del x ys
        | otherwise = y : del x ys

    -- eliminar un elemento (usando filter)
    {- delDict :: (Ord a) => a -> Dict a -> Dict a
    delDict x (D xs) = D (filter (/= x) xs) -}