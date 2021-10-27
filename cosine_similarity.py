# Alex Cohen Dambrós Lopes
# Carlos Henrique Moreira dos Santos
# Caio Henrique Martins dos Santos
# Gabriel Scholze Rosa
# João Vitor Brandão
# Manoel Felipe de Almeida Bina
# Matheus Laindorfi Muller
# Nicholas Davi da Cruz

import math
import string
import sys

def ler_arquivo(filename): # leitura do arquivo e retorna listas das linhas no texto
    try:
        with open(filename, 'r') as a:
            data = a.read()
        return data
        
    except IOError:
        print("Erro no arquivo!: ", filename)
        sys.exit()


# divide as linhas em palavras e utiliza uma variável global para mapear os upper, lower cases e espaços
transforma = str.maketrans(string.punctuation+string.ascii_uppercase," "*len(string.punctuation)+string.ascii_lowercase)

     
def palavras_por_linha(texto): # lista de palavras no arquivo  
    texto = texto.translate(transforma)
    lista_de_palavras = texto.split()
    return lista_de_palavras
  

def frequencia(lista_de_palavras): # conta as frequencias de cada palavra e retorna o mapeamento das palavras com suas respectivas frequencias
    D = {}
    for new_word in lista_de_palavras:
        if new_word in D:
            D[new_word] = D[new_word] + 1
        else:
            D[new_word] = 1
    return D


def freq_de_palavra_no_arq(filename):# retorna as palavras e frequencias anteriores  
    lista_de_linhas = ler_arquivo(filename)
    lista_de_palavras = palavras_por_linha(lista_de_linhas)
    freq_mapping = frequencia(lista_de_palavras)
  
    print("Arquivo:", filename)
    print("Linhas: ", len(lista_de_linhas))
    print("Palavras: ", len(lista_de_palavras))
    print("Palavras distintas:", len(freq_mapping))
    return freq_mapping
  

def pontos(D1, D2): # pontos nos arquivos
    Sum = 0.0
    for key in D1:
        if key in D2:
            Sum += (D1[key] * D2[key])
    return Sum
  

def angulo_do_vetor(D1, D2): # angulo em radianos dos dois arquivos
    numerator = pontos(D1, D2)
    denominator = math.sqrt(pontos(D1, D1)*pontos(D2, D2))
    return math.acos(numerator / denominator)
  
  
def cosine_similarity(filename_1, filename_2):
    sorted_lista_de_palavras_1 = freq_de_palavra_no_arq(filename_1)
    sorted_lista_de_palavras_2 = freq_de_palavra_no_arq(filename_2)
    distance = angulo_do_vetor(sorted_lista_de_palavras_1, sorted_lista_de_palavras_2)
      
    print("A similaridade entre os dois documentos é: % 0.6f (radianos)"% distance)

cosine_similarity('artigo1.txt', 'artigo2.txt')