;; --João Vitor Brandão
;; --BCC - 07/10/2022
;; --Programação Funcional - Frank Coelho de Alcantara

;; 3. Utilizando a linguagem Clojure, crie uma função chamada elementoN que receba uma lista 
;; e um inteiro N e devolva o  elemento que  está na  posição N desta lista usar as funções já 
;; prontas e disponíveis para esta mesma finalidade na linguagem Clojure. 

(defn elementoN [lista n]
  (if (= n 1)
    (first lista)
    (elementoN (rest lista) (- n 1))))
(println (elementoN [10 20 30 35 40] 3))
