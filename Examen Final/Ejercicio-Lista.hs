{-Utilizando sólo la función miZip escriba la función "indexado". Dada una lista produce una 
lista de pares donde cada elemento de la lista tiene su posición dentro de la misma, la 
indexación comienza en 1.

Indique la definición de tipos de la función indexado.

Ej: indexado ["Juan", "Pedro", "Luis"] => [("Juan",1),("Pedro",2),("Luis",3)]-}

miZip :: [a]->[b]->[(a,b)]
miZip [] _ = [] 
miZip _ [] = []
miZip (x:xs) (y:ys) = (x,y) : miZip xs ys

indexado :: [a] -> [(a,Int)]
indexado lista = [(x,n) | (x,n) <- miZip lista [1..l]]
                 where l = largo lista

largo :: [a] -> Int
largo [] = 0
largo (x:xs) = 1 + (largo xs)

--versión 2
indexado2 :: [a] -> [(a,Int)]
indexado2 lista = miZip lista [1..l]
                 where l = largo lista