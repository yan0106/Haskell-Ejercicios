-- Cola de Prioridad, versión con Listas

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




