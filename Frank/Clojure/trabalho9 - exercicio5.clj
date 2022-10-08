;; --João Vitor Brandão
;; --BCC - 07/10/2022
;; --Programação Funcional - Frank Coelho de Alcantara

;; 5. Utilizando a  linguagem Clojure, crie uma função chamada  mdc que receba  dois inteiros e 
;; devolve o mínimo divisor comum entre eles.  Sem usar as funções já prontas e disponíveis 
;; para esta mesma finalidade na linguagem Clojure.  

(defn mdc [a b]
  (if (= b 0)
    a
    (mdc b (mod a b))))
(println (mdc 10 5))
