module Main where

{-
Meio crivo
-}

crivo :: [Int] -> [Int]
crivo (p : xs) = p : crivo (filter (\x -> x `mod` p /= 0) xs)
numerosPrimos n=take n $ crivo [2..]

{- usado em um exercício em aula
1. Escreva uma função, chamada raizes, que calcule as raízes de uma equação do segundo grau 
na forma ax²+bx+c=0. Sua função deverá emitir um erro sempre que ax² for igua a zero e 
outro erro sempre que as raízes forem complexas (não precisa calcular a raíz). Esta função 
deverá retornar uma tupla, contendo as duas raízes reais.  
Dica, talvez a classe RealFloat ajude.

raizes :: (Ord a,Floating a) => a -> a -> a -> (a,a)
raizes a b c
  | a == 0    = error "Não se enquadra"
  | delta < 0  = error "Raízes complexas"
  | otherwise = ((-b-r)/e, (-b+r)/e) where 
    delta = b*b - 4*a*c
    r = sqrt delta 
    e = 2*a
-}

raizes :: (RealFloat a) => a -> a -> a -> (a,a)
raizes a b c
  | a == 0    = error "Não se enquadra"
  | delta < 0  = error "Raízes complexas"
  | otherwise = ((-b-r)/e, (-b+r)/e) where 
    delta = b*b - 4*a*c
    r = sqrt delta 
    e = 2*a

{-
2. No Módulo Prelude existe uma função, exp, que calcula o resultado de um número x elevado a um 
número y. Escreva uma função, chamada de potencia, que faça a mesma coisa. Além de fazer esta 
função, de forma recursiva, você deve determinar quantas multiplicações a sua função recursiva
realizará quando for chamada.
-}

potencia :: Integer -> Integer -> Integer
potencia x n 
  | n == 0 = 1
  | n == 1 = x
  | otherwise = x * potencia x (n-1)

  -- x * potencia x (4-1)
  -- x * potencia x (3-1)
  -- x * potencia x (2-1)

{-
 potência usando x^(2m) = (x^2)^m and x^(2m+1) = x*(x^2)^m
-}
pow:: Integer->Integer->Integer
pow x n  
  |(n==1) = x
  |even n = (pow x m)*(pow x m) 
  |odd n  = x * (pow x (n-1))
    where m = div n 2


{- Este exercício foi usado como exemplo durante uma aula

3. uma determinada empresa de cartão de crédito fornece cartões com números de 10 digitos onde
os oito primeiros digitos são aleatórios mas, os dois últimos represetam a soma destes 8 
digitos. 

Construa uma função que receba um string contendo 8 digitos e devolva uma string contendo 
10 digitos de forma que a string devolvida implemente a regra de geração dos dois últimos 
digitos explicitada acima.  Esta função devará ser do tipo Card. 

Por fim, escreva uma função que receba um string e devolva True caso este string represente
um número de cartão válido
-}
--vams usar sinônimos de tipos, equivalente ao typedef do C
type Card = String

checkSum :: Card -> Card -- assinatura de tipo da função checkSum
checkSum card =
  card ++ show (n `div` 10) ++ show (n `mod` 10)
  where n = sum (map fromDigit card)

valido :: Card -> Bool
valido card = card == checkSum (take 8 card)

