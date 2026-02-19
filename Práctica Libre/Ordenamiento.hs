-- Ordenamiento

-- Selection Sort
-- (minimo, quitar, ssort)
{- HLINT ignore "Use foldr" -}

minimo :: (Ord a)=> [a] -> a
minimo [] = error "Lista vacía"
minimo [x] = x
minimo (x:xs) 
    | x < resto = x
    | otherwise = resto
    where resto = minimo xs 

quitar :: (Ord a)=> a -> [a] -> [a]
quitar x [] = []
quitar x (y:ys)
    | x == y    = ys
    | otherwise = y : quitar x ys

ssort :: (Ord a)=> [a] -> [a]
ssort [] = []
ssort lista = m : ssort resto
    where m = minimo lista
          resto = quitar m lista

--------------------------------------------------------

-- Insertion Sort
-- (insertar, isort)

insertar :: (Ord a)=> a -> [a] -> [a]
insertar x [] = [x]
insertar x (y:ys) 
    | x < y = x : y : ys -- duda
    | otherwise = y : insertar x ys
-- test: probar con una lista que ya esté ordenada (condición)

isort :: (Ord a)=> [a] -> [a]
isort [] = []
isort (x:xs) = insertar x (isort xs)  {- El (isort xs) va "achicando" la lista hasta que no queda nada (caso base []), 
y después, cuando empieza a volver, va "armando" la lista de nuevo, pero usando insertar para que cada 
pieza nueva que quedó pendiente, entre en el lugar justo. -}

-------------------------------------------------------

-- Quick Sort 
-- (partición, qsort)

particion :: (Ord a)=> a -> [a] -> ([a],[a])
particion pivote [] = ([],[])
particion pivote (x:xs) 
    | x <= pivote = (x:menores, mayores)
    | otherwise   = (menores, x:mayores)
    where (menores, mayores) = particion pivote xs

qsort :: (Ord a)=> [a] -> [a]
qsort [] = []
qsort (x:xs) = let (menores, mayores) = particion x xs
               in menores ++ [x] ++ mayores

------------------------------------------------------------
-- Merge Sort
-- (mitades, merge, msort)

mitades :: [a] -> ([a],[a])
mitades [] = ([],[])
mitades [a] = ([a],[])
mitades lista = splitAt mitad lista
           where mitad = div (length lista) 2

merge :: (Ord a)=> [a] -> [a] -> [a]
merge [] []  = []
merge [] ys = ys   -- ys = 'lo que sea'
merge xs [] = xs   -- xs = 'lo que sea' 
merge (x:xs) (y:ys)
    | x <= y    = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

msort :: (Ord a)=> [a] -> [a]
msort [] = []
msort [x] = [x]
msort lista = resultado
            where (izq, der) = mitades lista 
                  izqOrd = msort izq
                  derOrd = msort der
                  resultado = merge izqOrd derOrd