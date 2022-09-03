--João Vitor Brandão
--BCC - 19/08/2022
--Programação Funcional - Frank Coelho de Alcantara

{-1. Escreva uma função para o cálculo dos números da sequência de Fibonacci, utilizando
Haskell. -} 
fibo :: Int -> Int
fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-1) + fibo (n-2)

{-2. Um dos primeiros algoritmos documentados é o algoritmo para o cálculo do Maior Divisor
Comum (MDC) de Euclides publicado por volta do ano 300 AC. Podemos simplificar este
algoritmo dizendo que dados dois inteiros A e B, o MDC entre eles será dado pelo valor
absoluto de A se B=0 e pelo MDC entre B e o resto da divisão de A por B se B>0. Escreva
uma função para o cálculo do MDC entre dois números inteiros positivos, usando o
algoritmo de Euclides conforme apresentado aqui, utilizando Haskell. -}
mdc :: Int -> Int -> Int
mdc a b | a < b = mdc b a
        | b == 0 = a
        | otherwise = mdc b (mod a b)

{-3. Escreva uma função recursiva que dado um número inteiro n, devolva a soma dos dígitos deste número. Exemplo: dado 1234 a função deverá devolver 10. Utilizando Haskell e recursividade. -}
q3 :: Int -> Int
q3 x
  | x < 10 = x
  | otherwise = (x `mod` 10) + q3 (x `div` 10)

{-4. Escreva uma função que devolva a soma de todos os números menores que 10000 que sejam múltiplos de 3 ou 5. -}
q4 = sum [x | x <- [1..10000], mod x 3 == 0 || mod x 5 == 0]


{-5.qEscreva uma função que, recebendo uma lista de inteiros, apresente a diferença entre a soma dos quadrados e o quadrado da soma destes inteiros, usando recursividade-}
q5 :: [Int] -> Int
q5 a
  | null a = 0
  | otherwise = head a^2 + q5 (tail a)

op :: [Int] -> Int
op a =  q5 a - sum(a)^2

{-6. O Crivo de Eratóstenes não é o melhor algoritmo para encontrar números primos. Crie uma função que implemente o Crivo de Euler (Euler’s Sieve) para encontrar todos os números primos menores que um determinado inteiro dado. -} 
primos :: Int -> [Int]
divisores n = [x | x<-[1..n], n`mod`x==0]
primo n = divisores n == [1,n]
primos n = [x | x<-[2..n], primo x]


{-7.Nem só de Fibonacci vivem os exemplos de recursão. Escreva uma função que devolva todos os números de uma sequência de Lucas (2, 1, 3, 4, 7, 11, 18, 29, 47, 76, 123) menores que um inteiro dado. -}
lucas :: Int -> Int
lucas 0 = 2
lucas 1 = 1
lucas n = lucas (n-1) + lucas (n-2)
  

{-8. Escreva uma função, chamada aoContrario em Haskel para reverter uma lista. Dado [1,2,3] devolva [3,2,1]. -}
aoContrario :: [Int] -> [Int]
aoContrario [] = []
aoContrario (x:xs) = aoContrario(xs) ++ (x:[])


{-9. Escreva uma função chamada somaRecursiva que recebe dois valores inteiros e devolve o produto destes valores sem usar o operador de multiplicação.-}
somaRecursiva = [ 2 * n | n <- [5, 10] ]


{-10. Escreva uma função chamada comprimento que receba uma lista de inteiros e devolva o comprimento desta lista. 
Observe que você não pode usar nenhuma função que já calcule o comprimento de uma lista.-}
comprimento :: [Int] -> Int
comprimento x
  | null x = 0
  | otherwise = 1 + comprimento (tail x)


--Chamada das funções:
main = do
--Questão 1:
  print ("fibo: entrada: 10; resultado: " ++ show (fibo 10))

--Questão 2:
  print ("mdc: entrada: 18 60; resultado: " ++ show (mdc 18 60))

--Questão 3:
  print ("q3: entrada: 1234; resultado: " ++ show (q3 1234))

--Questão 4:
  print ("q4: entrada: ; resultado: " ++ show q4)

--Questão 5: 
  print ("q5: entrada: [12 5]; resultado: " ++ show (op[12, 5]))

--Questão 6:
  print ("q6: entrada: 20; resultado: " ++ show(primos 20))

--Questão 7:
  print ("lucas: entrada: 10; resultado: " ++ show(lucas 10))

--Questão 8:
  print ("aoContrario: entrada: [1,2,3]; resultado: " ++ show (aoContrario [1,2,3]))

--Questão 9:
  print ("somaRecursiva: entrada: [5,10]; resultado: " ++ show (somaRecursiva))

--Questão 10:
  print ("comprimento: entrada: [1,2,3,4,5]; resultado: " ++ show (comprimento [1,2,3,4,5]))
