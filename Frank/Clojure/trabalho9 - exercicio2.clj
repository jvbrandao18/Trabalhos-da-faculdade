;; --João Vitor Brandão
;; --BCC - 07/10/2022
;; --Programação Funcional - Frank Coelho de Alcantara

;; 2. Utilizando a linguagem Clojure, crie uma função chamada penultimo que receba uma lista
;; e devolva o penúltimo elemento desta lista usar as funções já prontas e disponíveis para
;; esta mesma finalidade na linguagem Clojure. 

(defn penultimo [lista]
  (if (= (count lista) 2)
    (first lista)
    (penultimo (rest lista))))
(println (penultimo [1 2 3 4 5 6 7 8 9 10]))
