--João Vitor Brandão
--BCC - 02/09/2022
--Programação Funcional - Frank Coelho de Alcantara
import Data.Char

-- 1. Escreva uma função chamada fatorialn que usando o operador range e a função foldr devolva o fatorial de n.
fatorialn :: Int -> Int
fatorialn n = product [1..n]


-- 2. Usando a função map escreva uma função, chamada quadradoReal que recebe uma lista de números reais, positivos e negativos e devolva uma lista com o quadrado de cada um dos inteiros listados.
quadradoReal = map (^2) [1,2,-3,4,-6,10]


-- 3. Usando a função map escreva uma função, comprimentoPalavras que recebe uma lista de palavras e devolve uma lista com o comprimento de cada uma destas palavras.
comprimentoPalavras :: [t] -> Int
comprimentoPalavras [] = 0 
comprimentoPalavras (x:xs) = 1 + comprimentoPalavras xs


-- 4. Usando a função filter escreva uma função, chamada maiorMultiploDe29 devolva o maior número entre 0 e 100000 que seja divisivel por 29.
maiorMultiploDe29 :: Int 
maiorMultiploDe29 = maximum (filter (\x -> x `mod` 29 == 0) [0..100000])


-- 5. Usando a função filter escreva uma função, chamada maiorMultiploDe que recebe um inteiro e devolva o maior número entre 0 e 100000 que seja divisivel por este inteiro.
maiorMultiploDe :: Int  -> Int
maiorMultiploDe n 
  | n < 0 = error "Erro!"
  | otherwise = maximum (filter (\x -> x `mod` n == 0) [0..100000])


-- 6. Usando Haskell e a função foldr defina uma função, chamada somaQuadrados que devolva a soma dos quadrados dos itens de uma lista de números naturais de comprimento n. De tal forma que: 𝑠𝑜𝑚𝑎𝑄𝑢𝑎𝑑𝑟𝑎𝑑𝑜𝑠 = 12 + 22 + 32 + 42. . . +𝑛2.
somaQuadrados :: Int -> Int
somaQuadrados n
  | n <= 0 = error "Erro!"
  | otherwise = foldr (+) 0 (map (^2) [1..n])


-- 7. Usando Haskell e a função foldl defina uma função, chamada comprimento, que devolva o comprimento (cardinalidade) de uma lista dada.
comprimento = foldl max 3 [1,2,3,4,5,6,7]


-- 8. Esta é uma tarefa de pesquisa: você deve encontrar e executar exemplos em Haskell do uso das seguintes funções disponíveis no Prelude: flip, ord, max, min, curry, uncurry. Para cada uma destas funções você deverá encontrar, executar e testar no mínimo dois exemplos.


--Chamada das funções:
main = do
--Questão 1:
  print ("fatorialn: entrada: 6; resultado: " ++ show (fatorialn 6))

--Questão 2:
  print ("quadradoReal: entrada: [1,2,-3,4,-6,10]; resultado: " ++ show quadradoReal)

--Questão 3:
  print ("comprimentoPalavras: entrada: a,b,c; resultado: " ++ show (comprimentoPalavras ["a", "b", "c"]))

--Questão 4:
  print ("maiorMultiploDe29: entrada: 232; resultado: " ++ show maiorMultiploDe29)

--Questão 5: 
  print ("maiorMultiploDe: entrada: ; resultado: " ++ show (maiorMultiploDe 24))

--Questão 6:
  print ("somaQuadrados: entrada: 20; resultado: " ++ show(somaQuadrados 20))

--Questão 7:
  print ("comprimento: entrada: [1,2,3,4,5,6,7]; resultado: " ++ show (comprimento))

--Questão 8:
  print ("8a: entrada: 'hello world'; resultado: " ++ show (flip (++) "hello" "world"))
  print ("8a: entrada: te tes; resultado: " ++ show ( flip (++) "te" "tes"))

  print ("8b: entrada: a; resultado: " ++ show ( ord 'a'))
  print ("8b: entrada: \n; resultado: " ++ show ( ord '\n'))

  print ("8c: entrada: 12 24; resultado: " ++ show ( max 12 24))
  print ("8c: entrada: 99 98; resultado: " ++ show ( max 99 98))

  print ("8d: entrada: 99 98; resultado: " ++ show ( min 99 98))
  print ("8d: entrada: 0 2; resultado: " ++ show ( min 0 2))

  print ("8e: entrada: 2 3; resultado: " ++ show ( curry fst 2 3))
  print ("8e: entrada: 12 7; resultado: " ++ show ( curry fst 12 7))

  print ("8f: entrada: 5 4; resultado: " ++ show ( uncurry mod (5, 4)))
  print ("8f: entrada: 10 14; resultado: " ++ show ( uncurry mod (10, 14)))
