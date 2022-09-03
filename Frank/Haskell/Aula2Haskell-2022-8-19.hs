module Main where

--variável declarada fora do bloco do
var1 = 2 

-- exemplo de listas bem formadas
letra :: [Char]
letra = ['a','b','c','z']

inteiros :: [Int]
inteiros = [5,23,4,66]

logicos :: [Bool]
logicos = [True, True, False]

pares :: [(Int,Char)]
pares = [(2,'v'),(3,'g'),(5,'d')]

listaDeListas::[[Char]]
listaDeListas = ["Silvana", ['c','a','r','a']]

--exemplo função
digaLa :: (Integral a) => a -> String  
digaLa 1 = "Oi!"  
digaLa 2 = "Opa!"  
digaLa 3 = "Caramba!"  
digaLa x = "Nada a comentar"  

-- outro  exemplo de função
potencia :: Float -> Int -> Float
potencia x 0 = 1.0  -- caso de parada
potencia 0 n = 0.0  -- caso de parada
potencia x n =  x * (potencia x (n-1))

-- usando where 
funcaoMatematica :: Int -> Int -> Int -> Int --assinatura
funcaoMatematica a b c = dif1 + dif2 + prod + a
  where
    dif1 = c - a
    dif2 = b - a
    prod = a * b * c
-- cuidado para não criar laços infinitos 

-- usando let
funcaoMatematica2 :: Int -> Int -> Int -> Int
funcaoMatematica2 a b c =
  let dif1 = c - a
      dif2 = b - a
      prod = a * b * c
  in dif1 + dif2 + prod + a
-- novamente cuidado com os laços infinitos

-- funções e listas
dobraPos::[Int]->[Int]
dobraPos xs = [2*x | x<-xs, x>0]

dobraPosRecursiva::[Int]->[Int] -- assinatura
dobraPosRecursiva [] = []
dobraPosRecursiva (x:xs) = if x > 0 then 2*x:dobraPosRecursiva xs
else dobraPosRecursiva xs

-- exemplos de recursão simples
-- chamado na função-5
contaElementos:: [t] -> Int -- Assinatura
contaElementos [] = 0  -- caso base
contaElementos (x:xs) = 1 + contaElementos xs -- recursão

-- chamado na função-4
maior [x] = x
maior [] = 0  -- devolvi zero para manter simples  
maior (x:y:resto) 
  | x > y = maior (x:resto)
  | otherwise = maior (y:resto)


--exemplo do uso de elem
removeMinusculas :: [Char] -> [Char]  
removeMinusculas frase = [ c | c <- frase, c `elem` ['A'..'Z']] 

--exemplo de uso de product, para números realmente grandes use integer
fatorial :: Integer -> Integer  
fatorial n = product [1..n]  


main = do
  let var2 = 3 --variável declarada dentro do bloco do

  putStrLn ("\n\nMultiplicação " ++ show(var1 * var2)) 
  putStrLn ("\nAdição " ++ show(var1 + var2)) 
  putStrLn ("\nSubtração " ++ show(var1 - var2))
  putStrLn ("\nDivisão " ++ show(var1 / var2)) 
  putStrLn ("\nExponenciação (reais) " ++ show(2**2.5))
  putStrLn ("\nExponenciação (inteiros) " ++ show(2^2))
  putStrLn ("\nExponenciação (racionais) " ++ show(2^1/5))

{- Muito importante, os tipos Num são fechados em relação a ^, os tipos racionais (fractional)    são fechados em relação a ^^ e finalmente os números reais (float) são fachedos em relação     a **. Não existe uma instância de int no domínio dos racionais, ou seja, você não pode         elevar um inteiro a uma potência negativa. -}

--exemplo de função
  
  putStrLn ("\n\nDiga lá " ++ digaLa 7)
  putStrLn ("\nPotência " ++ show(potencia 3 4))


-- Funções importantes
  putStrLn("\nValor Absoluto (abs) " ++ show (abs (-10)))
  
  putStrLn("\nQuociente (quot) " ++ show ((20) `quot` 3))
  putStrLn("\nDivisão (div) " ++ show ((20) `div` 3))

-- Com números negativos
  putStrLn("\nQuociente (quot) " ++ show ((-20) `quot` 3))
  putStrLn("\nDivisão (div) " ++ show ((-20) `div` 3))
-- Para entender
  putStrLn("\nQuociente e Resto (quot) " ++ show ((-20) `quotRem` 3)) -- 3*-6+-2
  putStrLn("\nDivisão e Resto (div) " ++ show ((-20) `divMod` 3)) -- 3*-7+1

  putStrLn("\nResto (rem) " ++ show ((-20) `rem` 3))
  putStrLn("\nResto (mod) " ++ show ((-20) `mod` 3))

-- operador sequência
-- criando listas com o operador de sequência
  putStrLn("\nSequência 1 " ++ show ([1..10]))

  putStrLn("\nSequência 1 " ++ show ([1,3 .. 10]))
  putStrLn("\nSequência 1 " ++ show ([1,3 .. 11]))

  putStrLn("\nSequência 1 " ++ show (['a'..'k']))
  putStrLn("\nSequência 1 " ++ show (['a'..'b']))
  
  putStrLn("\nSequência 1 " ++ show ([1,1.1 .. 2]))
  putStrLn("\nSequência 1 " ++ show ([7,6..(-5)]))

