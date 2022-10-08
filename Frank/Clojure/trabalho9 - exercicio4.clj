;; 4. Utilizando  a  linguagem Clojure,  crie  uma função  chamada  inverso  que  receba uma  lista  e 
;; devolva esta lista com as posições dos elementos invertidas. Por exemplo recebe [1,2,3] e 
;; devolve [3,2,1]. Sem usar as funções já prontas e disponíveis para esta mesma finalidade na 
;; linguagem Clojure.  

(defn inverso [lista]
  (if (= (count lista) 1)
    lista
    (conj (inverso (rest lista)) (first lista))))
(println (inverso [1 2 3 4 5 6 7 8 9 10]))
