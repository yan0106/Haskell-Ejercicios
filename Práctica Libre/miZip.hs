-- función miZip

miZip :: [a]->[b]->[(a,b)]
miZip [] _ = [] 
miZip _ [] = []
miZip (x:xs) (y:ys) = (x,y) : miZip xs ys
-- caso base: necesito contemplar que cualquiera de las dos listas se agote primero []
-- no importa cuál se termine, si no hay pareja, no hay tupla

adyacentes :: [a] -> [(a,a)]
adyacentes [] = []
adyacentes (x:xs) = resultado
    where lista1 = x:xs
          lista2 = xs
          resultado = miZip lista1 lista2 