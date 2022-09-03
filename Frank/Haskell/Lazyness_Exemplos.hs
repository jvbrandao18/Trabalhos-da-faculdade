module Main where

import Data.Char

{-
Na verdade a gente já viu um pouco de laziness em: 
foldl (+) 0 [1,2,3]
    = foldl (+) (0+1) [2,3]
    = foldl (+) ((0+1)+2) [3]
    = foldl (+) (((0+1)+2)+3) []
    = (((0+1)+2)+3)
    = ((1+2)+3)
    = (3+3)
    = 6
-}
{-
  Outro exemplo usando take 3 [1..999999999999999999] vai devolver [1, 2, 3]

  vamos substituir [1..999999999999999999] por uma função

criaLista :: Int -> Integer -> [Integer]
criaLista x y = if x > y then [] else x:(criaLista (x+1) y)

  E chamar take 3 (criaLista 1 999999999999999999) teremos

take 3 (criaLista 1 999999999999999)
take 3 (1:(criaLista 2 999999999999999))
1:(take 2 (criaLista 2 999999999999999))
1:(take 2 (2: (criaLista 3 999999999999999)))
1:2:(take 1 (criaLista 3 999999999999999))
1:2:(take 1 (3: (criaLista 4 999999999999999)))
1:2:3:(take 0 (criaLista 4 999999999999999))
1:2:3:[]

  Ou seja a lista nunca será criada, vamos criar apenas os elementos que precisamos
-}

--cuidado com laziness!!!!!
adicao :: Int -> Int -> Int
adicao x y = x+y

crivo :: [Int] -> [Int]
-- usando list comprehension.... essa barra lê-se como tal que
crivo (p : xs) = p : crivo [x | x <- xs, x `mod` p /= 0]

crivo2 :: [Int] -> [Int]
crivo2 (p : xs) = p : crivo2 (filter (\x -> x `mod` p /= 0) xs)


numerosPrimos1 n = take n $ crivo [2..]
numerosPrimos2 n = take n $ crivo2 [2..]
{-
No estudo dos números um número n qualquer será chamado de Número de Armstrong se ele for
igual a soma dos seus digitos elevados a potencia igual ao número de dígitos. 

1  
153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
370 = 3^3 + 7^3 + 0^3 = 27 + 343 + 0 = 370
371 = 3^3 + 7^3 +  1^3 = 371
407 = 4^3 +  0^3 +  7^3 = 407
-}
somaDeArmstrong :: Int -> Int
somaDeArmstrong n = foldl (\acc char -> acc + digitToInt char^len ) 0 $ show n
  where len = length (show n)

-- definindo um predicado para usar no filtro
ehArmstrong :: Int -> Bool
ehArmstrong n = somaDeArmstrong n == n

numerosDeArmstrong :: Int -> [Int]
numerosDeArmstrong n = take n $ filter ehArmstrong [0..]

-- outro número de Armstrong
digits :: Integral a => a -> [a]
digits 0 = []
digits x = (x `mod` 10) : digits (x `div` 10)

armstrong :: Integral a => a -> Bool
armstrong n = sum (map (^ length ds) ds) == n
  where ds = digits n


-- se for necessário podemos forçar strict
somaDireta :: Num a => [a] -> a
somaDireta = go 0
  where go acc []     = acc
        go acc (x:xs) = acc `seq` go (x + acc) xs

-- seq :: a -> b -> b. Neste caso teremos: 
{-
somaDireta [1,2,3,4]
  go 0 [1,2,3,4]
  go (1 + 0) [2,3,4]
  go (2 + 1) [3,4]
  go (3 + 3) [4]
  go (4 + 6) []
  (4 + 6)
  10
-}

main = do
  putStrLn "\n\n"
  print (adicao 10 5)
  --print (adicao 10 ((/) 5 0))
  putStrLn "\n\nLista de Número de Armstrong"
  print (numerosDeArmstrong 23)
  putStrLn "\n\nOutra Lista de Número de Armstrong"  
  print (numerosDeArmstrong 22)
  putStrLn "\n\nCrivo de Eratóstenes"  
  print (numerosPrimos1 100)
  putStrLn "\n\nOutro Crivo de Eratóstenes"  
  print (numerosPrimos2 100)
  putStrLn "\n\nEstes crivos são iguais?"  
  print (if (numerosPrimos1 100) == (numerosPrimos2 100) then "Sim" else "Não")

  putStrLn "\n\nSoma Direta"  
  print (somaDireta [1, 2, 3, 4])