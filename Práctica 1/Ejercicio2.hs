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
composicion f x = f(f(x))