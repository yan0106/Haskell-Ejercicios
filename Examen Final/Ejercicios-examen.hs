{-
-a) Escribir una función que inserta elementos en una lista de manera de mantenerla ordenada de menor a mayor. De esta forma cada operación Head sobre la lista devuelve el elemento más chico almacenado en ella.

inserta:: (Ord a)=> a->[a]->[a]
-b) Escribir una funcion que busca un elemento x en una lista m y lo elimina de la misma. El resultado será la lista sin el valor x en ella.

borra:: (Ord a )=> a -> [a] -> [a]

-Se dice que 
" Un entero positivo es perfecto si es igual a la suma de sus divisores, excluyendo el propio número" 

Definir por comprensión la función perfectos, indicando  su definicion de tipos.
tal que (perfectos n) es la lista de todos los números perfectos menores que n. Por ejemplo,
perfectos 500  ==>  [6, 28, 496]
dado n , sea [1, x1,x2,...xi] con xi <n , la lista de divisores de n. 
sum [1, x1,x2,...xi] == n,  implica n es perfecto.sar
Ejemplo . n =6  sean [1,2,3] sus divisores
1+2+3 = 6 , por tanto 6 es perfecto


-Escriba una funcion que implemente el metodo de clasificacion de listas Quick Sort.
Para ello escriba una funcion auxiliar particion que reciba como argumento, un valor de referencia o pivot y a una lista de valores del mismo tipo que el pivot. 
Esta funcion da como resultado una tupla con dos listas ( l1 , l2) ... 
de modo  que en l1 estan todos los valores de la lista original que son menores o iguales que el pivot y  en l2 todos los mayores que el pivot.
particion :: Ord a => a->[a]->( [a] , [a] )
La funcion de clasificacion Qsort SE IMPLEMENTARA SIN UTILIZAR LISTAS  POR COMPRENSION
-}