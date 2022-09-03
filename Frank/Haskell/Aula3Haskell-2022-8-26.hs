module Main where

-- exemplo de funções de alta ordem
mapear :: (a -> b) -> [a] -> [b] -- mapear
mapear f [] = []
mapear f (x : xs) = f x : mapear f xs

-- eleva todos os elementos da lista ao quadrado
quadrados :: [Int] -> [Int]
quadrados xs = mapear sq xs
  where
    sq x = x * x

-- devolve uma lista de comprimentos das listas de uma lista de listas
comprimentos :: [[a]] -> [Int]
comprimentos xss = mapear length xss

-- soPares
soPares :: [Int] -> [Int]
soPares [] = []
soPares (x : xs)
  | mod x 2 == 0 = x : (soPares xs)
  | otherwise = soPares xs

-- exemplo de foldr
eLogico, ouLogico :: [Bool] -> Bool
eLogico = foldr (&&) True
ouLogico = foldr (||) False

soma, produto :: [Int] -> Int
produto = foldr (*) 1
soma = foldr (+) 0

concatena :: [[a]] -> [a]
concatena = foldr (++) []

main = do
  putStrLn ("\n\nMultiplicação " ++ show (produto [1, 2, 3, 4]))
  putStrLn ("\nAdição " ++ show (soma [1, 2, 3, 4]))

  -- exemplo de funções de alta ordem
  putStrLn ("\n\nAlta Ordem quadrados " ++ show (quadrados [1, 2, 3, 4]))
  putStrLn ("\nAlta Ordem comprimentos  " ++ show (comprimentos [[1, 2, 3, 4], [4, 3, 5], [1, 2], [1]]))

  -- exemplos de map
  putStrLn ("\n\nMap 1 " ++ show (map abs [-1, -3, 4, -12]))
  putStrLn ("\nMap 2  " ++ show (map (3 *) [1, 2, 3, 4]))
  putStrLn ("\nMap 3  " ++ show (map (+ 4) [1, 2, 3, 4]))
  putStrLn ("\nMap 4  " ++ show (map (replicate 3) [3 .. 6]))
  putStrLn ("\nMap 5  " ++ show (map (map (^ 2)) [[1, 2], [3, 4, 5, 6], [7, 8]]))
  putStrLn ("\nMap 6  " ++ show (map fst [(1, 2), (3, 5), (6, 3), (2, 6), (2, 5)]))
  putStrLn ("\nMap 7  " ++ show (map (1 -) (1 : (2 : (3 : [])))))

  -- na verdade o map só será aplicado aos valores da lista que serão forçados na função.
  --putStrLn ("\n\nMap 8  " ++ show(map (+1) [1, 2, undefined]))
  putStrLn ("\n\nMap 8  " ++ show (take 2 $ map (+ 1) [1, 2, undefined]))

  -- soPares
  putStrLn ("\n\nsoPares  " ++ show (soPares [1, 2, 3, 4, 5, 6]))

  --exemplos de filter
  putStrLn ("\n\nFilter 1  " ++ show (filter (> 5) [1, 2, 3, 4, 5, 6, 7, 8]))
  putStrLn ("\nFilter 2  " ++ show (filter odd [3, 6, 7, 9, 12, 14]))
  putStrLn ("\nFilter 3  " ++ show (filter (== 'a') "abracadabra"))

  -- exemplos de foldr
  putStrLn ("\n\nFoldr 1  " ++ show (foldr (+) 0 [1, 2, 3, 4, 5]))
  putStrLn ("\nFoldr 2  " ++ show (eLogico [True, True, False]))
  putStrLn ("\nFoldr 3  " ++ show (ouLogico [True, True, False]))
  putStrLn ("\nFoldr 4  " ++ show (soma [1, 2, 3, 4, 5]))
  putStrLn ("\nFoldr 5  " ++ show (produto [1, 2, 3, 4, 5]))
  putStrLn ("\nFoldr 6  " ++ show (concatena ["Hello ", "world", "!"]))
  putStrLn ("\nFoldr 7  " ++ show (foldr (+) 1 [1, 2, 3]))
  {-
    No caso de foldr (+) 1 [1, 2, 3] a lista será avaliada da seguinte forma:
    1 + (2 + (3 + 1))
    1 + (2 + 4)
    1 + 6
    7
  -}
  -- exemplos foldl
  putStrLn ("\n\nFoldl 1  " ++ show (foldl (+) 0 [1, 2, 3]))
  {-
    No caso, recursivamente teremos:
    foldl (+) 0 [1, 2, 3]
    foldl (+) ((+) 0 1) [2, 3]
    foldl (+) ((+) ((+) 0 1) 2) [3]
    foldl (+) ((+) ((+) ((+) 0 1) 2) 3) []
    ((+) ((+) ((+) 0 1) 2) 3)

    -- o texto https://jarombek.com/blog/oct-20-2018-haskell-pt2 de Andrew Jarombek vale a pena
  -}
  putStrLn ("\nFoldl 2  " ++ show (foldl (+) 0 [1 .. 10]))
  putStrLn ("\nFoldl 3  " ++ show (foldl (++) "" ["Esta ", "concatena ", "todos os ", "strings ", "de uma lista"]))
  putStrLn ("\nFoldl 3  " ++ show (foldl (*) 7 [1 .. 3]))

  -- exemplos zipWith
  putStrLn ("\n\nzipWith 1  " ++ show (zipWith (+) [1, 2, 3] [1, 2, 3]))
  putStrLn ("\n\nzipWith 2  " ++ show (zipWith (*) [2, 2, 2] [3, 2, 1]))
  putStrLn ("\n\nzipWith 3  " ++ show (zipWith (++) ["Caramba! ", "de como " ] ["Outro exemplo ", "concatenar."]))
  putStrLn ("\n\nzipWith 4  " ++ show (zipWith (++) ["e", "p", "e", "s"] ["d", "r", "s", "o"]))

  -- se pode zipar, então pode unzipar (neologismo horrível!!)
  putStrLn ("\n\nunzip " ++ show (unzip [(1, 2), (3, 4), (5, 6)]))
