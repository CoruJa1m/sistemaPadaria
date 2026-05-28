Algoritmo "SistemaGerenciamentoPadaria"

Const
   MAX_PRODUTOS = 20
   MAX_DIAS = 7

Var

   codigos: vetor[1..MAX_PRODUTOS] de inteiro
   nomes: vetor[1..MAX_PRODUTOS] de caractere
   precos: vetor[1..MAX_PRODUTOS] de real
   custos: vetor[1..MAX_PRODUTOS] de real
   estoques: vetor[1..MAX_PRODUTOS] de inteiro
   estoquesMinimos: vetor[1..MAX_PRODUTOS] de inteiro
   diasParaVencer: vetor[1..MAX_PRODUTOS] de inteiro

   vendas: vetor[1..MAX_PRODUTOS,1..MAX_DIAS] de inteiro

   faturamentoProduto: vetor[1..MAX_PRODUTOS] de real
   lucroProduto: vetor[1..MAX_PRODUTOS] de real

   qtdProdutos: inteiro
   opcao: inteiro


funcao buscarIndicePorCodigo(codigoBusca: inteiro): inteiro
var
   i: inteiro
inicio

   para i de 1 ate qtdProdutos faca

      se codigos[i] = codigoBusca entao
         retorne i
      fimse

   fimpara

   retorne -1

fimfuncao


funcao buscaLinearPorNome(nomeBusca: caractere): inteiro
var
   i: inteiro
inicio

   para i de 1 ate qtdProdutos faca

      se nomes[i] = nomeBusca entao
         retorne i
      fimse

   fimpara

   retorne -1

fimfuncao


procedimento trocarProdutos(pos1,pos2: inteiro)

var

   tempInt: inteiro
   tempReal: real
   tempChar: caractere
   d: inteiro

inicio

   tempInt <- codigos[pos1]
   codigos[pos1] <- codigos[pos2]
   codigos[pos2] <- tempInt

   tempChar <- nomes[pos1]
   nomes[pos1] <- nomes[pos2]
   nomes[pos2] <- tempChar

   tempReal <- precos[pos1]
   precos[pos1] <- precos[pos2]
   precos[pos2] <- tempReal

   tempReal <- custos[pos1]
   custos[pos1] <- custos[pos2]
   custos[pos2] <- tempReal

   tempInt <- estoques[pos1]
   estoques[pos1] <- estoques[pos2]
   estoques[pos2] <- tempInt

   tempInt <- estoquesMinimos[pos1]
   estoquesMinimos[pos1] <- estoquesMinimos[pos2]
   estoquesMinimos[pos2] <- tempInt

   tempInt <- diasParaVencer[pos1]
   diasParaVencer[pos1] <- diasParaVencer[pos2]
   diasParaVencer[pos2] <- tempInt

   tempReal <- faturamentoProduto[pos1]
   faturamentoProduto[pos1] <- faturamentoProduto[pos2]
   faturamentoProduto[pos2] <- tempReal

   tempReal <- lucroProduto[pos1]
   lucroProduto[pos1] <- lucroProduto[pos2]
   lucroProduto[pos2] <- tempReal

   para d de 1 ate MAX_DIAS faca

      tempInt <- vendas[pos1,d]
      vendas[pos1,d] <- vendas[pos2,d]
      vendas[pos2,d] <- tempInt

   fimpara

fimprocedimento


procedimento ordenarPorPreco()

var

   i,j,menor: inteiro

inicio

   se qtdProdutos = 0 entao

      escreval("Nenhum produto cadastrado.")

   senao

      para i de 1 ate qtdProdutos - 1 faca

         menor <- i

         para j de i+1 ate qtdProdutos faca

            se precos[j] < precos[menor] entao
               menor <- j
            fimse

         fimpara

         se menor <> i entao
            trocarProdutos(i,menor)
         fimse

      fimpara

      escreval("Produtos ordenados por preco.")

   fimse

fimprocedimento


procedimento ordenarPorCodigo()

var

   i,j,menor: inteiro

inicio

   para i de 1 ate qtdProdutos - 1 faca

      menor <- i

      para j de i+1 ate qtdProdutos faca

         se codigos[j] < codigos[menor] entao
            menor <- j
         fimse

      fimpara

      se menor <> i entao
         trocarProdutos(i,menor)
      fimse

   fimpara

fimprocedimento


funcao buscaBinariaPorCodigo(codigoBusca: inteiro): inteiro

var

   inicioBusca,fimBusca,meio: inteiro

inicio

   ordenarPorCodigo()

   inicioBusca <- 1
   fimBusca <- qtdProdutos

   enquanto inicioBusca <= fimBusca faca

      meio <- (inicioBusca + fimBusca) div 2

      se codigos[meio] = codigoBusca entao

         retorne meio

      senao

         se codigoBusca < codigos[meio] entao
            fimBusca <- meio - 1
         senao
            inicioBusca <- meio + 1
         fimse

      fimse

   fimenquanto

   retorne -1

fimfuncao


funcao totalSemana(produto: inteiro; dia: inteiro): inteiro
inicio

   se dia > MAX_DIAS entao
      retorne 0
   senao
      retorne vendas[produto,dia] + totalSemana(produto,dia+1)
   fimse

