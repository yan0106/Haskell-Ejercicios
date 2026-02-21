-- Diccionario TDA (con Listas)

-- Para exportar:
module Diccionario (Diccionario, nuevoDicc, insertarDicc, buscarDicc, eliminarDicc, esVacio) where

-- Definición interna
newtype Diccionario a = Dicc [a] deriving Show

-- Funciones
-- Crear
nuevoDicc :: Diccionario a
nuevoDicc = Dicc []

-- Insertar
insertarDicc :: (Ord a)=> a -> Diccionario a -> Diccionario a
insertarDicc x (Dicc lista) = Dicc (insAux x lista) -- el trabajo lo hace la func. aux., luego se encapsula con Dicc
-- inserta un elemento de forma ordenada (y no duplicada), utilizando la función auxiliar: insAux

-- función auxiliar 
insAux :: (Ord a) => a -> [a] -> [a]
insAux x [] = [x]
insAux x (y:ys)
    | x == y    = y:ys
    | x < y     = x:y:ys
    | otherwise = y : insAux x ys

-- Buscar
buscarDicc :: (Ord a)=> a -> Diccionario a -> Bool
buscarDicc x (Dicc []) = False
buscarDicc x (Dicc (y:ys))
    | x == y = True
    | x < y = False -- como la lista está odenada, si x es menor al primer elemento, entonces no está en la lista
    | otherwise = buscarDicc x (Dicc ys) -- en cualquier otro caso, sigue buscando

-- Eliminar
eliminarDicc :: (Ord a)=> a -> Diccionario a -> Diccionario a
eliminarDicc x (Dicc lista) = Dicc (elimAux x lista)


-- func. auxiliar
elimAux :: (Ord a)=> a -> [a] -> [a]
elimAux x [] = []
elimAux x (y:ys)
    | x == y = ys
    | x < y  = y:ys
    | otherwise = y: elimAux x ys

-- Consultar si está vacío
esVacio :: Diccionario a -> Bool
esVacio (Dicc []) = True
esVacio (Dicc _)  = False