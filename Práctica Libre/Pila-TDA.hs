-- Pila o Stack TDA (con listas) 
-- (LIFO)

-- definición interna
newtype Stack a = S [a] deriving Show

-- funciones (emptyStack, push, pop, top, stackIsEmpty)

emptyStack :: Stack a
emptyStack = S []

push :: a -> Stack a -> Stack a
push x (S lista) = S (x:lista)

pop :: Stack a -> Stack a -- no necesito recibir ninguna x, el elemento que sale es el de arriba de la pila
pop (S []) = error "Pila Vacía"
pop (S (y:ys)) = S ys

top :: Stack a -> a -- mira quién está arriba de todo pero sin sacarlo
top (S []) = error "Pila Vacía"
top (S (y:ys)) = y

stackIsEmpty :: Stack a -> Bool
stackIsEmpty (S []) = True
stackIsEmpty (S (y:ys)) = False

-------------------------------------------------------------

-- otra definición interna posible
data Pila a  = Empty | Nodo a (Pila a) -- Nodo espera dos cosas

-- Un Nodo es una caja que guarda un valor (el a) y que además tiene un brazo que sostiene a otra Pila completa (como una mamushka)
-- o sos el vacío (Empty) o sos un Nodo enganchado a algo que también sea una Pila

-- funciones (emptyPila, pushPila, popPila, topPila, pilaIsEmpty)

emptyPila :: Pila a
emptyPila = Empty

pushPila :: a -> Pila a -> Pila a
pushPila x pila = Nodo x pila -- la f necesita el elem y la lista, devuelve un nuevo Nodo que necesita el elemento y la lista vieja

popPila :: Pila a -> Pila a
popPila Empty = error "Pila Vacía"
popPila (Nodo x pila) = pila 

topPila :: Pila a -> a
topPila Empty = error "Pila Vacía"
topPila (Nodo x pila) = x

pilaIsEmpty :: Pila a -> Bool
pilaIsEmpty Empty = True
pilaIsEmpty (Nodo x pila) = False
