{- ~~~~~~~~~~~~~~~~~~~~~~~~~ Enunciado Questão 1 Paradigmas ~~~~~~~~~~~~~~~~~~~~~~~~~

Utilizando a linguagem funcional Haskell, defina uma função que recebe uma lista de inteiros e deve
retornar uma lista de tuplas-2 onde o primeiro elemento é igual ao número da lista e o segundo é a
soma dos dígitos deste número. No entanto, a lista resultante deve conter apenas tuplas nas quais o
primeiro elemento é um múltiplo do segundo.

Exemplos: digitosDeMultiplos [5,12,71,8,25,3,150] -> [(5,5),(12,3),(8,8),(3,3),(150,6)]
digitosDeMultiplos [98,24,81,7773,21,1000] -> [(24,6),(81,9),(21,3),(1000,1)]

   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Fim do Enunciado ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -}


-- Essa função recebe um inteiro e retorna a soma de seus dígitos
somaDigitos :: Int -> Int
somaDigitos 0 = 0
somaDigitos n = (mod n 10) + somaDigitos (div n 10)

-- De um Int cria uma tupla cujo 1º elemento é n e o 2º é a soma dos dígitos de n
criaTupla :: Int -> (Int, Int)
criaTupla n = (n, somaDigitos n)

-- Verifica se o primeiro elemento da tupla é multiplo do segundo
multiplo :: (Int, Int) -> Bool
multiplo (a, b) | (mod a b == 0) = True 
                | otherwise = False


{- Esta é a função principal que deve ser invocada no GHCI, deve ser passado como
   parâmetro uma lista de Inteiros -}
digitosDeMultiplos :: [Int] -> [(Int, Int)]
digitosDeMultiplos xs = [(criaTupla n) | n <- xs , multiplo (criaTupla n) == True]