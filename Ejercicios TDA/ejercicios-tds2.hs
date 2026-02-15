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

