-- Diccionario TDA (con ABB)

-- definición interna
data BinTree a = EmptyBT | NodoBT a (BinTree a) (BinTree a) deriving Show

-- funciones (setEmptyTree, inTree, addTree, delTree -minTree-)

setEmptyTree :: (Ord a)=> BinTree a
setEmptyTree = EmptyBT

inTree :: (Ord a)=> a -> BinTree a -> Bool
inTree x EmptyBT = False
inTree x (NodoBT y lf rt)
    | x == y = True
    | x < y = inTree x lf
    | x > y = inTree x rt

addTree :: (Ord a)=> a -> BinTree a -> BinTree a
addTree x EmptyBT = NodoBT x EmptyBT EmptyBT
addTree x (NodoBT y lf rt)
    | x == y = NodoBT y lf rt
    | x < y = NodoBT y (addTree x lf) rt
    | x > y = NodoBT y lf (addTree x rt)

delTree :: (Ord a)=> a -> BinTree a -> BinTree a
delTree x EmptyBT = EmptyBT
delTree x (NodoBT y lf EmptyBT)
    | x == y = lf
delTree x (NodoBT y EmptyBT rt)
    | x == y = rt
delTree x (NodoBT y lf rt)
    | x < y  = delTree x lf
    | x > y  = delTree x rt
    | x == y = let (v, new_rt) = minTree rt -- le paso la derecha a minTree porque tenemos que encontrar el más chico de la derecha para mantener la propiedad del ABB
               in  NodoBT v lf new_rt

minTree :: (Ord a)=> BinTree a -> (a, BinTree a) -- devuelve el valor más chico y el árbol sin ese valor. Siempre se llama cdo sabemos que el árbol tiene algo
minTree (NodoBT n EmptyBT rt) = (n, rt)
minTree (NodoBT n lf rt) = let (x, new_lf) = minTree lf -- armo una variable para guardar el resultado de la recursión sobre el hijo izquierdo
                           in (x, NodoBT n new_lf rt) -- reconstruyo el árbol con los nuevos valores del hijo izquierdo sin el mínimo

-- encapsulamiento 
newtype Dict a = Dicc (BinTree a) deriving Show

-- funciones (mkDict, insertDict, inDict, delDict)

mkDict :: (Ord a)=> Dict a
mkDict = Dicc setEmptyTree

insertDict :: (Ord a)=> a -> Dict a -> Dict a
insertDict x (Dicc t) = Dicc (addTree x t)

inDict :: (Ord a)=> a -> Dict a -> Bool
inDict x (Dicc t) = inTree x t

delDict :: (Ord a)=> a -> Dict a -> Dict a
delDict x (Dicc t) = Dicc (delTree x t)


