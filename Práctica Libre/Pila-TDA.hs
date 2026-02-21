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


