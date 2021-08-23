print("-" * 84)
print('Olá, seja bem-vindo(a) a calculadora polonesa reversa ^^, siga os passos a seguir...')
print("-" * 84)

operadores = {
  "+": (lambda a, b: a + b),
  "-": (lambda a, b: a - b),
  "*": (lambda a, b: a * b),
  "/": (lambda a, b: a / b),
  "|": (lambda a, b: a ** b)
}

def raiz(expressao):
    chave = expressao.split()
    pilha = []

    for i in chave:
        if i == "&":
            operador = chave.pop() #valor &
            num = chave.pop()
            resultado1 = float(num) ** 0.5
            chave.append(resultado1)
            return chave

def NPR(expressao):
    chave = expressao.split()
    pilha = []

    for token in chave:
        if token in operadores:
            num2 = pilha.pop()
            num1 = pilha.pop()
            resultado = operadores[token](num1, num2)
            pilha.append(resultado)
            print(pilha)

        elif token == "&":
            pilha.pop()
            pilha.append(raiz(expressao))
            print(pilha[0])
        else:
            pilha.append(int(token))
    print("Operação concluída")
loop = True
while loop:
   
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
