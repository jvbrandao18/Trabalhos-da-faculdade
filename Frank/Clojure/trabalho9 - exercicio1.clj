;; --João Vitor Brandão
;; --BCC - 07/10/2022
;; --Programação Funcional - Frank Coelho de Alcantara

;; 1. Utilizando a linguagem Clojure, crie uma função chamada ultimo que receba uma lista e
;; devolva o último elemento desta lista sem usar as funções já prontas e disponíveis para esta
;; mesma finalidade na linguagem Clojure. 

(defn ultimo [lista]
  (if (= (count lista) 1)
    (first lista)
    (ultimo (rest lista))))
(println (ultimo [1 2 3 4 5 6 7 8 9 10]))
