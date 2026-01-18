--Escribí funciones que:
--a. Devuelvan el primer elemento de una lista no vacía
--b. Devuelvan True si una lista está vacía y False en caso contrario
--c. Cuenten cuántos elementos tiene una lista (sin usar length)
--d. Dado un par (x,y) devuelva y
--e. Dada una tupla (Int, Int), devuelva la suma de sus componentes

--a)
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use guards" #-}
{-# HLINT ignore "Use foldr" #-}
primero :: [a] -> a -- lista con tipo genérico
primero (x:xs) = x -- formato para listas

--b)
listaVacia :: [a] -> Bool -- recibe una lista y devuelve un Bool
listaVacia [] = True --[] lista vacía
listaVacia (x:xs) = False --(x:xs) lista con almenos un elemento

--c)
contar :: [a] -> Int
contar [] = 0
contar (x:xs) = 1 + contar xs -- uso recursión hasta llegar a [], al contar va quitando elementos de la lista

--d
segundo :: (a, b) -> b --tupla genérica con dos elementos que pueden ser de distinto tipo. Devuelve el segundo tipo
segundo (x,y) = y

--e
suma :: (Int, Int) -> Int
suma (x,y) = x + y

---------------------------------------------------------------------------------------
--Pensá un ejemplo de una función cuyo tipo sea:
--a. Int -> Bool
--b. Char -> Int
--c. [a] -> Bool

--a)
verdadero :: Int -> Bool
verdadero 1 = True
verdadero 0 = False

--b)
valor :: Char -> Int
valor 'a' = 97
valor 'b' = 98 

--c)
listaNueva :: [a] -> Bool
listaNueva [] = False
listaNueva (_:_) = True

----------------------------------------------------------------------------------------------------
--Definí una función que reciba un número y devuelva una función que sume ese número a otro:

sumaC :: Int -> Int -> Int
sumaC x y = x + y

------------------------------------------------------------------------------------------
--Escribí una función polimórfica que reciba dos valores y devuelva el primero:

valorPrimero :: (a, b) -> a
valorPrimero (x,_) = x

--también puede ser con esta forma de función currificada
valor1ro :: a -> b -> a
valor1ro x y = x

--------------------------------------------------------------------------------------
--Escribí una función que: reciba un número y devuelva "positivo" o "negativo"

signoNum :: (Num a, Ord a) => a -> String -- necesito que el tipo 'a' sea de la clase Num y Ord (para ordenar/comparar)
signoNum x = 
    if x > 0 then "Positivo" -- '>' no viene de Num, viene de Ord
    else if x == 0 then "Cero" 
    else "Negativo" 

------------------------------------------------------------------------------------
--Definí una función que: devuelva True si un Bool es True, y False en el otro caso (usando pattern matching)

esVerdadero :: Bool -> Bool
esVerdadero True = True
esVerdadero False = False
