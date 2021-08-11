print("-" * 50)
print('Olá, seja bem-vindo(a) a calculadora polonesa reversa, por favor, siga a instruções à seguir...')
print("-" * 50)

class pilha(object):
  def inicia(self):
    self.elementos = []

  def mostra(self):
    return "elementos {0}".format(self.elementos)

  #adiciona o elemento ao topo da pila
  def adiciona(self, elemento):
    self.elementos.append(elemento)
  
  #retira o elementos mais recente adicionado a pilha
  def retira(self):
    return self.elementos.pop()

operacao = {"+" : lambda x, y : x + y,
            "-" : lambda x, y : x - y,
            "*" : lambda x, y : x * y,
            "/" : lambda x, y : x / y,
            "|" : lambda x, y : x ^ y,
            "&" : lambda x, y : x.sqrt}

def calculadora(pilha_operacao, pilha_numero, expressao, operacao):
  #pilha_operacao = operacao dentro da pilha
  #pilha_numero = implementa a estrutura pilha para os numeros
  #expressao = calculo em notacao polonesa
  #operacao = dicionario das operacoes

  #expressao
  expressao_list = []

  if type(expressao) == str:
    expressao_list = expressao.split('')
  
  elif type(expressao) == list:
    expressao_list = expressao
  
  else:
    print("Erro!")

#verificacao dos elementos na expressao

  if len(pilha_numero.elementos) == 2 and len(expressao_list) > 2:
    a = pilha_numero.retira()
    b = pilha_numero.retira()
    result = pilha_operacao.retira()(a, b)

    return pilha_operacao.retira()(result, calculadora(pilha_operacao,pilha_numero, expressao_list, operacao))
  
  elif len(pilha_operacao.elementos) == 1 and len(pilha_numero.elementos) == 2:
    a = pilha_numero.retira()
    b = pilha_numero.retira()
    result = pilha_operacao.retira()(a, b)
    return result

  elif expressao_list[0] in operacao.keys():
    key = expressao_list.pop(0)
    pilha_operacao.adiciona(operacao[key])
    return calculadora(pilha_operacao, pilha_numero, expressao_list, operacao)

  elif len(pilha_numero.elementos) < 2:
    num = int(expressao_list.pop(0))
    pilha_numero.adiciona(num)
    return calculadora(pilha_operacao, pilha_numero, expressao_list, operacao)  

calculadora()
