--5) Definir una función que determine si un año es bisiesto o no, de acuerdo a la siguiente definición:
{- año bisiesto 1. m. El que tiene un día más que el año común, añadido al mes de febrero. Se
repite cada cuatro años, a excepción del último de cada siglo cuyo número de centenas no
sea múltiplo de cuatro. (Diccionario de la Real Academia Española, 22° ed.) -}
--Cuál es el tipo de la función definida?

anioBisiesto :: Int -> Bool
anioBisiesto x
    | x `mod` 400 == 0 = True -- para poner mod entre medio de dos operandos, usar `` (comillas invertidas)
    | x `mod` 100 == 0 = False
    | x `mod` 4 == 0 = True -- condición más general
    | otherwise = False
-- se ordenan las guardas (condiciones) de la más específica (excepción de la excepción) a la más gral. porque
-- se evalúan en orden.
