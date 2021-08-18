print("-" * 84)
print('Olá, seja bem-vindo(a) a calculadora polonesa reversa ^^, siga os passos a seguir...')
print("-" * 84)

operadores = {
  "+": (lambda a, b: a + b),
  "-": (lambda a, b: a - b),
  "*": (lambda a, b: a * b),
  "/": (lambda a, b: a / b),
  "|": (lambda a, b: a ** b),
  #"&": (lambda a, b: a ** 0.5)
}

def NPR(expressao):
    chave = expressao.split()
    pilha = []

    for token in chave:
        if token in operadores and operadores != "&":
            num2 = pilha.pop()
            num1 = pilha.pop()
            resultado = operadores[token](num1, num2)
            pilha.append(resultado)
        else:
            pilha.append(int(token))
    return pilha.pop()
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


##print(NPR("2 3 + "))
##print(NPR("2 3 4 *"))
##print(NPR("4 2 2 /"))
##print(NPR("4 2 |"))
#print(NPR("4 &"))
#print(NPR("(4 2 +) 3 *"))

"""  if operadores == "&":
                num2 = pilha.pop()
                resultado = operadores[token](num2)
                pilha.append(resultado) """