-- lista
  putStrLn("\nLista de Listas " ++ show (listaDeListas))

-- exemplos de list comprehension
  putStrLn("\nCompreensão 1 " ++ show ([ x^2 | x <- [1..10]]))

  putStrLn("\nCompreensão 2 " ++ show ([ 2 * n | n <- inteiros ]))
  
  putStrLn("\nCompreensão 3 " ++ show ([x^2 | x <- [1..20], even x]))
  putStrLn("\nCompreensão 4 " ++ show ([x^2 | x <- [1..20], odd x]))

{- o símbolo <- é chamado de gerador de lista. Os geradores podem ser 
   combinados como expressões que retornem booleanos. -}

  putStrLn("\nCompreensão 5 " ++ show (elem 16 [x^2 | x <- [1..20], even x]))
  putStrLn("\nCompreensão 6 " ++ show (elem 5 [x^2 | x <- [1..20], odd x]))

  putStrLn("\nCompreensão 7 " ++ show ([x^2 | x <- [1..10], even x, x > 6]))

  putStrLn("\nCompreensão 8 " ++ show ( [even x | x <- [1..10] ]))
  -- multiplos geradores em uma mesma lista
  putStrLn("\nCompreensão 9 " ++ show ( [(x,y) | x <- [2,4,6], y <- [1,3,5], x < y]))

--exemplo de elem
  putStrLn("\nCompreensão 10 " ++ removeMinusculas "Frank de Alcantara")

  let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
  putStrLn("\nCompreensão 10 " ++ show ( [a+b | (a,b) <- xs]))

  --funções de listas: concatenação
  putStrLn("\nConcatenação 1 " ++ show ( [1,2,3] ++ [4,5,6]))
  putStrLn("\nConcatenação lista de listas 2 " ++ show ( concat([[1,2],[3,4]])))

  -- head, tail 
  putStrLn("\nHead " ++ show ( head([[1,2,4,5],[3,4,7,6], [8,9,1,3]])))
  putStrLn("\nTail " ++ show ( tail([[1,2,4,5],[3,4,7,6], [8,9,1,3]])))

-- init, last
  putStrLn("\ninit " ++ show ( init([[1,2,4,5],[3,4,7,6], [8,9,1,3]])))
  putStrLn("\nlast " ++ show ( last([[1,2,4,5],[3,4,7,6], [8,9,1,3]])))

  -- length 
  putStrLn("\nlength1 " ++ show ( length([[1,2,4,5],[3,4,7,6], [8,9,1,3]])))
  putStrLn("\nlength2 " ++ show ( length( head([[1,2,4,5],[3,4,7,6], [8,9,1,3]]))))

  -- sum e product
  putStrLn("\nsum " ++ show (sum [2,4,5,3,8,6,7]))
  putStrLn("\nproduct " ++ show (product [2,4,5,3,8,6,7]))

  -- exemplo de uso de product com listaDeListas
  putStrLn("\nfatorial usando product " ++ show (fatorial 10))

  --maximum e minimum
  putStrLn("\nmaximum " ++ show (maximum [2,4,5,3,8,6,7]))
  putStrLn("\nminimum " ++ show (minimum [2,4,5,1,8,6,7]))
  
-- replicate - cria uma lista com n elementos iguais
  putStrLn("\nReplicate " ++ replicate 10 'a')

  -- reverse 
  putStrLn("\nReverse " ++ show (reverse ['a','b','c','d','e']))

  -- take: devolve n elementos de uma lista
  putStrLn("\nTake " ++ show (take 2 ['a','b','c','d','e']))

  -- drop: devolve a lista com n elementos a menos
  putStrLn("\ndrop " ++ show (drop 2 ['a','b','c','d','e']))

  --takeWhile: devolve elementos a partir do começo da lista onde uma condição é verdadeira
  putStrLn("\ntakeWhile " ++ show (takeWhile (<6) [2,4,8,3,8,6,7]))

 --dropWhile: retira o maior segmento inicial da lista onde uma condição é verdadeira
  putStrLn("\ndropWhile " ++ show (dropWhile (<6) [2,4,5,3,8,6,7]))

  -- splitAt: divide a lista na posição e retorna um par de listaDeListas
  putStrLn("\nsplitAt " ++ show (splitAt 3 [2,4,5,3,8,6,7]))

  --zip: recebe duas lista e devolve uma lista de pares (produto cartesiano)
  putStrLn("\nzip " ++ show (zip ['a','b','c','d'] [2,4,5,3,8,6,7]))

    
  -- funções manualmente criadas com listas
  putStrLn("\nExemplo Função-1 " ++ show ( dobraPos [1,2,3]))
  putStrLn("\nExemplo Função-2 " ++ show ( dobraPosRecursiva [1,2,3]))
  putStrLn("\nExemplo Função-3 " ++ show ( contaElementos [1,2,3,18]))
  putStrLn("\nExemplo Função-4 " ++ show ( maior [1,2,18,5]))
 