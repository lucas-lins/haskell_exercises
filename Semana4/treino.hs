teste :: Int -> String
teste a = "Oi eu sou Goku"

teste2 :: String -> Char 
teste2 (x:xs) = x

teste3 :: String -> Char
teste3 a = a !! 2 

{-
last (retorna ultimo elemento)
head (retorna primeiro elemento)
tail (retorna td dps do primeiro)
(x:xs) !! n (retorna o n elemento da lista)
reverse (retorna a lista ao contrário)
maximum (retorna o maior elemento)
minumum (retorna o menor elemnto)
elem n (Verifica se n existe na lista e retorna booleano)
-}

somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (x:xs) = x + somaLista xs

somaLista2 :: [Int] -> Int
somaLista2 [] = 0
somaLista2 l = head l + somaLista2 (tail l)

maiorElem :: [Int] -> Int
maiorElem [a] = a
maiorElem (x:xs) | x > maiorElem xs = x
                 | otherwise = maiorElem xs

dobraLista :: [Int] -> [Int]
dobraLista [] = []
dobraLista (x:xs) = (2*x):(dobraLista xs)

dobraPares :: [Int] -> [Int]
dobraPares l = [ 2*x | x <- l, (mod x 2) == 0 ]








