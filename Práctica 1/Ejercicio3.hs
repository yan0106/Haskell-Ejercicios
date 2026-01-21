--3) Reescribir las siguientes definiciones sin usar let, where o if:
--a) f x = let (y,z) = (x,x) in y -- let funciona como asignación temporal
funcionA :: a -> a
funcionA x = x

--b) greater (x,y) = if x > y then True else False
funcionB :: Ord a => (a, a) -> Bool
funcionB (x, y) = x > y

--c) f (x,y) = let z = x + y in g (z,y) where g (a,b) = a - b
funcionC :: (a, b) -> a
funcionC (x, y) = x
