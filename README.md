# 📝 Today I Learned (TIL)
Este Repositório é voltado para registrar meus estudos e a parte prática. Aqui há arquivos pequenos, trechos de código, conceitos, sintaxes e soluções que aprendo no dia a dia

## 📂 Categorias (até o momento)

### Sumário
1. [Banco de Dados](sql-e-banco-de-dados)
2. [Testes em Python](testes-em-python)

---

### SQL & Banco de Dados
* **Fundamentos e Sintaxe Básicas** - *INSERT*, *SELECT*, *DELETE*, *UPDATE* com filtros (*BETWEEN*, *IN*, *LIKE*) e ordenação.
* **Relacionamento** - Prática de *INNER JOIN*, *LEFT-JOIN*, *RIGHT-JOIN* com conexões entre tabelas.
* **Manipulação de Dados** - Uso de *CONCAT*, *MAX*, *AVG*, *COUNT* para manipulação e queries mais estruturadas.

### Tecnologias Utilizadas
* [MySQL](https://www.mysql.com/)
* [Docker](https://www.docker.com/)
* [DBeaver](https://dbeaver.io/)

#### Testes em Python

* **TDD** - Test driven development *(Desenvolvimento dirigido por testes)* se baseia em três etapas para o desenvolvimento de features. São ela *Red Green* e *Refactor*. 

* **Doctests** - São usadas dentro de docstrings e podem servir como exemplos para demonstrar o comportamente da função enquanto é usada para representar diferentes casos.

* **Unittest** - Unittest é um biblioteca padrão que permite orgazinar testes em classes e testar funções individualmente para analisar como performam através de dados que são recebidos e comparados com o resultado esperado. Se o resultado do teste não corresponde com o esperado, retornará uma flag. Isso é checado fornecendo o dado pronto para comparação e usando Assert para tratar se realmente está funcionando como esperado.

### Como Rodar os Testes

Dentro do VsCode é possível utilizar a aba `Testing` que disponibiliza uma interface para gerenciar e visualizar o histórico de execução, permitindo rodar desde um único teste isolado até a suíte completa.

---
ou no terminal acessando a pasta

```text
Python_Testes:.
│   main.py
│  
├───tests             <-- Pasta de testes 📌
```
Após acessar a pasta execute o comando:
```
python -m unittest -v
```
Assim irá executar todos os testes dentro da pasta de uma só vez

### Tecnologias Utilizadas
* [Doctestes](https://docs.python.org/3/library/doctest.html)
* [Unittest](https://docs.python.org/3/library/unittest.html)
