--Aprendendo funções alta ordem

duasVezes :: (a -> a) -> a -> a
duasVezes f x = f (f x)

dobra :: Int -> Int
dobra x = 2*x

triplica :: Int -> Int
triplica x = 3*x

mult :: Int -> (Int -> Int)
mult x y = x*y

mult10 :: Int -> Int
mult10 z = (mult 10) z

cuboLista :: [Int] -> [Int]
cuboLista xs = map (\x -> (x^3)) xs

filtraPares :: [Int] -> [Int]
filtraPares xs = filter even xs

somaLista l = foldr1 (+) l