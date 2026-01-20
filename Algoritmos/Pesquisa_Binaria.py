# Exercícios do Livro Entendendo Algoritmos


# Exemplo:
def pesquisa_binaria(valores, valor):
    baixo = 0
    alto = len(valores) - 1

    while baixo <= alto:

        meio = int((alto + baixo) / 2)
        chute = valores[meio]

        if chute == valor:
            return meio

        if chute > valor:
            alto = meio - 1

        else:
            baixo = meio + 1

    return None


valores = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
print(pesquisa_binaria(valores, 10))  # => Retorna o indice 9
print(pesquisa_binaria(valores, 12))  # => Retorna None
