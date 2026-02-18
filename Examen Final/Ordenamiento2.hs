-- Merge Sort

{- a) Escriba una función "mitades :: [a] -> ([a], [a])"
que dada una lista, la divida en dos partes de tamaño similar
(pueden usar la función "splitAt" o calcular la longitud). -}

mitades :: [a] -> ([a], [a])
mitades [] = ([],[])
mitades [a] = ([a],[])
mitades lista = splitAt mitad lista  -- la f splitAt recibe un un número y una lista, y devuelve un par de listas (una tupla)
    where mitad = div (length lista) 2 -- length me da el largo de la lista, luego divido en 2 ese largo

-- código del profesor: 
split :: [a] -> ([a], [a])
split [] = ([],[])
split [a] = ([a], [])
split (a:b:t) = let     -- a = primer elemento, b = segundo elemento, t = el resto 
                 (m,n) = split t
               in
                 (a:m, b:n)
{-En lugar de medir el largo de la lista y cortarla con una tijera al medio, propone algo más manual, 
como cuando se reparten cartas:
1.Tomo la primera carta (a) y la pongo en el mazo de la izquierda.
2.Tomo la segunda carta (b) y la pongo en el mazo de la derecha.
3.Repito el proceso con el resto del mazo (t).-}
-- (a:m, b:n): Agrega la carta a al montón m y la carta b al montón n

-- versión 2 del profesor:
split2 :: [a] -> ([a], [a])
split2 [] = ([],[])
split2 [a] = ([a], [])
split2 (a:b:t) = (a:m, b:n)
                where (m,n) = split2 t

{- b) Escriba una función "merge :: (Ord a) => [a] -> [a] -> [a]"
que reciba dos listas ya ordenadas y las combine en una sola lista
que también esté ordenada. -}



{- c) Escriba la función "msort :: (Ord a) => [a] -> [a]".
Observación: El algoritmo debe dividir la lista en dos mitades,
ordenar cada mitad recursivamente con msort y luego combinarlas
usando la función merge. -}