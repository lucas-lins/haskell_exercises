{- dá pra criar "novos tipos" e dizer os seus possíveis estados -}

data Estacao = Inverno | Verao | Primavera | Outono deriving (Show)
data Temperatura = Frio | Quente deriving (Show)

clima :: Estacao -> Temperatura
clima Inverno = Frio
clima _ = Quente


{- é possível criar "sinônimos", como no exemplo em que Nome é um tipo
   que funciona como String. -}

type Nome = String
type Idade = Int
type Pessoas = (Nome, Idade)

mostraPessoa :: Pessoas -> String
mostraPessoa (n, i) = n ++ "-" ++ (show i)

{- como alternativa dá pra criar um tipo -}
data Humano = Pessoa Nome Idade

mostraHumano :: Humano -> String
mostraHumano (Pessoa n i) = "Nome: " ++ n ++ " - Idade: " ++ (show i)

data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float

area :: Forma -> Float
area (Circulo r) = (pi*r)^2
area (Retangulo b a) = b*a
area (Triangulo b a) = (b*a)/2

data ArvoreBin t = NilArv | No t (ArvoreBin t) (ArvoreBin t) deriving (Show)

-- data Either a b = Left a | Right a
-- Ele vai retornar ou o valor da direita ou da esquerda

-- data Maybe t = Nothing | Just t