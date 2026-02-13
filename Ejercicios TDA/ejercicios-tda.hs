-- Ejercicio para el lector: Escriba el modulo diccionario con una implementación de los mismos utilizando List.

module Dictionary (Dict, mkNewDict, insertDict, inDict, delDict) where --en module no estoy definiendo el tipo. Estoy diciendo qué nombre se exporta.
    
    newtype Dict a = D [a] -- constructor D del tipo Dict
    --Este tipo Dict depende de un tipo cualquiera 'a'
    --Un Dict a, internamente es una lista [a], pero no quiero que desde afuera sepan que es una lista

    mkNewDict :: Dict a -- crear una lista vacía
    mkNewDict = D []

    insertDict :: (Ord a) => a -> Dict a -> Dict a -- insertar un elemento en la lista
    insertDict x (D xs) = D (x:xs)

    inDict :: (Ord a) => a -> Dict a -> Bool -- buscar un elemento


    delDict :: (Ord a) => a -> Dict a -> Dict a -- eliminar un elemento



    