fimfuncao


procedimento inicializarMatrizes()

var

   i,d: inteiro

inicio

   para i de 1 ate MAX_PRODUTOS faca

      faturamentoProduto[i] <- 0
      lucroProduto[i] <- 0

      para d de 1 ate MAX_DIAS faca
         vendas[i,d] <- 0
      fimpara

   fimpara

fimprocedimento


procedimento cadastrarProdutos()

var

   continuar: caractere
   codigoDigitado: inteiro
   indiceExistente: inteiro

inicio

   continuar <- "S"

   enquanto (continuar = "S") ou (continuar = "s") faca

      se qtdProdutos >= MAX_PRODUTOS entao

         escreval("Limite maximo atingido.")
         continuar <- "N"

      senao

         escreval("")
         escreval("++++++++++ CADASTRO DE PRODUTOS ++++++++++")

         escreva("Codigo: ")
         leia(codigoDigitado)

         indiceExistente <- buscarIndicePorCodigo(codigoDigitado)

         se indiceExistente <> -1 entao

            escreval("Ja existe produto com esse codigo.")

         senao

            qtdProdutos <- qtdProdutos + 1

            codigos[qtdProdutos] <- codigoDigitado

            escreva("Nome: ")
            leia(nomes[qtdProdutos])

            escreva("Preco: ")
            leia(precos[qtdProdutos])

            escreva("Custo: ")
            leia(custos[qtdProdutos])

            escreva("Estoque: ")
            leia(estoques[qtdProdutos])

            escreva("Estoque minimo: ")
            leia(estoquesMinimos[qtdProdutos])

            escreva("Dias para vencer: ")
            leia(diasParaVencer[qtdProdutos])

            escreval("Produto cadastrado com sucesso.")

            se (diasParaVencer[qtdProdutos] <= 2) e
               (estoques[qtdProdutos] > 0) entao

               escreval("Produto perto do vencimento.")

            fimse

         fimse

         escreva("Cadastrar outro? (S/N): ")
         leia(continuar)

      fimse

   fimenquanto

fimprocedimento


procedimento registrarVenda()

var

   codigoBusca: inteiro
   quantidade: inteiro
   dia: inteiro
   indice: inteiro

   formaPagamento: caractere

   valorBruto: real
   desconto: real
   valorFinal: real
   lucroVendaAtual: real

inicio

   se qtdProdutos = 0 entao

      escreval("Nenhum produto cadastrado.")

   senao

      escreval("")
      escreval("+++++++++++ REGISTRO DE VENDA +++++++++++")

      escreva("Dia da venda (1 a 7): ")
      leia(dia)

      se (dia < 1) ou (dia > 7) entao

         escreval("Dia invalido.")

      senao

         escreva("Codigo do produto: ")
         leia(codigoBusca)

         indice <- buscarIndicePorCodigo(codigoBusca)

         se indice = -1 entao

            escreval("Produto nao encontrado.")

         senao

            escreval("Produto: ", nomes[indice])
            escreval("Estoque atual: ", estoques[indice])

            escreva("Quantidade vendida: ")
            leia(quantidade)

            escreva("Forma pagamento: ")
            leia(formaPagamento)

            se quantidade <= 0 entao

               escreval("Quantidade invalida.")

            senao

               se estoques[indice] >= quantidade entao

                  valorBruto <- precos[indice] * quantidade

                  desconto <- 0

                  se (quantidade >= 10) ou
                     (formaPagamento = "dinheiro") entao

                     desconto <- valorBruto * 0.05

                  fimse

                  valorFinal <- valorBruto - desconto

                  lucroVendaAtual <- valorFinal -
                  (custos[indice] * quantidade)

                  estoques[indice] <-
                  estoques[indice] - quantidade

                  vendas[indice,dia] <-
                  vendas[indice,dia] + quantidade

                  faturamentoProduto[indice] <-
                  faturamentoProduto[indice] + valorFinal

                  lucroProduto[indice] <-
                  lucroProduto[indice] + lucroVendaAtual

                  escreval("")
                  escreval("Venda realizada com sucesso.")
                  escreval("Valor bruto: R$ ", valorBruto:6:2)
                  escreval("Desconto: R$ ", desconto:6:2)
                  escreval("Valor final: R$ ", valorFinal:6:2)
                  escreval("Lucro venda: R$ ", lucroVendaAtual:6:2)

                  escreval("Estoque atualizado: ",
                  estoques[indice])

                  se estoques[indice] <
                     estoquesMinimos[indice] entao

                     escreval("ALERTA: estoque abaixo do minimo.")

                  fimse

               senao

                  escreval("Estoque insuficiente.")

               fimse

            fimse

         fimse

      fimse

   fimse

fimprocedimento


procedimento buscarProdutoPorNome()

var

   nomeBusca: caractere
   indice: inteiro

