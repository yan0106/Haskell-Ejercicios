-- Selection Sort

delete :: (Ord a)=> a -> [a] ->[a]
delete y [] = []
delete y l = [x | x <- l, x /= y] 
-- reconstruyo una lista con los elementos que sean distintos de y. Elimina todas las apariciones de y

minimo :: (Ord a)=> [a] -> a
minimo [x] = x
minimo (x:y:t) = if x < y then minimo (x:t) else minimo (y:t) 
-- comparo x e y, me quedo con el menor y lo sigo comparando con el resto de la lista

ssort :: (Ord a)=> [a] -> [a]
ssort [] = []
ssort [x] = [x]
ssort l = m : ssort l' -- pego el mínimo adelante de la lista y vuelvo a llamar ssort sobre el resto de la lista sin ese mínimo
    where m = minimo l -- busco el mínimo de la lista
          l' = delete m l -- elimino el mínimo y devuelvo una lista nueva

{- 
ssort [4,2,5,1]
= 1 : ssort [4,2,5]
= 1 : (2 : ssort [4,5])
= 1 : (2 : (4 : ssort [5]))
= 1 : (2 : (4 : [5])) 
-}
