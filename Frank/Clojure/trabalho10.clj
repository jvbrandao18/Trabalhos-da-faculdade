;; --João Vitor Brandão
;; --BCC - 21/10/2022
;; --Programação Funcional - Frank Coelho de Alcantara

;; 1. Na aula disponível em: https://replit.com/@frankalcantara/ClojureAula2?v=1 foram
;; destacadas diversas funções (expressões), como funções de primeira ordem, disponíveis
;; em Clojure. Sua primeira tarefa será descrever cada uma destas funções e apresentar
;; dois exemplos de uso de cada uma delas. Lembre-se os exemplos precisam ser utilizados
;; de forma que o resultado da função possa ser visto no terminal.

;; Função de primeira ordem (First-class) é quando suas funções podem ser tratadas como outro tipo de variável, 
;; a função passada pode ser passada como um argumento em outros tipos de funções, fazendo com que outra função 
;; seja executada dentro da função que recebeu a função como argumento e assim, retornada e podendo ser atribuída
;; como um valor de uma variável.

;; Map
;; Recebe como entrada uma função e uma lista, retornando uma nova lista de mesmo tamanho
;; da lista da entrada, com a função sendo aplicada em cada elemento da lista.
(println "-------------------------------------------------------------")
(println "map: entrada: (str % \" - \" %) [1 2 3 4 5 6 7 8 9 10]; resultado: " (map #(str % " - " %) [1 2 3 4 5 6 7 8 9 10]))
(println "map: entrada: (mod 5 %) [1 2 3 4 5 6 7 8 9 10]; resultado: " (map #(mod 5 %) [1 2 3 4 5 6 7 8 9 10]))

;; Filter
;; Recebe como entrada uma função e uma lista, reotrnando uma nova lista com apenas
;; os elementos que foram setados como True.
(println "-------------------------------------------------------------")
(println "filter: entrada: odd? [1 2 3 4 5 6 7 8 9 10]; resultado: " (filter odd? [1 2 3 4 5 6 7 8 9 10]))
(println "filter: entrada: (= (mod % 4) 0) [1 2 3 4 5 6 7 8 9 10]; resultado: " (filter #(= (mod % 4) 0) [1 2 3 4 5 6 7 8 9 10]))

;;2. Utilizando a linguagem Clojure, crie uma função chamada ehPrimo 
;; que receba um inteiro e devolva True caso este inteiro 
;; seja verdadeiro e False caso contrário.

(defn ehPrimo [n]
  (if (<= n 1)
    false
    (if (<= n 3)
      true
      (if (and (zero? (mod n 2)) (zero? (mod n 3)))
        false
        true))))

;;3. Utilizando a linguagem Clojure, crie uma função chamada 
;; fatoresPrimos que receba um inteiro e devolva uma lista dos 
;; seus fatores primos. Decomposição em fatores primos é uma tarefa 
;; fundamental da aritmética.

(defn fatoresPrimos [n]
  (if (<= n 1)
    []
    (if (ehPrimo n)
      (list n)
      (loop [i 2]
        (if (>= i n)
          (list n)
          (if (zero? (mod n i))
            (concat (list i) (fatoresPrimos (/ n i)))
            (recur (inc i))))))))

;;4. Utilizando a linguagem Clojure, crie uma função chamada 
;; todosPrimos que receba dois valores inteiros e devolve todos 
;; os números primos que existam entre estes dois valores.

(defn todosPrimos [a b]
  (if (> a b)
    []
    (if (ehPrimo a)
      (concat (list a) (todosPrimos (inc a) b))
      (todosPrimos (inc a) b))))

;; Chamada das funções
(println "-------------------------------------------------------------")
(println "ehPrimo: entrada: 2; resultado: " (ehPrimo 2))
(println "ehPrimo: entrada: 6; resultado: " (ehPrimo 6))
(println "-------------------------------------------------------------")
(println "fatoresPrimos: entrada: 24; resultado: " (fatoresPrimos 24))
(println "fatoresPrimos: entrada: 12; resultado: " (fatoresPrimos 12))
(println "-------------------------------------------------------------")
(println "todosPrimos: entrada: 5 20; resultado: "(todosPrimos 5 20))
(println "todosPrimos: entrada: 1 10; resultado: "(todosPrimos 1 10))
(println "-------------------------------------------------------------")
