-- Merge Sort

split :: (Ord a)=> [a] -> ([a],[a])
split [] = ([],[])
split [x] = ([x],[])
split (x:y:t) = (x:m, y:n)
                where (m,n) = split t

merge :: (Ord a)=> [a] -> [a] -> [a]
merge [] [] = []
merge a [] = a
merge [] b = b
merge (x:xs) (y:ys) = if x < y then x: merge xs (y:ys)
                      else y : merge (x:xs) ys

msort :: (Ord a)=> [a] -> [a]
msort [] = []
msort [x] = [x]
msort lista = merge izqOrd derOrd 
            where (izq, der) = split lista
                  izqOrd = msort izq
                  derOrd = msort der
                   
        
