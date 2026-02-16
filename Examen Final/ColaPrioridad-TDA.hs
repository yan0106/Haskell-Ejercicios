{- Las funciones que manipulan a la cola de prioridad, son:
mkqpr: Instancia una nueva cola de prioridad vacía.
addqpr: Agrega un nuevo elemento a la cola de prioridad
nextqpr: Devuelve el elemento con clave más baja de la Cola de prioridad.
popqpr: devuelve una cola de prioridad donde se ha quitado el nextqpr.
-}

-- definición interna Árbol Binario de Búsqueda
data Bintree a = EmptyBT | NodoBT a (Bintree a) (Bintree a) deriving Show

-- funciones
mkNewTree :: (Ord a)=> Bintree a
mkNewTree = EmptyBT

addTree :: (Ord a)=> a -> Bintree a -> Bintree a
addTree x EmptyBT = NodoBT x EmptyBT EmptyBT
addTree x (NodoBT y lf rt)
    | x == y  = NodoBT y lf rt
    | x < y   = NodoBT y (addTree x lf) rt
    | x > y   = NodoBT y lf (addTree x rt)

minTree :: (Ord a)=> Bintree a -> (a, Bintree a)
minTree (NodoBT v EmptyBT rt) = (v, rt) -- caso base. Si estoy en el nodo v y a la izquierda está vacío, quiere decir que estoy con el valor más chico
minTree (NodoBT v lf rt) = let (x, new_lf) = minTree lf
                           in (x, NodoBT v new_lf rt)


