--João Vitor Brandão
--BCC - 16/09/2022
--Programação Funcional - Frank Coelho de Alcantara

-- 3. Dada uma coleção de números, implemente as funções manter e descartar que recebem a coleção e um predicado. Sempre que o predicado for verdadeiro quando aplicado a um item da coleção original este item deve ser mantido ou descartado. Lembre-se dos valores imutáveis. Você não pode usar as funções filter e reject já disponíveis no Prelude ou em qualquer outra biblioteca.

module Main (main) where

manter :: [any] -> (any -> Bool) -> [any]
manter [] _ = []
manter (head:tail) p = [head | p head] ++ (manter tail p)

descartar :: [any] -> (any -> Bool) -> [any]
descartar [] _ = []
descartar (head:tail) p = [head | not (p head)] ++ (descartar tail p)

main :: IO()
main = do
  print ("manter: entrada: [1,2,3,4,5] (> 3); resultado: " ++ show (manter [1,2,3,4,5] (> 3)))
  print ("manter: entrada: [1,2,3,4,5,15,20,25] (> 5); resultado: " ++ show (manter [1,2,3,4,5,15,20,25] (> 5)))

  print ("descartar: entrada: [1,2,3,4,5] (> 3); resultado: " ++ show (descartar [1,2,3,4,5] (> 3)))
  print ("descartar: entrada: [1,2,3,4,5,15,20,25] (> 5); resultado: " ++ show (descartar [1,2,3,4,5,15,20,25] (> 5)))

