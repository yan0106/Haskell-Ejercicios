import qualified GHC.TypeLits as 3
--Práctica 1:
--1.a)
five :: a -> Int -- el resultado Int es más rígido
five x = 5

fiveProfe :: Num a => b -> a -- resolución del profesor, más genérica y flexible. Resultado 'a' de clase Num
fiveProfe x = 5 

--b)
apply :: (a -> b) -> a -> b
apply f x = f x -- aplica la función f a x, es decir f(x), pero se escribe sin paréntesis

--c)
myId :: a -> a -- id es una función que ya viene programada en Haskell
myId x = x

--d)
first :: (a, b) -> a
first (x, _) = x

--e) derive, aproxima la derivada de una función dada en un punto dado
derive :: (Float -> Float) -> Float -> Float
derive f x = (f (x + h) - f x ) / h
    where h = 0.0001
-- Nota: se puede probar la función con: (\x -> x * x) 3, sería la f derivada de x^2 en el punto x=3.
-- usa '\' porque es el símbolo matemático para escribir funciones