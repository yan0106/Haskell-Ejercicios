--4)
{- Suponiendo que f y g tienen los siguientes tipos:
f :: c -> d
g :: a -> b -> c
y sea h definida como:
h x y = f (g x y)
Determinar el tipo de h 

e indicar cuáles de las siguientes definiciones de h son equivalentes a la
dada:
h = f . g
h x = f . (g x)
h x y = (f . g) x y

Cuál es el tipo de la función ( . )? -}

--Respuestas:
{- Tipo de h:
1° g : *Entra a (x), *Entra b (y) -> c
2° f (c) -> Sale d
Si unimos todo (lo que entra y lo que sale, menos c que ocurre en el medio):
h :: a -> b -> d 

Definición equivalente a h:
h x = f . (g x)
Porque primero aplico x a g (devuelve una funcion b -> c), y el resultado que espera y (espera b y devuelve c) 
se puede conectar con f que recibe c.

Tipo de la función (.) composición :
(.) :: (b -> c) -> (a -> b) -> a -> c
-}

