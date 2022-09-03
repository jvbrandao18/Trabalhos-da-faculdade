print("-" * 50)
print('Olá, seja bem-vindo(a) a calculadora, por favor, siga a instruções a seguir...')
print("-" * 50)

def calcular():
  num1 = int(input('Digite o primeiro número: '))
  num2 = int(input('Digite o segundo número: '))

  operacao = input("Por favor, digite o tipo de operação matemática desejada:")

  #soma
  if operacao == "+":
    print("A sua soma é:", num1 + num2)

  #subtração
  elif operacao == "-":
    print("A sua subtração é:", num1 - num2)

  #divisão
  elif operacao == "/":
    print("A sua divisão é:", num1 / num2)

  #multiplicação
  elif operacao == "*":
    print("A sua multiplicação é:", num1 * num2)

  else:
    print("Por favor, selecione uma operação válida!")
calcular()

#menu de reentrada
loop = True
while loop:
    pergunta = input("Deseja calcular novamente? (S ou N): ")
    if pergunta == "S" or pergunta == "s":
        calcular()
    else:
        print("OK! Finalizando")
        break
