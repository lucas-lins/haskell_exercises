{- ~~~~~~~~~~~~~~~~~~~~~~~~~ Enunciado Questão 2 Paradigmas ~~~~~~~~~~~~~~~~~~~~~~~~~

Um país deseja criar um protocolo de vacinação que informa a quantidade de meses para uma pessoa tomar a vacina de acordo com 3 fatores:

- idade.
- presença de comorbidades
- se é profissional de saúde.

As regras são:

a) caso seja profissional de saúde, o seu mês será 1. 

b) pessoas acima de 70 anos também são vacinadas no mês 1. 

c) abaixo de 70 anos, a cada cinco anos aumenta-se a quantidade de meses. Assim, pessoas entre 65 e 70 (incompletos) são o mês 2,
   entre 60 e 65 são no mês 3, e assim por diante. 

d) caso a pessoa tenha comorbidade, seu mês de referência é reduzido em uma posição, com o mínimo sendo o mês 1.

Assim, crie uma função em Haskell que recebe uma tupla de três elementos (Int, Bool, Bool) representando uma pessoa, onde o primeiro
elemento é a idade, o segundo é um booleano informando se a pessoa tem comorbidade e o terceiro é um booleano informando se a pessoa
é profissional de saúde, e deve retornar a quantidade de meses que a pessoa deverá esperar para ser vacinada.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Fim do Enunciado ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -}




{- A função abaixo "vacina" é a função principal que deve ser invocada no GHCI passando como parâmetro:
   Int idade, Bool Comorbidade, Bool ProfissionalSaude  -}

vacina :: (Int, Bool, Bool) -> Int
vacina (a, b, c) | c == True = 1                                        -- Define que caso seja da área da saúde, obrigatoriamente se vacina no mês 1
                 | a >= 70   = 1                                        -- Define que caso tenha 70 anos ou mais, obrigatoriamente se vacina no mês 1
                 | a <  70   = 1 + indice (div a 5) + comorbidade b     -- Com auxílio das funções auxiliares abaixo, define o restante dos casos

-- O valor de índice será incrementado ao retorno da função, oq faz que a cada 5 anos haja um mês a mais. Caso haja comorbidade, 1 mês será decrementado do retorno.



{- A função "indice" abaixo serve como auxiliar para a função principal. O seu funcionamento permite que haja uma associação
   entre a divisão da idade por 5 e a quantidade de meses a mais que a pessoa vai se vacinar. O valor de saída se refere a quantidade
   de meses que serão incrementados no resultado final. Por exemplo: idade = 64,  64/5 = 12
   Ao passar pela função indice: indice 12 = 14-12 = 2. Logo dois meses serão incrementados a 1 na função vacina -}
 
indice :: Int -> Int
indice 1 = 14-1
indice n = 14-n 



{- A função "comorbidade" abaixo serve como auxiliar para a função principal. Nela eu associo True e False aos valores -1 e 0
   respectivamente. Isso é necessário pois quando a função comorbidade for invocada pela função vacina, caso bool comorbidade
   no segundo elemento da tupla seja True, um mês será decrementado do resultado. Caso seja False, nada se altera.   -}

comorbidade :: Bool -> Int
comorbidade True = -1
comorbidade False = 0