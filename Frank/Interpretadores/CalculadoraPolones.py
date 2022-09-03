print("-" * 84)
print('Olá, seja bem-vindo(a) a calculadora polonesa reversa ^^, siga os passos a seguir...')
print("-" * 84)

#juntei os operadores em um só para otimizar os calculos, exceto a raiz
operadores = {
  "+": (lambda a, b: a + b),
  "-": (lambda a, b: a - b),
  "*": (lambda a, b: a * b),
  "/": (lambda a, b: a / b),
  "|": (lambda a, b: a ** b)
}

#criei a funcao raiz para contornar um problema que nao estava conseguindo resolvendo no lambda
def raiz(expressao):
    chave = expressao.split() #chave para dividir a expressao = NUM e OP. EX:("2" e "+")
    pilha = [] #pilha para adequar os espaços

    for i in chave: #validacao da chave
        if i == "&": #se for igual ao elemento
            operador = chave.pop() #valor &
            num = chave.pop() #é usado para remover um elemento na lista e retorna o valor do mesmo
            resultado1 = float(num) ** 0.5 #variavel para converter a operacao em float e fazer o calculo do "num"
            chave.append(resultado1) #adiciona o resultado acima a chave
            return chave
#funcao da calculadora propriamente dito
def NPR(expressao):
  
    numeros = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
    chave = expressao.split()
    pilha = []

    for token in chave:
      if token == "(" or token == ")" or token == " ":
         chave.remove(token)

    for i in pilha:   # estrutura de repetição para modificaro tipo dos numeros: string -> int
            if i in numeros:   # condicional if para encontrar os numeros na lista de numeros
                j = int(i)    # a variavel j armazena o valor do elemento do tipo int
                k = pilha.index(i)  # k é a variavel que armazena o valor do indice do valor elemento
                pilha[k] = j  # o valor elemento do tipo string é substituido por j do tipo int

    for token in chave:
        if token in operadores:
            num2 = pilha.pop() #retorna o ultimo elemento do num 2
            num1 = pilha.pop() ##retorna o ultimo elemento do num 1
            resultado = operadores[token](num1, num2) #crio outra variavel para usar o operadores criados na linha 6 e adequo os espacos correspondentes
            pilha.append(resultado)
        
        elif token == "&": #verificao para contornar o problema na raiz (explicado na linha 14)
            pilha.pop()
            pilha.append(raiz(expressao))
            print(pilha[0]) #apresento o valor da pilha com o ultimo valor
        
        else:
            pilha.append(int(token)) #transformo a pilha em um inteiro
    print(pilha)
    print("Operação concluída")


loop = True
while loop: #loop para o menu
   
    expressao = input("Digite a expressão que deseja calcular: ")
    print(NPR(expressao))
    pergunta = input("Deseja calcular novamente? (S ou N): ")
    if pergunta == "S" or pergunta == "s":
        loop = True
    else:
        print("OK! Finalizando")
        break


##print(NPR("2 3 + ")) = 5
##print(NPR("2 3 4 *")) = 24
##print(NPR("4 2 2 /")) = 1
##print(NPR("4 2 |")) = 16
#print(NPR("4 &")) = 2
#print(NPR("(4 2 +) 3 *")) = 18
