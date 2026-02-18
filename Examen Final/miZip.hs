-- función miZip

{- Recordemos que la función de biblioteca ZIP, recibe como argumento dos listas (x:xs) e (y:ys) y
produce una lista de tuplas (i,j) donde los i provienen de la primera lista y los j de la segunda.
Cuando una lista es mas larga que la otra, el resultado contempla solo los pares hasta donde
pudieron formarse….
Ej zip [1,2,3] [10..] = [(1,10), (2,11), (3,12)]
a) Escriba una versión personal de la función zip, llamada miZip
miZip :: [a]->[b]->[(a,b)]
b) Utilizando sólo la función miZip escriba la función “adyacentes”. -}

miZip :: [a] -> [b] -> [(a,b)]
miZip [] [] = []
miZip [] _ = [] -- si la primera es vacía, no puedo armar ninguna pareja, no importa que tenga en la segunda lista
miZip _ [] = [] -- si la segunda es vacía, no puedo armar ninguna pareja, no importa que tenga en la primera lista 
miZip (x:xs) (y:ys) = (x, y) : miZip xs ys

adyacentes :: [a] -> [(a,a)]
adyacentes [] = []
adyacentes (x:xs) = miZip listaA listaB
        where listaA = x:xs
              listaB = xs

