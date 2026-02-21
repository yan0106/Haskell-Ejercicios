-- Cola TDA (con listas)
-- (FIFO)

-- definición interna
newtype Cola a = C [a] deriving Show

-- funciones (emptyCola, inCola, delCola, front, colaIsEmpty)

emptyCola :: Cola a
emptyCola = C []

inCola:: a -> Cola a -> Cola a
inCola x (C []) = C [x]
inCola x (C cola) = C (cola ++ [x])

delCola :: Cola a -> Cola a
delCola (C []) = error "Cola Vacía"
delCola (C (x:xs)) = C xs

front :: Cola a -> a
front (C []) = error "Cola Vacía"
front (C (x:xs)) = x

colaIsEmpty :: Cola a -> Bool
colaIsEmpty (C []) = True
colaIsEmpty (C (x:xs)) = False

----------------------------------------------
