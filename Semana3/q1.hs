{- ~~~~~~~~~~~~~~~~~~~~~~~~~ Enunciado Questão 1 Paradigmas ~~~~~~~~~~~~~~~~~~~~~~~~~

   Suponha que precisamos calcular 2 elevado a um número n.

   Se n é par, por exemplo 2*m, então: 2^n = 2^(2*m) = (2^m)^2

   Se n é ímpar , por exemplo 2*m+1, então: 2^n = 2^(2*m+1) = ((2^m)^2)*2

   Desta forma, crie uma função recursiva "eleva2:: Int -> Int" que computa 2 elevado
   a um número n usando estas ideias e sem usar o operador de potência de Haskell (^).

   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Fim do Enunciado ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -}


{- A função "eleva2" abaixo é a principal que deve ser invocada no GHCI. O parâmetro que
   deve ser passado é o valor do expoente desejado. Como pedido no enunciado, ela primeiro
   verifica se o número é par ou não e procede respectivamente as operações dadas.  -}

eleva2 :: Int -> Int
eleva2 0 = 1
eleva2 1 = 2
eleva2 n | ePar n    =  potencia (potencia 2 (radical n)) (2)            -- Se for par, calcula (2^m)^2 como pede o enunciado
         | otherwise = (potencia (potencia 2 (radical n)) (2)) * (2)     -- Se for ímpar, calcula ((2^m)^2)*2 como pede o enunciado



{- A função "radical" tem o objetivo de encontrar o "m" de um número, como está no enunciado.
   Por exemplo, 6 pode ser escrito como 2*m, sendo m = 3. É pra isso que essa função serve.
   Ela auxilia a principal para que o valor de m seja usado nos calculos pedidos.   -}

radical :: Int -> Int
radical m | ePar m = div m 2             -- Caso seja par, calcula m/2 para encontrar o "radical"
          | otherwise = div (m-1) 2      -- Caso seja ímpar, calcula (m-1)/2 para encontrar o "radical"



{- A função "potencia" abaixo é bem intuitiva e tem como objetivo fazer o cálculo de potências
   através da recursão sem a necessidade de usar o operador "^". Ela auxilia a principal   -}

potencia :: Int -> Int -> Int
potencia base exp | base == 0 = 0                                       -- 0 elevado a e = 0
                  | base == 1 = 1                                       -- 1 elevado a e = 1
                  | exp == 0 = 1                                        -- b elevado a 0 = 1
                  | exp == 1 = base                                     -- b elevado a 1 = b
                  | otherwise = base * potencia base (exp - 1)          -- b elevado a e = b * b ^ (e-1)



{- A função "ePar" serve para verificar se o número de entrada é par ou não. Se for par retorna True
   e se for ímpar retorna False. Eu escrevi essa função pois não sabia se podia usar a função "even"
   que já existe, então fiz minha própria    -}

ePar :: Int -> Bool
ePar n | mod n 2 == 0 = True            -- Se a divisão de n por 2 for  = 0, então é True
       | mod n 2 /= 0 = False           -- Se a divisão de n por 2 for /= 0, então é False


