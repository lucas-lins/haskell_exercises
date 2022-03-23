{- ~~~~~~~~~~~~~~~~~~~~~~~~~ Enunciado Questão 1 Paradigmas ~~~~~~~~~~~~~~~~~~~~~~~~~

Utilizando a linguagem funcional Haskell, defina uma função que recebe uma lista de listas de elementos de 
um tipo t (genérico) e retorna uma lista de tuplas-2 onde o primeiro elemento é um valor do tipo t que existe
em pelo menos uma das sub-listas da entrada e o segundo é o número de ocorrências desse valor nas sub-listas.

Exemplos: contaOcorr ["haskell","eh","legal"] -> [('h',2),('a',2),('s',1),('k',1),('e',3),('l',4),('g',1)]

contaOcorr [[2,45,6,2,1],[7,7,4,3,2]] -> [(2,3),(45,1),(6,1),(1,1),(7,2),(4,1),(3,1)]

   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Fim do Enunciado ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -}

{- Esta é a função principal que deve ser invocada no GHCI. Como parâmetros podem ser passados
   listas de listas, como no exemplo do enunciado    -}
contaOcorr [] = []
contaOcorr x = montaTuplas (juntaListas x)


--O objetivo dessa função é filtrar e retirar os elementos repetidos de uma lista e retorna uma nova lista sem as repetições
filtraRep [] = []
filtraRep (x:xs) = x : (filtraRep (filter(/=x) xs))


--Essa função conta as repetições e cria uma nova lista com as quantidades de repetições de cada elemento
contaRep [] = []
contaRep (x:xs) = 1 + (length (filter(== x) xs)) : (contaRep [ y | y <- xs, y/=x ])  


--Essa função monta as tuplas dos elementos e quantidade de repetições
montaTuplas [] = []
montaTuplas x = zip (filtraRep x) (contaRep x)


--Essa função recebe a lista de listas e transforma numa lista só
juntaListas [] = []
juntaListas (x:xs) = x ++ juntaListas xs