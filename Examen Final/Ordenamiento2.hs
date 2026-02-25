-- Merge Sort

{- a) Escriba una función "mitades :: [a] -> ([a], [a])"
que dada una lista, la divida en dos partes de tamaño similar. -}

mitades :: [a] -> ([a], [a])
mitades [] = ([],[])
mitades [a] = ([a], [])
mitades (a:b:t) = let     -- a = primer elemento, b = segundo elemento, t = el resto 
                 (m,n) = mitades t 
                in
                 (a:m, b:n)

-- (a:m, b:n): Agrega la carta a al montón m y la carta b al montón n

-- versión 2:
split2 :: [a] -> ([a], [a])
split2 [] = ([],[])
split2 [a] = ([a], [])
split2 (a:b:t) = (a:m, b:n)
                where (m,n) = split2 t

{- b) Escriba una función "merge :: (Ord a) => [a] -> [a] -> [a]"
que reciba dos listas ya ordenadas y las combine en una sola lista
que también esté ordenada. -}

merge :: (Ord a)=> [a] -> [a] -> [a] -- une los dos mazos ordenados
merge [] [] = []
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
    | x <= y    = x : merge xs (y:ys) -- pongo x al frente. Para saber quién sigue, tenemos que comparar lo que quedó de mi mazo (xs) contra todo el otro mazo que sigue intacto (y:ys)
    | otherwise = y : merge (x:xs) ys -- pongo y al frente y sigo comparando todo mi mazo (x:xs) con el resto del otro (ys)

{- c) Escriba la función "msort :: (Ord a) => [a] -> [a]".
Observación: El algoritmo debe dividir la lista en dos mitades,
ordenar cada mitad recursivamente con msort y luego combinarlas
usando la función merge. -}

msort :: (Ord a)=> [a] -> [a]
msort [] = [] -- caso base por seguridad
msort [x] = [x] -- caso base por lógica. Listas de un elemento, ya están ordenadas.
msort lista = merge listaA listaB -- 4. Mezclo usando merge
    where 
        (izq, der) = mitades lista -- 1. Divido la lista original usando la f mitades
        listaA = msort izq -- 2. Ordeno la lista izq recursivamente con msort, continuando con subdivisiones de listas hasta llegar a [x]
        listaB = msort der -- 3. Ordeno la lista der recursivamente con msort, continuando con subdivisiones de listas hasta llegar a [x]

-- la bajada (1, 2, 3)
-- la subida (4)