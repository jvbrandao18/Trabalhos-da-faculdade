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

;; 2. Utilizando a linguagem Clojure, crie uma função chamada penultimo que receba uma lista
;; e devolva o penúltimo elemento desta lista usar as funções já prontas e disponíveis para
;; esta mesma finalidade na linguagem Clojure. 

(defn penultimo [lista]
  (if (= (count lista) 2)
    (first lista)
    (penultimo (rest lista))))
(println (penultimo [1 2 3 4 5 6 7 8 9 10]))

;; 3. Utilizando a linguagem Clojure, crie uma função chamada elementoN que receba uma lista 
;; e um inteiro N e devolva o  elemento que  está na  posição N desta lista usar as funções já 
;; prontas e disponíveis para esta mesma finalidade na linguagem Clojure. 

(defn elementoN [lista n]
  (if (= n 1)
    (first lista)
    (elementoN (rest lista) (- n 1))))
(println (elementoN [1 2 3 4 5 6 7 8 9 10] 5))


;; 4. Utilizando  a  linguagem Clojure,  crie  uma função  chamada  inverso  que  receba uma  lista  e 
;; devolva esta lista com as posições dos elementos invertidas. Por exemplo recebe [1,2,3] e 
;; devolve [3,2,1]. Sem usar as funções já prontas e disponíveis para esta mesma finalidade na 
;; linguagem Clojure.  

(defn inverso [lista]
  (if (= (count lista) 1)
    lista
    (conj (inverso (rest lista)) (first lista))))
(println (inverso [1 2 3 4 5 6 7 8 9 10]))

;; 5. Utilizando a  linguagem Clojure, crie uma função chamada  mdc que receba  dois inteiros e 
;; devolve o mínimo divisor comum entre eles.  Sem usar as funções já prontas e disponíveis 
;; para esta mesma finalidade na linguagem Clojure.  

(defn mdc [a b]
  (if (= b 0)
    a
    (mdc b (mod a b))))
(println (mdc 10 5))