-- read :: Read a => String -> a 	-- Defined in `Text.Read'
fromDigit :: Char -> Int
fromDigit c = read [c]


--criando uma classe de tipos para numeros naturais

data Nat = Zero | Succ Nat

-- isso uqer dizer que Zero e Succ são construtors de tipos da classe Nat e que Succ precisa 
-- de um argumento que é do tipo Nat que estamos definindo 

-- nós queremos que os tipos da classe Nat tenham as funções aritméticas então, vamos 
-- transformar Nat em instâncias de Eq e show
instance Eq Nat where
  Zero == Zero = True
  Zero == Succ n = False
  Succ m == Zero = False
  Succ m == Succ n = (m == n)

instance Ord Nat where
  Zero < Zero = False
  Zero < Succ n = True
  Succ m < Zero = False
  Succ m < Succ n = (m < n)
  Succ m <= Succ n = (m <=n)

instance Show Nat where
  show x = show (converte x) where
    converte Zero = 0
    converte (Succ x) = 1 + converte x

{--
  show Zero = "Zero"
  show (Succ Zero) = "Succ Zero"
  show (Succ (Succ n)) = "Succ (" ++ show (Succ n) ++ ")"
--}



{-
-- ou poderíamos ter usado:

data Nat = Zero | Succ Nat 
  deriving (Eq,Ord,Show)

O compilador é capaz de fazer a derivação para nós. 

-}

-- como queremos fazer operações aritméticas uma boa opção é transformar Nat em um instância
-- de NUM 
instance Num Nat where
  -- definindo a soma
  m + Zero = m
  m + Succ n = Succ (m+n)
  -- definindo a multiplicação
  m * Zero = Zero 
  m * (Succ n) = m * n + m

  -- definindo a subtração
  m - Zero = m
  Zero - Succ n = Zero
  Succ m - Succ n = m - n
  
  -- devolve o valor absoluto de um número
  abs n = n
  -- retorna -1 para numeros negativos, zero para zero e 1 para números positivos
  signum Zero = Zero
  signum (Succ n) = Succ Zero

  -- para usar os inteiros e transformar estes em Nat
  fromInteger x
    | x <= 0 = Zero
    | otherwise = Succ (fromInteger (x-1))  

soma:: Nat -> Nat -> Nat
soma x y = x + y

produto :: Nat -> Nat -> Nat
produto x y = x*y

-- Exemplo de Classe de Tipos
data Figura = Circulo Float | Retangulo Float Float Float Float | Quadrado Float
  
area :: Figura -> Float  
area (Circulo r) = pi * r ^ 2  
area (Retangulo x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- Trabalhando com registros, como as structs em c
{-
data Funcionario = Funcionario String String Int Float String String deriving (Show)

nome :: Funcionario -> String  
nome (Funcionario nome _ _ _ _ _) = nome  
  
sobrenome :: Funcionario -> String  
sobrenome (Funcionario _ sobrenome _ _ _ _) = sobrenome  
  
idade :: Funcionario -> Int  
idade (Funcionario _ _ idade _ _ _) = idade  
  
altura :: Funcionario -> Float  
altura (Funcionario _ _ _ altura _ _) = altura  
  
telefone :: Funcionario -> String  
telefone (Funcionario _ _ _ _ number _) = number  
  
cargo :: Funcionario -> String  
cargo (Funcionario _ _ _ _ _ cargo) = cargo  
-}

data Funcionario = Funcionario { nome :: String  
                     , sobrenome :: String  
                     , idade :: Int  
                     , altura :: Float  
                     , telefone :: String  
                     , cargo :: String  
                     } deriving (Show, Eq)


-- exercícios práticos 2
problem_2 = sum [ x | x <- takeWhile (<= 100000) fibs, even x]
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

problem_a2 = sum [ x | x <- takeWhile (<= 100000) fibs, odd x]
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

main :: IO()
main = do
  print (numerosPrimos 15)

  print (raizes 2 4 (-6))
  print (potencia 2 4)
  print (pow 2 4)
  
  print (potencia 2 5)
  print (pow 2 5)

  print (checkSum "12345678")
  print (valido (checkSum "12345678"))
  
  print (soma 3 5)
  print (produto 3 5)

  print (area (Circulo 10))

  let frank = Funcionario "Frank" "Alcantara" 57 1.80 "414141414141" "Diretor"
  let paulo = Funcionario "Paulo" "Alcantara" 57 1.80 "414141414141" "Diretor"
  let outrocara = Funcionario "Frank" "Alcantara" 57 1.80 "414141414141" "Diretor"
  
  print(frank)
  print(nome frank)
  print (frank == paulo)
  print (frank == outrocara)
  print (show frank)

  print problem_2
  print problem_a2