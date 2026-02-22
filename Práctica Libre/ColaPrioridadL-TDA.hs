-- Cola de Prioridad con listas

-- definición
newtype ColaPrioridad a = CP [a] deriving Show

-- funciones 

mkqpr :: (Ord a)=> ColaPrioridad a
mkqpr = CP []

addqpr :: (Ord a)=> a -> ColaPrioridad a -> ColaPrioridad a
addqpr x (CP []) = CP [x]
addqpr x (CP lista) = CP (insertar x lista)

insertar :: (Ord a)=> a -> [a] -> [a]
insertar x [] = [x]
insertar x (y:ys)
    | x == y = x : y : ys
    | x < y  = x : y : ys
    | x > y  = y : insertar x ys

nextqpr :: (Ord a)=> ColaPrioridad a -> a
nextqpr (CP []) = error "Cola de Prioridad Vacía"
nextqpr (CP (x:_)) = x 

popqpr :: (Ord a)=> ColaPrioridad a -> ColaPrioridad a
popqpr (CP []) = error "Cola de Prioridad Vacía"
popqpr (CP (_:xs)) = CP xs