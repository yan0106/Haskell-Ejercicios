{- Un array se define como una estructura lineal de acceso aleatorio donde todos sus elementos son del mismo tipo. 
La capacidad o tamaño del array queda determinado en el momento de su instanciación, donde el usuario indica el 
tamaño del array.

Acceso aleatorio indica que el usuario puede ingresar a una componente indicada del array, para actualización de 
datos o para recuperar un valor almacenado, conociendo el índice del mismo dentro de la estructura.

el índice i de un elemento del array siempre sera menor que n y mayor que cero ,  donde n es el tamaño indicado 
en el momento de la instanciación del array. Los elementos del array comienzan a indexarse desde cero, por lo tanto
0 <=i < n.

Crear el nuevo tipo Array unidimensional utilizando como base la siguiente construcción:

Array a = Arr ([a] , int) o de (  [a0,a1,...,an-1] , n  ) 

-- (x:xs , n)   x:xs son los valores almacenados en el array y n es el tamaño máximo del array. 

* Defina correctamente el tipo de dato

* Escriba las siguientes funciones que servirán para la manejo de la manipulación del nuevo tipo de datos.

array  valor n     // crea una array de tamaño n con todos valor inicial valor

Ej, array 0 10 , crea un array de 10 posiciones con valores iniciales 0

array :: a -> Int -> Array a  

----------

fromList:: [a] -> Array a    // Crea una array del tamaño adecuado a partir de los valores almacenados en la lista dada

-----------

update :: Array a -> Int -> a -> Array a    // coloca un valor en la posición indicada de un array

elemento:: Array a -> Int -> a    // extrae el valor almacenado en posición indicada

-----------
-}


--versión 1--

--definición interna--
{- HLINT ignore "Redundant bracket" -}
{- HLINT ignore "Use foldr" -}
newtype Array a = Arr ([a] , Int) deriving Show

--funciones--  
array :: a -> Int -> Array a
array x 0 = Arr ([], 0)
array x n = Arr ((arrlist x n), n)

-- (x:xs) Arr
-- i = indice , n = tamaño
-- 0 <=i < n
-- Ej, array 0 10 , crea un array de 10 posiciones con valores iniciales 0

--función aux.
arrlist :: a -> Int -> [a]
arrlist x 0 = []
arrlist x n = x : (arrlist x (n-1))

fromList:: [a] -> Array a -- Crea una array del tamaño adecuado a partir de los valores almacenados en la lista dada
fromList [] = Arr ([], 0)
fromList lista = Arr (lista, l)
                  where l = largo lista

--función aux.
largo :: [a] -> Int
largo [] = 0
largo (x:xs) = (1 + largo xs)