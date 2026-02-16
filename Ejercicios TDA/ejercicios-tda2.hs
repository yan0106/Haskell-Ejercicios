{- Ejercicio para el lector: A los efectos de practicar la manipulación de árboles, escribir las funciones
inOrder, preOrder y postOrder que realizan un listado de los elementos del árbol, en Orden, Pre Orden y Post Orden
respectivamente. Y que poseen la siguiente definición de tipo:
inOrder :: (Ord a)=> Bintree a -> [a]
-}

{- Nota: 
Pre-Order: La raíz va antes (Pre) que los hijos. (Primero yo, después mis hijos).
In-Order: La raíz va entre (In) los hijos. (Primero el izquierdo, después yo, después el derecho). Esto devuelve la lista ordenada de menor a mayor.
Post-Order: La raíz va después (Post) que los hijos. (Primero mis hijos, al final yo). 
-}

-- definición
data Bintree a = EmptyBT | NodoBT a (Bintree a) (Bintree a) deriving Show -- árbol binario de tipo genérico 'a'

-- funciones:

-- creación
mkNewTree :: (Ord a)=> Bintree a
mkNewTree = EmptyBT -- usa el constructor EmptyBT para crear un nuevo árbol vacío

-- búsqueda
inTree :: (Ord a)=> a -> Bintree a -> Bool 
inTree x EmptyBT = False
inTree x (NodoBT y lf rt) -- nodo y, lf = sub-árbol izquierdo, rt = sub-árbol derecho
    | x == y = True
    | x < y = inTree x lf -- si x es menor que y entonces sigo buscando recursivamente en el sub-árbol izquierdo
    | x > y = inTree x rt -- si x es mayor que y entonces sigo buscando recursivamente en el sub-árbol derecho

-- insertar
addTree :: (Ord a)=> a -> Bintree a -> Bintree a
addTree x EmptyBT = NodoBT x EmptyBT EmptyBT -- caso base: agrega x como nodo y dos sub-árboles vacíos
addTree x (NodoBT y lf rt) 
    | x == y  = NodoBT y lf rt -- si x == y, no lo puede agregar, devuelve el mismo árbol
    | x < y   = NodoBT y (addTree x lf) rt -- si x < y, devuelve el nodo y, agrega recursivamente x en lf y rt queda igual
    | x > y   = NodoBT y lf (addTree x rt) -- si x > y, devuelve el nodo y, el sub-árbol izquierdo igual y agrega recursivamente x a rt

-- ordenar
inOrder :: (Ord a)=> Bintree a -> [a]
inOrder EmptyBT = [] -- caso base
inOrder (NodoBT y lf rt) = inOrder lf ++ [y] ++ inOrder rt
{- Primero recorro todo lo que hay a la izquierda. Porque la izquierda no es un solo número, es todo un árbol!
Después visito la raíz [y].
Al final recorro todo lo que hay a la derecha, porque también es un árbol -}

preOrder :: (Ord a)=> Bintree a -> [a]
preOrder EmptyBT = []
preOrder (NodoBT y lf rt) = [y] ++ preOrder lf ++ preOrder rt

postOrder :: (Ord a)=> Bintree a -> [a]
postOrder EmptyBT = []
postOrder (NodoBT y lf rt) = postOrder lf ++ postOrder rt ++ [y]

-- eliminar
-- func. auxiliar
minTree :: (Ord a)=> Bintree a -> (a, Bintree a)
minTree (NodoBT v EmptyBT rt) = (v,rt) -- Caso base: voy todo lo más a la izquierda que puedo, entonces lf queda vacío.
-- si el sub-árbol izq es EmptyBT, significa que llegué al fondo y v es el mínimo.
-- rt, es el árbol que queda dsps de arrancar ese valor
minTree (NodoBT v lf rt) = let (x, new_lf) = minTree lf
                           in (x, NodoBT v new_lf rt) -- devuelve el minimo x, y reconstruye el árbol nuevo. Ya no tiene
-- más lf, ahora tiene new_lf


