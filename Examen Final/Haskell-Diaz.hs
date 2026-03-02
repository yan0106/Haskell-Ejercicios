{- Recordemos que la función  de biblioteca ZIP, recibe como argumento dos listas (x:xs) 
e (y:ys)  y produce una lista de tuplas (i,j) donde los i provienen  de la primera lista y 
los j de la segunda, aparea ambas listas mientras es posible. Cuando una lista es 
mas larga que la otra, el resultado contempla solo los pares hasta donde pudieron 
formarse….
Ej   zip [1,2,3] [10..] = [(1,10), (2,11), (3,12)] 
a) Escriba una versión personal de la función zip, llamada miZip

miZip :: [a]->[b]->[(a,b)]-}

miZip :: [a]->[b]->[(a,b)]
miZip [] _ = [] 
miZip _ [] = []
miZip (x:xs) (y:ys) = (x,y) : miZip xs ys

{- b) Utilizando miZIP y listas por comprension. Escriba una función que realice el 
producto escalar de dos listas. Donde producto escalar "estaría definido" como la suma 
de los productos uno a uno, componente a componente de cada lista. Si una lista tuviera 
más elementos que la otra, al agotarse uno de los operandos se detiene la suma.

Indicar la definicion de tipos de la funcion "prodEsc"
si 
a= [a1,a2,...,ai,...,an)
b=[b1,b2,...,bi,...,bn, ...,bm)
entonces
prodEsc = a1*b1 + a2*b2+…+ai*bi+…+ an*bn. -}

prodEsc :: (Num a)=> [a] -> [a] -> a
prodEsc (x:xs) (y:ys) = sum [ x*y | (x,y) <-miZip (x:xs) (y:ys)]

{- a) Escribir una función que recibe como argumento dos listas ordenadas, y devuelve una 
lista ordenada fusión de las listas argumentos (la lista resultado se genera ordenada en 
el proceso  de fusion)
juntar :: (Ord a)=> [a]->[a]->[a] -}

juntar :: (Ord a)=> [a]->[a]->[a]
juntar [] [] = []
juntar a [] = a
juntar [] b = b
juntar (x:xs) (y:ys) 
    | x <= y = x : juntar xs (y:ys)
    | x > y  = y : juntar (x:xs) ys

{- b) Escribir una funcion que dada una lista de valores devuelve el valor minimo de la misma
minimo :: (Ord a) => [a] -> a -}

minimo :: (Ord a) => [a] -> a
minimo [] = error "Lista vacia"
minimo [x] = x
minimo (x:y:t) = if x < y then minimo (x:t)
                 else minimo (y:t)

----------------------------------------------------------------------------------------------
{-Escriba una funcion de clasificacion de una list autilizando el metodo de MERGE SORT.
Escriba todas las funciones auxliares necesarias para la implementacion correcta del 
algoritmo.-}

split :: (Ord a)=> [a] -> ([a],[a])
split [] = ([],[])
split [x] = ([x],[])
split (x:y:t) = (x:m,y:n)
                where (m,n) = split t

merge :: (Ord a)=> [a] -> [a] -> [a] -- duda si las listas son del mismo tipo
merge [] [] = []
merge a [] = a
merge [] b = b
merge (x:xs) (y:ys) = if x < y then x: merge xs (y:ys)
                      else y: merge (x:xs) ys

msort :: (Ord a)=> [a] -> [a]
msort [] = []
msort [x] = [x]
msort lista = merge izqOrd derOrd
              where (izq,der) = split lista
                    izqOrd = msort izq
                    derOrd = msort der

{- Una cola de prioridad es una estructura de datos que almacena elementos “clasificables”. Con la 
particularidad que, cuando se saca uno de ella siempre se extrae el elemento con menor clave, 
de ahí su nombre pues clasifica los elementos en función de su prioridad. La prioridad más baja 
primero.
Las funciones que manipulan a la cola de prioridad, son

mkqpr : Instancia una nueva cola de prioridad vacia.
addqpr: Agrega un nuevo elemento a la cola de prioridad
nextqpr: Devuelve el elemento con clave más baja de la Cola de prioridad.
popqpr: devuelve una cola de prioridad donde se ha quitado el nextqpr.

Defina el TAD ColaPrioridad, e implemente el mismo utilizando un árbol binario de búsqueda como 
estructura de almacenamiento.
Escribir todas las funciones necesarias para la manipulacion de la estructura subyascente, es decir
para manipular el arbol.

Sugerencia: Recordar como extraer el elemento con clave más pequeña de un árbol. -}

-- versión 1 --

-- definición interna --
data BinTree a = EmptyBT | NodoBT a (BinTree a) (BinTree a) deriving Show

-- funciones -- 
newBinTree :: (Ord a)=> BinTree a
newBinTree = EmptyBT -- la función es igual al constructor vacío

addBinTree :: (Ord a)=> a -> BinTree a -> BinTree a
addBinTree x EmptyBT = NodoBT x EmptyBT EmptyBT
addBinTree x (NodoBT y lf rt)
    | x == y = NodoBT y lf rt
    | x < y = NodoBT y (addBinTree x lf) rt
    | x > y = NodoBT y lf (addBinTree x rt)

minBinTree :: (Ord a)=> BinTree a -> a
minBinTree EmptyBT = error "Está vacío"
minBinTree (NodoBT y EmptyBT _) = y  -- si a la izquierda está vacío, no me interesa que haya a la derecha, estoy en el nodo más chico
minBinTree (NodoBT y lf rt) = minBinTree lf

popBinTree :: (Ord a)=> BinTree a -> BinTree a  -- necesito quitar el elem más chico de la izquierda
popBinTree EmptyBT = EmptyBT  -- árbol vacío
popBinTree (NodoBT y EmptyBT rt) = rt  -- o no tiene nada a la izquierda
popBinTree (NodoBT y lf rt) = NodoBT y (popBinTree lf) rt -- o tiene algo a la izquierda

-- probar funciones --
-- ghci> let arbol = NodoBT 5 (NodoBT 3 EmptyBT EmptyBT) (NodoBT 10 EmptyBT EmptyBT)

-- encapsulamiento --
newtype ColaPrioridad a = CP (BinTree a) deriving Show

mkqpr :: (Ord a)=> ColaPrioridad a
mkqpr = CP EmptyBT

addqpr :: (Ord a)=> a -> ColaPrioridad a -> ColaPrioridad a
addqpr x (CP arbol) = CP (addBinTree x arbol)

nextqpr :: (Ord a)=> ColaPrioridad a -> a
nextqpr (CP EmptyBT) = error "Cola vacía"
nextqpr (CP arbol) = minBinTree arbol

popqpr :: (Ord a)=> ColaPrioridad a -> ColaPrioridad a
popqpr (CP arbol) = CP (popBinTree arbol)





