-- Ordenamiento

{-a) Escribir una función que inserta elementos en una lista de manera de mantenerla ordenada de
menor a mayor. De esta forma cada operación Head sobre la lista devuelve el elemento más
chico almacenado en ella.-}

insertar :: (Ord a)=> a -> [a] -> [a]
insertar x [] = [x]
insertar x (y:ys)
    | x < y = x : y : ys
    | otherwise = y : insertar x ys

{-b) Escriba una función Qsort::(Ord a)=>[a]→[a]. Sin utilizar listas por comprensión.
Observación: Escriba una función particion que reciba como argumento, un valor de referencia o
pivot y a una lista de valores del mismo tipo que el pivot. Esta función da como resultado una
tupla con dos listas ( l1 , l2) ... de modo que en l1 están todos los valores de la lista original que
son menores o iguales que el pivot y en l2 todos los mayores que el pivot.
Particion :: Ord a =>a->[a]->([a],[a])-}



