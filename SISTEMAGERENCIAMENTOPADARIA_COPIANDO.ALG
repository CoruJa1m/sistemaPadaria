Algoritmo "SistemaGerenciamentoPadaria_copiando"
Const
   MAX_PRODUTOS=20
   MAX_DIAS = 7

Var
   codigos: vetor[1..MAX_PRODUTOS] de inteiro
   nomes: vetor[1..MAX_PRODUTOS] de caractere
   precos: vetor[1..MAX_PRODUTOS] de real
   custos: vetor[1..MAX_PRODUTOS] de real
   estoques: vetor[1..MAX_PRODUTOS] de inteiro
   estoquesMinimos :vetor[1..MAX_PRODUTOS] de inteiro
   diasParaVencer: vetor[1..MAX_PRODUTOS] de inteiro



   vendas: vetor[1..MAX_PRODUTOS,1..MAX_DIAS]de inteiro

   faturamentoProduto: vetor[1..MAX_PRODUTOS] de real
   lucroProduto: vetor[1..MAX_PRODUTOS] de real
   qtdProdutos : inteiro
   opcao:inteiro

funcao buscarIndicePorCodigo(codigoBusca:inteiro):inteiro
var
   i:inteiro
inicio
   para i de 1 ate qtdProdutos faca
      se codigos[i] = codigoBusca entao
         retorne i
      fimse
   fimpara
   retorne - 1
fimfuncao

funcao buscaLinearPorNome (nomeBusca:caractere):inteiro
inicio
   i:inteiro
   para i de 1 ate qtdProdutos faca
      se nomes[i] = nomeBusca entao
         retorne i
      fimse
   fimpara
   retorne -1
fimfuncao


procedimento trocarProdutos(pos1,pos2:inteiro)
var
   temInt:inteiro
   temReal:inteiro
   tempChar:caractere
   d:inteiro

inicio

   tempInt  : codigos[pos1]
   codigos[pos1] := codigos[pos2]
   codigos[pos2] := tempInt

   tempChar := nomes[pos1]
   nomes[pos1] := nomes[pos2]
   nomes[pos2] := tempChar

   tempReal :=  custos[pos1]
   custos[pos1] := custos[pos2]
   custos[pos2] := tempReal

   tempInt := estoques[pos1]
   estoques[pos1] := estoques[pos2]
   estoques[pos2] := tempInt

   tempInt := estoquesMinimos[pos1]
   estoquesMinimos[pos1] := estoquesMinimos[pos2]
   estoquesMinimos[pos2] := tempInt

   tempInt := diasParaVencer[pos1]
   diasParaVencer[pos1] := diasParavencer[pos2]
   diasParaVencer[pos2] := tempInt


   tempReal := faturamentoProduto[pos1]
   faturamentoProduto[pos1] := faturamentoProduto[pos2]
   faturamentoProduto[pos2] := tempReal

   temReal := lucroProduto[pos1]
   lucroProduto[pos1] := lucroProduto[pos2]
   lucroProduto[pos2] := tempReal

   para d de 1 ate MAX_DIAS faca
      tempInt := vendas[pos1,d]
      vendas[pos1,d] := vendas[pos2,d]
      vendas[pos2,d] := tempInt
   fimpara
fimprocedimento

procedimento ordenarPorPreco()
var

   i,j,menor:inteiro
inicio

   se qtdProdutos = 0 entao
      escreval("nenhum produto cadastrado")
   senao
      para i de 1 ate qtdProdutos - 1 faca
         menor := i
         para j de 1 ate qtdProdutos faca
            se precos[j] < precos[menor] entao
               menor := j
            fimse
         fimpara
         se menor <> i entao
            trocarProdutos(i,menor)

         fimse
      fimpara
      escreval("produtos ordenados por preço com selection sort ")
   fimse
fimprocedimento

procedimento ordenarPorCodigo()
var
   i,j,menor:inteiro
inicio
   se qtdProdutos > 1 entao
      para i de 1 ate qtdProdutos - 1 faca
         menor := i
         para j de 1 ate qtdProdutos faca
            se codigo[j] := codigos[menor] entao
               menor := j
            fimse
         fimpara
         se menor <> i entao
            trocarProdutos (i,menor)
         fimse
      fimpara
   fimse
fimProcedimento


funcao buscaBinariaPorCodigo(codigoBusca: inteiro):inteiro
var
   inicioBusca,fimBusca,meio:inteiro
inicio
   ordenarPorCodigo()
   inicioBusca := 1
   fimBusca := qtdProdutos

   enquanto inicioBusca <= fimBusca faca
      meio := (inicioBusca + fimBusca) div 2
      se codigos[meio] = codigoBusca entao
         retorne meio
      senao
         se codigoBusca < codigo[meio] entao
            fimBusca := meio - 1
         senao
            inicioBusca := meio +1
         fimse
      fimse
   fimenquanto
   retorne -1
fimfuncao


funcao totalSemana(produto:inteiro;dia:inteiro):inteiro
inicio
   se dia > MAX_DIAS entao
      retorne 0
   senao
      retorne vendas[produto,dia]+ totalSemana[produto,dia]
   fimse
fimfuncao

procedimento inicializarMatrizes()
var
   i,d:inteiro
inicio
   para i de 1 ate MAX_PRODUTOS faca
      faturamentoProduto[i] := 0
      lucroProduto[i] := 0

      para d de 1 ate MAX_DIAS faca
         vendas[i,d] :=0
      fimpara
   fimpara
fimprocedimento

procedimento cadastrarProdutos()
var
   continuar:caractere
   codigoDigitalizado:inteiro
   indiceExistente:inteiro
