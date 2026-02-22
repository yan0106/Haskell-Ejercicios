-- Cola de Prioridad con Árboles Binarios de Búsqueda

-- definición interna
data Bintree a = EmptyBT | NodoBT a (Bintree a) (Bintree a) deriving Show

-- funciones (setEmptyTree, inTree, addTree, delTree -minTree-)

setEmptyTree :: (Ord a)=> Bintree a
setEmptyTree = EmptyBT

inTree :: (Ord a)=> a -> Bintree a -> Bool
inTree x EmptyBT = False
inTree x (NodoBT y lf rt)
    | x == y = True
    | x < y  = inTree x lf
    | x > y = inTree x rt

addTree :: (Ord a)=> a -> Bintree a -> Bintree a
addTree x EmptyBT = NodoBT x EmptyBT EmptyBT
addTree x (NodoBT y lf rt)
    | x == y = NodoBT y lf rt
    | x < y  = NodoBT y (addTree x lf) rt
    | x > y  = NodoBT y lf (addTree x rt)

-- no necesito la función de borrado complejo 'delTree' para la Cola de Prioridad porque sale siempre
-- el más bajo (el mínimo).

{- delTree :: (Ord a)=> a -> Bintree a -> Bintree a
delTree x EmptyBT = EmptyBT
delTree x (NodoBT y lf EmptyBT)
    | x == y = lf
delTree x (NodoBT y EmptyBT rt)
    | x == y = rt
delTree x (NodoBT y lf rt)
    | x < y  = NodoBT y (delTree x lf) rt
    | x > y  = NodoBT y lf (delTree x rt)
    | x == y = let (v, new_der) = minTree rt
               in NodoBT v lf new_der -}     

-- la f minTree devuelve el mínimo y el árbol sin ese mínimo
minTree :: (Ord a)=> Bintree a -> (a, Bintree a)
minTree (NodoBT y EmptyBT rt) = (y, rt)
minTree (NodoBT y lf rt) = let (k, new_izq) = minTree lf
                           in (k, NodoBT y new_izq rt)

-- encapsulamiento
newtype ColaPrioridad a = CP (Bintree a) deriving Show 

-- funciones (mkqpr, addqpr, nextqpr, popqpr)

mkqpr :: (Ord a)=> ColaPrioridad a
mkqpr = CP (setEmptyTree)

addqpr :: (Ord a)=> a -> ColaPrioridad a -> ColaPrioridad a
addqpr x (CP cola) = CP (addTree x cola)

nextqpr :: (Ord a)=> ColaPrioridad a -> a
nextqpr (CP EmptyBT) = error "Cola de Prioridad Vacía"
nextqpr (CP cola) = let (x, y) = minTree cola
                    in x

popqpr :: (Ord a)=> ColaPrioridad a -> ColaPrioridad a
popqpr (CP EmptyBT) = error "Cola de Prioridad Vacía"
popqpr (CP cola) = let (x, y) = minTree cola
                   in CP y
