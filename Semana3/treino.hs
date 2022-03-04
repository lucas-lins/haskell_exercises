import Data.Char

quadrado :: Int -> Int
quadrado x = x*x

igualdade :: Int -> Int -> Int -> Bool
igualdade a b c = (a==b) && (b==c)

maiorNum :: Int -> Int -> Int
maiorNum a b | a == b = a
             | a > b = a
             | a < b = b

maiorNum2 a b c | ((a>b)||(a==b)) && ((a>c)||(a==c)) = a
                | ((b>a)||(b==a)) && ((b>c)||(b==c)) = b
                | ((c>a)||(c==a)) && ((c>b)||(c==b)) = c

-- exemplo casamento de padrão
golsCamisa :: Int -> Int
golsCamisa 8 = 2
golsCamisa 9 = 4
golsCamisa 10 = 6
golsCamisa 11 = 8

totalGols :: Int -> Int
totalGols 8 = golsCamisa 8
totalGols n = golsCamisa n + totalGols(n-1)

{-  fat :: Int −> Int que calcula o fatorial de um 
    inteiro dado como argumento -}

fat :: Int -> Int
fat 0 = 0
fat 1 = 1
fat n = n * fat(n-1)

{- all4Equal :: Int −> Int −> Int −> Int −> Bool que compara se
   quatro valores inteiros são iguais  -}

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal a b c d = (a==b) && (b==c) && (c==d)

{-  equalCount :: Int −> Int −> Int −> Int que retorna quantos
    argumentos são iguais -}

equalCount :: Int -> Int -> Int -> Int
equalCount a b c | (a==b) && (b==c) = 3
                 | (a/=b) && (b/=c) = 0
                 | otherwise = 2















