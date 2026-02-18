{- a) Escriba una función "mitades :: [a] -> ([a], [a])"
que dada una lista, la divida en dos partes de tamaño similar
(pueden usar la función "splitAt" o calcular la longitud). -}
{- b) Escriba una función "merge :: (Ord a) => [a] -> [a] -> [a]"
que reciba dos listas ya ordenadas y las combine en una sola lista
que también esté ordenada. -}
{- c) Escriba la función "msort :: (Ord a) => [a] -> [a]".
Observación: El algoritmo debe dividir la lista en dos mitades,
ordenar cada mitad recursivamente con msort y luego combinarlas
usando la función merge. -}