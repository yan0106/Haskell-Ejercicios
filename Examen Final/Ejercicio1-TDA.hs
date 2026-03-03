{- 
Un CONJUNTO o SET, es una colección de ítems del mismo tipo distinguibles entre sí por su clave o valor, 
en la cual un ítem puede ser testeado si es miembro, insertado o borrado de la colección. 
La cantidad de elementos distintos es lo que se denomina el tamaño del conjunto.

module Set (Set, emptySet, setEmpty, inSet, addSet, delSet, unionSet) where

Firmas de las funciones solicitadas:

emptySet :: Set a
setEmpty :: Set a -> Bool
inSet    :: (Eq a) => a -> Set a -> Bool
addSet   :: (Eq a) => a -> Set a -> Set a
delSet   :: (Eq a) => a -> Set a -> Set a
unionSet :: (Eq a) => Set a -> Set a -> Set a

Defina el tipo de dato e implemente los métodos del nuevo tipo de dato, 
utilizando listas no ordenadas y sin duplicados. 
El método unionSet (Unión de dos conjuntos) se escribirá haciendo uso de los 
métodos ya definidos, es decir no se operará directamente la lista sino que se operará al SET.
-}

--definición
newtype Set a = S [a] deriving Show

emptySet :: Set a
emptySet = S []

setEmpty :: Set a -> Bool
setEmpty (S []) = True
setEmpty (S (x:xs)) = False

inSet :: (Eq a) => a -> Set a -> Bool
inSet x (S []) = False
inSet x (S (y:ys))
    | x == y = True
    | x /= y = inSet x (S ys)

addSet :: (Eq a) => a -> Set a -> Set a  -- esta función se encarga de encapsular
addSet x (S lista) = S (add x lista)

--función aux--
add :: (Eq a)=> a -> [a] -> [a] -- esta función tiene la lógica de agregar un elemento
add x [] = [x]
add x (y:ys)
    | x == y = y:ys
    | x /= y = y: add x ys

delSet :: (Eq a) => a -> Set a -> Set a
delSet x (S lista) = S (borrar x lista)

--función aux--
borrar :: (Eq a)=> a -> [a] -> [a]
borrar x [] = []
borrar x (y:ys)
    | x == y = ys
    | x /= y = y: borrar x ys

unionSet :: (Eq a) => Set a -> Set a -> Set a
unionSet set1 set2
    | setEmpty set1 = set2
    | setEmpty set2 = set1
    | otherwise = addSet x (unionSet (S xs) set2) -- hace la unión entre el resto de set1 y set2. Primero resuelve la cola, después pega la cabeza x
                  where S (x:xs) = set1 -- desarma set1 para poder usar la x

