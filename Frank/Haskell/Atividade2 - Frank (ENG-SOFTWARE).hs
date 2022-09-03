--João Vitor Brandão
--BCC - 16/08/2022
--Programação Funcional - Frank Coelho de Alcantara

{-1. Escreva uma função chamada soma1 que recebe um inteiro como argumento e retorna um inteiro uma unidade maior que a entrada.-}
soma1 :: Int -> Int
soma1 x = x + 1


{-2. Escreva uma função chamada sempre que, não importando o valor de entrada, devolva
sempre zero. Observe que neste caso a entrada pode ser de qualquer tipo.-}
sempre :: any -> Int
sempre x = 0


{-3. Escreva uma função chamada treco que receba três valores em ponto flutuantes com
precisão dupla e retorne o resultado da soma dos dois primeiros multiplicado pelo terceiro.-}
treco :: Double -> Double -> Double -> Double
treco x y z = (x + y) * z


{-4. Escreva uma função chamada resto que devolva o resto de uma divisão entre dois números
inteiros.-}
resto :: Int -> Int -> Int
resto x y = x `mod` y


{-5. Escreva uma função chamada precoMaior que devolva o maior valor entre quatro valores monetários.-}
precoMaior :: Float -> Float -> Float -> Float -> Float
precoMaior a b c d = maximum [a, b, c, d]


{-6. Escreva uma função chamada impar que devolva True, sempre que o resultado do produto de dois números inteiros for ímpar.-} 
impar :: (Int, Int) -> Bool
impar (x, y) = ((x * y) `mod` 2) == 1


{-7. Em Haskell existe o tipo par cuja assinatura tem a seguinte forma: 𝑝𝑎𝑟 ∷ (𝐼𝑛𝑡,𝐼𝑛𝑡). Escreva
uma função em Haskell que devolva a soma dos componentes de um par de inteiros.-}
par :: (Int, Int) -> Int
par (x, y) = x + y


{-8. Escreva uma função em Haskell que receba números reais (double) e devolva o resultado
da equação 𝑥2 + 𝑦/2 + 𝑧.-}
q8 :: Double -> Double -> Double -> Double
q8 x y z = x**2 + y/2 + z


{-9. Escreva uma função em Haskell chamada diagnostico que receba o peso do aluno e imprima
um diagnóstico de obesidade, segundo a tabela que pode ser encontrada no link:
Sobrepeso, obesidade e obesidade mórbida: entenda a diferença entre os três termos
(cuidadospelavida.com.br). Observe que este diagnóstico é meramente estatístico e não
tem nenhum valor real, está sendo usado nesta questão apenas para a definição das faixas.
Todo e qualquer diagnóstico deve ser feito por um profissional médico.-}
diagnostico :: Double -> String
diagnostico x
  |x < 17 = "Muito abaixo do peso"
  |x < 18.5 = "Peso normal"
  |x < 30 = "Sobrepeso" 
  |x < 35 = "Obesidade leve" 
  |x < 40 = "Obesidade severa"
  |otherwise = "Obesidade morbida"


{-10. Escreva uma função em Haskell chamada bissexto que receba um ano e devolva True se o
ano for bisexto sabendo que anos bissextos obedecem a seguinte regra:
𝑇𝑜𝑑𝑜𝑠 𝑜𝑠 𝑎𝑛𝑜𝑠 𝑞𝑢𝑒 𝑠𝑒𝑗𝑎𝑚 𝑑𝑖𝑣𝑖𝑠í𝑣𝑒𝑖𝑠 𝑝𝑜𝑟 4
𝐸𝑥𝑐𝑒𝑡𝑜 𝑜𝑠 𝑎𝑛𝑜𝑠 𝑞𝑢𝑒 𝑠ã𝑜 𝑚ú𝑙𝑡𝑖𝑝𝑙𝑜𝑠 𝑑𝑒 100
𝐸𝑥𝑐𝑒𝑡𝑜 𝑜𝑠 𝑎𝑛𝑜𝑠 𝑞𝑢𝑒 𝑠ã𝑜 𝑚ú𝑙𝑡𝑖𝑝𝑙𝑜𝑠 𝑑𝑒 400
1997 não é bissexto, 1900 não é bissexto e 2000 é bissexto.-}
bissexto :: Int -> Bool
bissexto x = ((x `mod` 4 == 0 && x `mod` 100 /= 0) || x`mod`400 == 0)


--Chamada das funções:
main = do
--Questão 1:
  print ("soma1: entrada: 4; resultado: " ++ show (soma1 4))
  print ("soma1: entrada: -2; resultado: " ++ show (soma1 (-2)))
--Questão 2:
  print ("sempre: entrada: 10.5; resultado: " ++ show (sempre 10.5))
  print ("sempre: entrada: -10; resultado: " ++ show (sempre (-10)))
--Questão 3:
  print ("treco: entrada: 10 5 2; resultado: " ++ show (treco 10 5 2))
--Questão 4:
  print ("resto: entrada: 10 3; resultado: 1 " ++ show (resto 10 3))
  print ("resto: entrada: -10 3; resultado: 2 " ++ show (resto (-10) 3))
--Questão 5: 
  print ("precoMaior: entrada: 1 3 10 9; resultado: " ++ show (precoMaior 1 3 10 9))
  print ("precoMaior: entrada: -10 6 3 9; resultado: " ++ show (precoMaior (-10) 6 3 9))
--Questão 6:
  print ("impar: entrada: 1 3; resultado: " ++ show( impar (1,3)))
  print ("impar: entrada: 1 2; resultado: " ++ show( impar (1,2)))
--Questão 7:
  print ("par: entrada: 2 4; resultado: " ++ show( par (2,4)))
  print ("par: entrada: 5 7; resultado: " ++ show( par (5,7)))
--Questão 8:
  print ("q8: entrada: 10 8 5; resultado: " ++ show (q8 10 8(5)))
-- Questão 9:
  print ("diagnostico: entrada: < 17; resultado: " ++ show( diagnostico (15)))
  print ("diagnostico: entrada: < 18.5; resultado: " ++ show( diagnostico (18)))
  print ("diagnostico: entrada: < 30; resultado: " ++ show( diagnostico (20)))
  print ("diagnostico: entrada: < 35; resultado: " ++ show( diagnostico (34)))
  print ("diagnostico: entrada: < 40; resultado: " ++ show( diagnostico (39)))
  print ("diagnostico: entrada: > 41; resultado: " ++ show( diagnostico (77)))
-- Questão 10:
--1997 não é bissexto, 1900 não é bissexto e 2000 é bissexto.-}
  print ("bissexto: entrada: 1900; resultado: " ++ show (bissexto 1900))
  print ("bissexto: entrada: 1997; resultado: " ++ show (bissexto 1997))
  print ("bissexto: entrada: 2000; resultado: " ++ show (bissexto 2000))
