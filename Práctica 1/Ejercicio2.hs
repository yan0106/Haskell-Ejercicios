--2)
--a)
aplicarTres :: (Int -> Int) -> Int
aplicarTres f = f 3 -- la f es solo una variable, no digo qué hace f. En la consola la uso y declaro.
-- para f, se pueden usar nombres de funciones que ya existen en Haskell como 'succ', por ejemplo.

sumaDeF :: (Int -> Int) -> Int
sumaDeF f = f 4 + f 5

--b)
suma :: Int -> (Int -> Int) -- es lo mismo que Int -> Int -> Int, porque asocia a la derecha
suma x y = x + y

mult :: Int -> (Int -> Int)
mult x y  = x * y

--c)
transformador :: (Int -> Int) -> (Int -> Int) -- recibe una f y un número que devuelve otro número
transformador f x = f x + 5

composicion :: (Int -> Int) -> (Int -> Int)
composicion f x = f (f x) -- le aplico dos veces f a x

--d)
esPositivo :: Int -> Bool
esPositivo x
    | x >= 0 = True
    | x < 0 = False

esCero :: Int -> Bool
esCero x = x == 0

--e)
myAnd :: Bool -> (Bool -> Bool)
myAnd x y
    | x && y = True
    | otherwise = False

myOr :: Bool -> (Bool -> Bool)
myOr x y
    | x || y = True
    | otherwise = False

--f)
esVerdadero :: (Int, Char) -> Bool
esVerdadero (x, y)
    | x == 1 && y == 'a' = True
    | otherwise = False

esZeta :: (Int, Char) -> Bool
esZeta (_, y) = y == 'z'

--g)
sumaTupla :: (Int, Int) -> Int
sumaTupla (x, y) = x + y

multiTupla :: (Int, Int) -> Int
multiTupla (x, y) = x * y

--h)
devuelveTupla :: Int -> (Int, Int)
devuelveTupla x = (x, 10)

duplicaTupla :: Int -> (Int, Int)
duplicaTupla x = (x, x*2)

--i)
constanteTrue :: a -> Bool
constanteTrue x = True

constanteFalse :: a -> Bool
constanteFalse x = False

--j)
funcionIdentidad :: a -> a
funcionIdentidad x = x

miEspejo :: b -> b
miEspejo n = n


