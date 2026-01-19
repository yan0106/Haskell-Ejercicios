--Práctica 1:
--1.a)
five :: a -> Int -- el resultado Int es más rígido
five x = 5

fiveProfe :: Num a => b -> a -- resolución del profesor, más genérica y flexible. Resultado a de clase Num
fiveProfe x = 5 

--b)
apply :: (a -> b) -> a -> b
apply f x = f x -- aplica la función f a x, es decir f(x), pero se escribe sin paréntesis