inicio

   se qtdProdutos = 0 entao

      escreval("Nenhum produto cadastrado.")

   senao

      escreval("")
      escreval("++++++++++++ BUSCA POR NOME ++++++++++++")

      escreva("Digite o nome: ")
      leia(nomeBusca)

      indice <- buscaLinearPorNome(nomeBusca)

      se indice = -1 entao

         escreval("Produto nao encontrado.")

      senao

         escreval("Produto encontrado.")
         escreval("Codigo: ", codigos[indice])
         escreval("Nome: ", nomes[indice])
         escreval("Preco: ", precos[indice]:6:2)
         escreval("Custo: ", custos[indice]:6:2)
         escreval("Estoque: ", estoques[indice])

      fimse

   fimse

fimprocedimento


procedimento buscaProdutoPorCodigo()

var

   codigoBusca: inteiro
   indice: inteiro

inicio

   escreval("")
   escreval("++++++++++++ BUSCA POR CODIGO ++++++++++++")

   escreva("Digite o codigo: ")
   leia(codigoBusca)

   indice <- buscaBinariaPorCodigo(codigoBusca)

   se indice = -1 entao

      escreval("Produto nao encontrado.")

   senao

      escreval("Produto encontrado.")
      escreval("Codigo: ", codigos[indice])
      escreval("Nome: ", nomes[indice])
      escreval("Preco: ", precos[indice]:6:2)
      escreval("Estoque: ", estoques[indice])

   fimse

fimprocedimento


procedimento listarProdutos()

var

   i: inteiro

inicio

   se qtdProdutos = 0 entao

      escreval("Nenhum produto cadastrado.")

   senao

      escreval("")
      escreval("============ LISTA DE PRODUTOS ============")

      para i de 1 ate qtdProdutos faca

         escreval("----------------------------------")
         escreval("Codigo: ", codigos[i])
         escreval("Nome: ", nomes[i])
         escreval("Preco: R$ ", precos[i]:6:2)
         escreval("Custo: R$ ", custos[i]:6:2)
         escreval("Estoque: ", estoques[i])
         escreval("Estoque minimo: ", estoquesMinimos[i])
         escreval("Dias para vencer: ",
         diasParaVencer[i])

      fimpara

   fimse

fimprocedimento


procedimento relatorioGeral()

var

   i: inteiro
   totalFaturamento: real
   totalLucro: real

inicio

   totalFaturamento <- 0
   totalLucro <- 0

   escreval("")
   escreval("============== RELATORIO ==============")

   para i de 1 ate qtdProdutos faca

      escreval("--------------------------------")
      escreval("Produto: ", nomes[i])

      escreval("Total vendido semana: ",
      totalSemana(i,1))

      escreval("Faturamento: R$ ",
      faturamentoProduto[i]:6:2)

      escreval("Lucro: R$ ",
      lucroProduto[i]:6:2)

      totalFaturamento <- totalFaturamento +
      faturamentoProduto[i]

      totalLucro <- totalLucro +
      lucroProduto[i]

   fimpara

   escreval("")
   escreval("FATURAMENTO TOTAL: R$ ",
   totalFaturamento:6:2)

   escreval("LUCRO TOTAL: R$ ",
   totalLucro:6:2)

fimprocedimento


procedimento produtosEstoqueBaixo()

var

   i: inteiro
   encontrou: logico

inicio

   encontrou <- falso

   escreval("")
   escreval("========= ESTOQUE BAIXO =========")

   para i de 1 ate qtdProdutos faca

      se estoques[i] < estoquesMinimos[i] entao

         encontrou <- verdadeiro

         escreval("--------------------------------")
         escreval("Codigo: ", codigos[i])
         escreval("Nome: ", nomes[i])
         escreval("Estoque atual: ", estoques[i])
         escreval("Estoque minimo: ",
         estoquesMinimos[i])

      fimse

   fimpara

   se encontrou = falso entao
      escreval("Nenhum produto com estoque baixo.")
   fimse

fimprocedimento


procedimento mostrarMenu()

inicio

   escreval("")
   escreval("===================================")
   escreval(" SISTEMA DE GERENCIAMENTO PADARIA ")
   escreval("===================================")

   escreval("1 - Cadastrar produtos")
   escreval("2 - Registrar venda")
   escreval("3 - Buscar produto por nome")
   escreval("4 - Buscar produto por codigo")
   escreval("5 - Ordenar produtos por preco")
   escreval("6 - Relatorio geral")
   escreval("7 - Produtos estoque baixo")
   escreval("8 - Listar produtos")
   escreval("0 - Sair")

fimprocedimento


Inicio

   qtdProdutos <- 0

   inicializarMatrizes()

   repita

      mostrarMenu()

      escreva("Escolha: ")
      leia(opcao)

      escolha opcao

         caso 1
            cadastrarProdutos()

         caso 2
            registrarVenda()

         caso 3
            buscarProdutoPorNome()

         caso 4
            buscaProdutoPorCodigo()

         caso 5
            ordenarPorPreco()
            listarProdutos()

         caso 6
            relatorioGeral()

         caso 7
            produtosEstoqueBaixo()

         caso 8
            listarProdutos()

         caso 0
            escreval("Encerrando sistema...")

         outrocaso
            escreval("Opcao invalida.")

      fimescolha

   ate opcao = 0

Fimalgoritmo