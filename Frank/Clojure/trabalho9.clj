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

;; 2. Utilizando a linguagem Clojure, crie uma função chamada penultimo que receba uma lista
;; e devolva o penúltimo elemento desta lista usar as funções já prontas e disponíveis para
;; esta mesma finalidade na linguagem Clojure. 

(defn penultimo [lista]
  (if (= (count lista) 2)
    (first lista)
    (penultimo (rest lista))))

;; 3. Utilizando a linguagem Clojure, crie uma função chamada elementoN que receba uma lista 
;; e um inteiro N e devolva o  elemento que  está na  posição N desta lista usar as funções já 
;; prontas e disponíveis para esta mesma finalidade na linguagem Clojure. 

(defn elementoN [lista n]
  (if (= n 1)
    (first lista)
    (elementoN (rest lista) (- n 1))))

;; 4. Utilizando  a  linguagem Clojure,  crie  uma função  chamada  inverso  que  receba uma  lista  e 
;; devolva esta lista com as posições dos elementos invertidas. Por exemplo recebe [1,2,3] e 
;; devolve [3,2,1]. Sem usar as funções já prontas e disponíveis para esta mesma finalidade na 
;; linguagem Clojure.  

(defn inverso
  ([[fst & rst]]
   (if (empty? rst)
    (list fst)
    (concat (inverso rst) (list fst)))))

;; 5. Utilizando a  linguagem Clojure, crie uma função chamada  mdc que receba  dois inteiros e 
;; devolve o mínimo divisor comum entre eles.  Sem usar as funções já prontas e disponíveis 
;; para esta mesma finalidade na linguagem Clojure.  

(defn mdc [a b]
  (if (= b 0)
    a
    (mdc b (mod a b))))


;; Chamada das funções
(println "-------------------------------------------------------------")
(println "ultimo: entrada: [2 4 6 12]; resultado: " (ultimo [2 4 6 12]))
(println "ultimo: entrada: [12 6 8 2 5]; resultado: " (ultimo [12 6 8 2 5]))
(println "-------------------------------------------------------------")
(println "penultimo: entrada: [1 5 10 24]; resultado: " (penultimo [1 5 10 24]))
(println "penultimo: entrada: [24 10 8 2 5]; resultado: " (penultimo [24 10 8 2 5]))
(println "-------------------------------------------------------------")
(println "elementoN: entrada: [2 4 6 12] 4; resultado: "(elementoN [2 4 6 12] 3))
(println "elementoN: entrada: [12 6 8 2 5] 2; resultado: "(elementoN [12 6 8 2 5] 2))
(println "-------------------------------------------------------------")
(println "inverso: entrada: [2 4 6 12]; resultado: " (inverso [2 4 6 12]))
(println "inverso: entrada: [24 10 8 2 5]; resultado: " (inverso [24 10 8 2 5]))
(println "-------------------------------------------------------------")
(println "mdc: entrada: 10 5; resultado: " (mdc 10 5))
(println "mdc: entrada: 15 30; resultado: " (mdc 15 30))
