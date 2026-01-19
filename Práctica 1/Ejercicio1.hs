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

--e) 'derive', aproxima la derivada de una función dada en un punto dado:
derive :: (Float -> Float) -> Float -> Float
derive f x = (f (x + h) - f x ) / h
    where h = 0.0001
-- Nota: se puede probar la función con: (\x -> x * x) 3, sería la f derivada de x^2 en el punto x=3.
-- usa '\' porque es el símbolo matemático para escribir funciones

--f)
sign :: (Ord a, Num a) => a -> a
sign x  
    | x > 0 = 1
    | x < 0 = -1
    | otherwise = 0

--g)
valorAbs :: (Ord a, Num a) => a -> a
valorAbs x = x * sign x -- usando sign

valorAbs2 :: (Ord a, Num a) => a -> a
valorAbs2 x   -- sin usar sign --
    | x > 0 = x
    | x < 0 = x * (-1)
    | otherwise = 0 

--h) 'pot', toma un entero y un número, y devuelve el resultado de elevar el segundo a la potencia dada por el primero
pot :: Int -> Int -> Int
pot x n = n^x

--i)
--Rta1:
xor :: Bool -> Bool -> Bool
xor x y 
    | x == True && y == False = True -- x == True, se puede simplificar como simplemente x
    | x == False && y == True = True
    | otherwise = False

--Rta2:
xor2 :: Bool -> Bool -> Bool
xor2 x y = if x /= y then True else False -- se puede simplificar como: x /= y , esto ya devuelve por si solo un Bool

--j)
max3 :: Int -> Int -> Int -> Int
max3 x y z 
    | x >= y && x >= z = x
    | y >= x && y >= z = y
    | otherwise = z

--k)
swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

