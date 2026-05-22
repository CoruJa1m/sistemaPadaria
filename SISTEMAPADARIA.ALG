Algoritmo "sistemaPadaria"
Var
  opcao:inteiro
  n:inteiro
  nomes: vetor[1..20] de caractere
  dados: vetor[1..20,1..5] de real
  ocupado: vetor[1..20] de logico
  
  
  procedimento cadastrarProduto(posicao:inteiro)

  Inicio
   se ocupado[posicao] = falso entao

      escreval("Digite o nome do produto")
      leia(nomes[posicao])

      escreval("Digite o preco de venda ")
      leia(dados[posicao,2])

      escreval("Digite o custo de produção")
      leia(dados[posicao,3])

      escreval("Digite a quantidade em estoque")
      leia(dados[posicao,4])
      
      escreval("Digite o estoque minimo")
      leia(dados[posicao,5])

      ocupado[posicao] := verdadeiro

      escreval("Produto cadastrado!!!")
      
       senao

      escreval("Posição já ocupada, digite novamente")
      //cadastrarProduto(n)

   fimse

  fimProcedimento
  
  
  procedimento registrarVenda(posicao:inteiro)
  Inicio
  
  fimProcedimento
  
  
  


Inicio
repita
 escreval("=================")
 escreval("Padaria do seu Zé")
 escreval("=================")
 
 escreval("=================")
 escreval("Digite a opção desejada")
 escreval("1 - Cadastrar produtos")
 escreval("2 - Registrar venda")
 escreval("3 - Buscar produto por nome")
 escreval("4 - Buscar produto por código" )
 escreval("5 - Ordenar produtos")
 escreval("6 - Relatório geral")
 escreval("7 - Produtos com estoque baixo")
 escreval("0 - Sair")
 escreval("=================")
 leia(opcao)
 
  Escolha opcao
  Caso 1
  escreval("digite o numero de 1 a 20 ")
  leia(n)
  cadastrarProduto(n)
  escreval("Produto: ", nomes[1])
//escreval("Preço de venda: ", dados[1,1])
//escreval("Custo de produção: ", dados[1,2])
//escreval("Quantidade estoque: ", dados[1,3])
//escreval("Estoque mínimo: ", dados[1,4])
  Caso 2
  escreval("C")
  Caso 3
  escreval("D")
  Caso 4
  escreval("E")
  Caso 5
  escreval("F")
  Caso 6
  escreval("G")
   Caso 7
  escreval("H")
  fimEscolha
  
  ate (opcao=0)
  escreval("codigo finalizado")

Fimalgoritmo