inicio

   continuar := "s"
   enquanto (continuar = "S") ou (continuar = "s")faca
      se qtdProdutos >=  MAX_PRODUTOS entao
         escreval("limite maximo de produtos atingidos")
         continuar := "n"
      senao
         escreval("")
         escreval("======== cadastro de produtos=======")
         escreval("codigo: ")
         leia(codigoDigitado)
         indiceExistente := buscaIndicePorCodigo(codigoDigitado)

         se indiceExistente <> - 1 entao
            escreval("Erro: Já existe um produto com esse código")
         senao
            qtdProdutos := qtdProdutos + 1
            codigos[qtdProdutos] := codigoDigitado
            escreva("nome : ")
            leia(nomes[qtdProdutos])

            escreval("preço de venda: R$")
            leia(precos[qtdProdutos])

            escreva("custo de producao: R$")
            leia(custos[qtdProdutos])

            escreva("quantidade estoque :unidade ")
            leia(estoques[qtdProdutos])

            escreva("estoque minimo: ")
            leia(estoquesMinimos[qtdProdutos])

            escreva("dias para vencer: ")
            leia(diasParaVencer[qtdProdutos])

            escreval("produto cadastrado com sucesso")

            se (diasParaVencer[qtdProdutos] <= 2) e (estoques[qtdProdutos] > 0) entao
               escreval("atenção: produto perto do vencimento,sugerir promoção")

            fimse

            escreva("deseja cadastrar outro produto? (s/n):")
            leia(continuar)
         fimse
      fimse
   fimenquanto
fimprocedimento


procedimento registrarVenda()
var
   codigoBusca,quantidade,dia:inteiro
   formaPagamento:caractere
   indice:inteiro
   valorBruto,desconto,valorFinal,lucroVendaTotal
inicio
   se qtdProdutos = 0 entao
      escreval("nenhum produto cadastrado")
   senao
      escreva("")
      escreval("============registro venda==========")
      escreva("informe o dia da venda, de 1 a 7 :")
      leia(dia)

      se (dia <1) ou  (dia> 7) entao
         escreval("dia invalido")
      senao
         escreval("codigo do produto")
         leia(codigoBusca)

         indice := buscaIndicePorCodigo(codigoBusca)

         se indice = -1 entao
            escreval("produto nao encontrado")
         senao
            escreval("produto encontrado",nomes[indice])
            escreval("estoque atual",estoques[indice])
            escreva("quantidade vendida")
            leia(quantidade)

            escreva("forma de pagamento, ex: dinheiro,")
            leia(formaPagamento)

            se estoques[indice] >= quantidade entao
               valorBruto := precos[indice] * quantidade
               desconto := 0

               se (quantidade >= 10) ou (formaPagamento = "dinheiro")entao
                  desconto := valorBruto * 0.05
               fimse

               valorFinal := valorBruto - desconto
               lucroVendaAtual := valorFinal - (custos[indice]* quantidade)

               estoques[indice] := estoques[indice] - quantidade
               vendas[indice,dia] := vendas[indice,dia] + quantidade

               faturamentoProduto[indice] := faturamentoProduto[indice]+valor
               lucroProduto[indice] := lucroProduto[indice] + lucroVendaAtual

               escreval("")
               escreval("venda realizada com sucesso")
               escreval("valor bruto R$", valorBruto:6:2)
               escreval("desconto R$",desconto:6:2)
               escreval("valor final R$", valorFinal:6:2)
               escreval("lucro da venda: R$", lucroVendaAtual:6:2)
               escreval("estoque atualizado", estoques[indice])

               se estoques[indice]< estoquesMinimos[indice]entao
                  escreval("Alerta: estoque abaixo do minimo reposição necessaria ")
               fimse

               se(diasParaVender[indice] <= 2) e (estoques[indice] > 0 )entao
                  escreval("sugestao produto perto do vencimento criar promocao")
               fimse

            senao
               escreval("estoque insuficiente")
            fimse
         fimse
      fimse
   fimse
fimse
fimprocedimento


procedimento buscarProdutoPorNome()
var
   nomeBusca:caractere
   indice:inteiro
inicio
   se qtdProdutos = 0 entao
      escreval("nenhum produto cadastrado")
   senao
      escreval("")
      escreval("========= busca linear por nome")
      escreva("digite o nome do produto: ")
      leia(nomeBusca)

      indice:= buscaLinearPorNome(nomeBusca)
      se indice = -1 entao
         escreval("produto nao encontrado")
      senao
         escreval("produto encontrado")
         escreval("codigo: ",codigos[indice])
         escreval("nome: ",nomes[indice])
         escreval("preço",precos[indice])
         escreval("custo",custos´[indice])
         escreval("estoque",estoques[indice])
         escreval("estoque minimo",estoquesMinimos[indice])
         escreval("dias para vencer", diasParaVencer[indice])

      fimse
   fimse

fimprocedimento



procedimento mostrarMenu()
var
inicio
escreval("")
escreval("=======================")
escreval("SISTEMA PADARIA")
escreval("1 - Cadastrar produtos")
escreval("2 - Registrar venda")
escreval("3 - Buscar produto por nome")
escreval("4 - Buscar produto por código")
escreval("5 - Ordenar produtos")
escreval("6 - Relatório geral")
escreval("7 - Produtos com estoque baixo")
escreval("0 - Sair")
fimprocedimento



Inicio
qtdProdutos:=0
inicializarMatrizes()

repita
mostrarMenu()
leia(opcao)

escolha opcao
caso1
cadastrarProdutos()
caso2
regsitrarVenda()
caso3
buscarProdutosNomes()
caso4
// buscarProdutoPorCodigo
caso5
 //ordenarPorPreco
caso6

caso7


Fimalgoritmo