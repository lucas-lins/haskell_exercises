{- ~~~~~~~~~~~~~~~~~~~~~~~~~ Enunciado Questão 1 Paradigmas ~~~~~~~~~~~~~~~~~~~~~~~~~

Blockchain é basicamente um banco de dados distribuído onde os dados são armazenados em blocos onde cada 
bloco possui transações financeiras e uma referência para o próximo bloco formando uma corrente. Assumindo 
os tipos de dados abaixo, crie uma função em Haskell que dado um Bloco retorna uma tupla-2 onde o primeiro 
elemento é a conta que transferiu a maior quantidade de dinheiro (soma das transações) e o segundo elemento 
a conta que recebeu a maior quantidade de dinheiro (soma das transações) considerando todas as transações da 
cadeia de blocos.

data Transacao = Transacao { de :: String -- Conta que paga

                                                , para :: String -- Conta que recebe

                                                 , valor :: Float -- Quanto está pagando

                                                } deriving (Show)

data Bloco = Bloco { indice :: Int -- Indice do bloco

                                 , trs :: [Transacao] -- Lista de transações de um bloco

                                 , proximo :: Maybe Bloco -- Proximo bloco

                                 } deriving (Show)

OBS: para definir um valor do tipo bloco é só especificar (Bloco ind trs prox), onde ind é um inteiro, trs
 é uma lista de transações e prox é um Maybe Bloco. O mesmo se aplica ao tipo Transacao.

   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Fim do Enunciado ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -}

data Transacao = Transacao { de :: String , para :: String , valor :: Float } deriving (Show)

data Bloco = Bloco { indice :: Int , trs :: [Transacao] , proximo :: Maybe Bloco} deriving (Show)

contaOrigem (Transacao de para valor) = de        --Retorna conta de origem
contaDestino (Transacao de para valor) = para     --Retorna conta de destino
valorTransac (Transacao de para valor) = valor    --Retorna valor da transacao

indBloco (Bloco indice trs prox) = indice         --Retorna indice do bloco
trsBloco (Bloco indice trs prox) = trs            --Retorna a lista de transacoes do bloco
proxBloco (Bloco indice trs prox) = prox          --Retorna o prox bloco


juntaBlocos :: Bloco -> [Transacao]
juntaBlocos (Bloco {indice=i, trs=t, proximo=Nothing}) = t
juntaBlocos (Bloco {indice=i, trs=t, proximo=(Just p)}) = t ++ juntaBlocos p

filtraContaOrigem :: String -> [Transacao] -> Float
filtraContaOrigem nome [] = 0.0
filtraContaOrigem nome (t:ts) | contaOrigem t == nome = valorTransac t + (filtraContaOrigem nome ts)
                              | otherwise = filtraContaOrigem nome ts

filtraContaDestino :: String -> [Transacao] -> Float
filtraContaDestino nome [] = 0.0
filtraContaDestino nome (t:ts) | contaDestino t == nome = valorTransac t + (filtraContaDestino nome ts)
                               | otherwise = filtraContaDestino nome ts






