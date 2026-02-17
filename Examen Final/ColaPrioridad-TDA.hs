-- Cola de Prioridad con Árboles Binarios de Búsqueda

{- Las funciones que manipulan a la cola de prioridad, son:
mkqpr: Instancia una nueva cola de prioridad vacía.
addqpr: Agrega un nuevo elemento a la cola de prioridad
nextqpr: Devuelve el elemento con clave más baja de la Cola de prioridad.
popqpr: Devuelve una cola de prioridad donde se ha quitado el nextqpr.
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

-- definición TDA
newtype ColaPrioridad a = CP (Bintree a) deriving Show

-- funciones
mkqpr :: (Ord a)=> ColaPrioridad a
mkqpr = CP mkNewTree -- aplico el constructor de cola de prioridad a la función de creación de árboles (resultado)

addqpr :: (Ord a)=> a -> ColaPrioridad a -> ColaPrioridad a
addqpr x (CP c) = CP (addTree x c) -- aplico el constructor CP para encapsular el resultado

nextqpr :: (Ord a)=> ColaPrioridad a -> a
nextqpr (CP EmptyBT) = error "Cola Vacía"
nextqpr (CP c) = let (valor, _) = minTree c -- los () sirven para desempaquetar los valores de la tupla
                 in valor -- después del in, simplemente se devuelve el valor que se atrapó con let
                          -- no lleva CP adelante, porque el tipo de retorno es a (el elemento), no la cola completa

popqpr :: (Ord a)=> ColaPrioridad a -> ColaPrioridad a
popqpr (CP EmptyBT) = error "Cola Vacía"
popqpr (CP c) = let (_, cola) = minTree c
                  in CP cola

-- testeo
{- en el GHCi:
let c0 = mkqpr
let c1 = addqpr 10 c0
let c2 = addqpr 5 c1
let c3 = addqpr 20 c2 -}
-- muchas variables para poder testear diferetes partes es mejor que una variable que englobe todo