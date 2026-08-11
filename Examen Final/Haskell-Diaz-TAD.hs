{- Un CONJUNTO o SET, es una colección de ítems del mismo tipo distingibles entre si por su 
clave o  valor, en la cual un ítem puede ser testeado  si es miembro, insertado o  borrado de 
la colección. La cantidad  de elementos distintos es lo que se denomina el tamaño del conjunto.

Module Set (Set,  emptySet, setEmpty, inSet, addSet, delSet) where

emptySet  ::  Set a
setEmpty  ::  Set a  -> Bool
inSet      :: (Eq a) => a -> Set a -> Bool
addSet    :: (Eq a) => a -> Set a -> Set a
delSet    :: (Eq a) => a -> Set a -> Set a
unionSet :: (Eq a) => Set a -> Set a -> Set a

Defina el tipo de dato e implemente los métodos del nuevo tipo de dato, utilizando  
listas no ordenadas y sin duplicados.El metodo unionSet (Union de dos conjuntos) se escribira 
haciendo uso de los metodos ya definidos, es decir no se operará directamente la lista sino se 
operará al SET.-}

--definición interna
newtype Set a = S [a] deriving Show 

--funciones
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

addSet :: (Eq a) => a -> Set a -> Set a
addSet x (S []) = S [x]
addSet x (S (y:t))
    | x == y = S (y:t) -- no admite repetidos, devuelve el mismo conjunto
    | x /= y = S (x:y:t) -- si es distinto lo agrega, no importa el orden

delSet :: (Eq a) => a -> Set a -> Set a
delSet x (S []) = S []
delSet x (S set) = S (eliminar x set)

--func. aux.
eliminar :: (Eq a) => a -> [a] -> [a]
eliminar x [] = []
eliminar x (y:ys)
    | x == y = ys
    | x /= y = y: eliminar x ys

unionSet :: (Eq a) => Set a -> Set a -> Set a
unionSet (S []) (S []) = S []
unionSet (S setA) (S []) = S setA
unionSet (S []) (S setB) = S setB
unionSet (S (x:xs)) (S setB) = unionSet (S xs) (addSet x (S setB))















