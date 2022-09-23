--João Vitor Brandão
--BCC - 23/09/2022
--Programação Funcional - Frank Coelho de Alcantara

--1. Usando List Comprehension escreva uma função, chamada divisoresden, que devolva uma lista dos divisores de um número dado.
divisoresden :: Int -> [Int]
divisoresden n = [x | x <- [1..n], n `mod` x == 0]

{-
2. Usando List Comprehension escreva uma função, chamada contaCaractere, que conte a ocorrência de um caractere específico, em uma string dada.
-}
contaCaractere :: Char -> String -> Int
contaCaractere c s = length [x | x <- s, x == c]

{-
3. Usando List Comprehension escreva uma função, chamada dobroNaoNegativo, que devolve o dobro dos valores dos elementos não negativos da lista de inteiros dada.
-}
dobroNaoNegativo :: [Int] -> [Int]
dobroNaoNegativo lista = [x*2 | x <- lista, x >= 0]

{-
4. Usando List Comprehension escreva uma função, chamada pitagoras, que devolva uma lista de triplas, não repetidas, contendo os lados dos triângulos retângulos possíveis de serem construídos por inteiros entre 1 e um número inteiro dado.
-}
pitagoras :: Int -> [(Int, Int, Int)]
pitagoras n = [(a,b,c) | a <- [1..n], b <- [1..n], c <- [1..n], a^2 + b^2 == c^2]

{-
5. Números perfeitos são aqueles cuja soma dos seus divisores é igual ao próprio número.
Usando List Comprehension escreva uma função, chamada numerosPerfeitos, que devolva
uma lista contendo todos os números perfeitos menores que um número dado. Lembre-se
que você já tem uma função que devolve uma lista dos divisores de um número dado.
-}
numerosPerfeitos :: Int -> [Int]
numerosPerfeitos n = [x | x <- [1..n], sum (divisoresden x) == x]

{-
6. Usando List Comprehension escreva uma função, chamada produtoEscalar, que devolva o
produto escalar entre duas listas de inteiros. Lembre-se, existem as funções fst, snd e zip no
prelude que podem ser úteis.
-}
produtoEscalar :: [Int] -> [Int] -> Int
produtoEscalar xs ys = sum [x*y | (x,y) <- zip xs ys]

{-
7. Usando List Comprehension escreva uma função, chamada primeirosPrimos, que devolva
uma lista contendo os n primeiros números primos a partir do número 2.
-}
primeirosPrimos :: Int -> [Int]
primeirosPrimos n = [x | x <- [2..n], primo x]
primo x = null [x' | x' <- [2..x-1], x `rem` x' == 0]

{-
8. Usando List Comprehension escreva uma função, chamada paresOrdenados, que devolva
uma lista de par ordenados contendo uma potência de 2 e uma potência de 3 até um
determinado número dado. Observe que estes números podem ser bem grandes
-}
paresOrdenados :: Integer -> [(Integer, Integer)]
paresOrdenados n = [(x, y) | x <- [1..n], y <- [1..n], x^2 + y^3 <= n]


main = do
  print ("divisoresden: entrada: 10; resultado: " ++ show (divisoresden 10))
  
  print ("contaCaractere: entrada: t contato; resultado: " ++ show (contaCaractere 't' "contato"))

  print ("dobroNaoNegativo: entrada: [1,2,3,-1,-2,-3]; resultado: " ++ show (dobroNaoNegativo [1,2,3,-1,-2,-3]))

  print ("pitagoras: entrada: 10; resultado: " ++ show (pitagoras 10))

  print ("numerosPerfeitos: entrada: 150; resultado: " ++ show (numerosPerfeitos 150))

  print ("produtoEscalar: entrada: [1,2,3] [4,5,6]; resultado: " ++ show (produtoEscalar [1,2,3] [4,5,6]))

  print ("primeirosPrimos: entrada: 20; resultado: " ++ show (primeirosPrimos 20))

  print ("paresOrdenados: entrada: ; resultado: " ++ show (paresOrdenados 10))
