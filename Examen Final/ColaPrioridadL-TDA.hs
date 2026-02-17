-- Cola de Prioridad con Listas

{- Las funciones que manipulan a la cola de prioridad, son:
mkqpr: Instancia una nueva cola de prioridad vacía.
addqpr: Agrega un nuevo elemento a la cola de prioridad
nextqpr: Devuelve el elemento con clave más baja de la Cola de prioridad.
popqpr: Devuelve una cola de prioridad donde se ha quitado el nextqpr.
-}

-- definición
-- (no necesito usar 'data' porque Haskell ya conoce qué son las Listas. Utilizo 'newtype')

newtype ColaPrioridadL a = CPL [a] deriving Show -- 'deriving' de derivar (o heredar) las func. de Show

-- funciones
mkqpr :: (Ord a)=> ColaPrioridadL a
mkqpr = CPL []

-- func. aux. (solo listas)
insert :: (Ord a)=> a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) 
        | x < y   = x : y : ys -- si x < y, pego x adelante
        | otherwise = y : insert x ys -- si x no es < y, dejo y como estaba y sigo buscando en el resto (ys)
-- inserta elementos de manera ordenada

addqpr :: (Ord a)=> a -> ColaPrioridadL a -> ColaPrioridadL a
addqpr x (CPL c) = let lista = insert x c
                   in CPL lista

nextqpr :: (Ord a)=> ColaPrioridadL a -> a
nextqpr (CPL []) = error "La cola está vacía"
nextqpr (CPL c) = head c -- como recibe la cola (lista) ordenada, devuelve el primer elemento que siempre será el mínimo
-- es lo mismo que hacer:  nextqpr (CPL (x:xs)) = x

popqpr :: (Ord a)=> ColaPrioridadL a -> ColaPrioridadL a
popqpr (CPL []) = error "La cola está vacía"
popqpr (CPL c) = CPL (tail c)
-- es lo mismo que hacer: popqpr (CPL (x:xs)) = CPL (xs)
