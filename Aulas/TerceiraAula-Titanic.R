dados <- read.table(file = "titanic.txt",header = TRUE, sep = ",")

#retira a coluna PassengerID
dados <- dados[,-1] 
summary(dados)

#Calculando vivos e mortos
vivos <- sum(dados[,1])
mortos <- length(dados[,1]) - sum(dados[,1])

#Transformando colunas em categorias
dados$Survived <- as.factor(dados$Survived)
dados$Sex <- as.factor(dados$Sex)
dados$Pclass <- as.factor(dados$Pclass)

str(dados)
 
#Gráfico de quantos homens morreram
homens <- dados[dados$Sex == 'male',]
summary(homens)
barplot(table(homens$Survived))

#Gráfico de quantas mulheres morreram
mulheres <- dados[dados$Sex == 'female',]
barplot(table(mulheres$Survived))

#Gráfico de crianças
criancas <- dados[dados$Age < 18,]
barplot(table(criancas$Survived))

#Gráfico de Mulheres e Crianças
criancasemulheres <- dados[((dados$Age < 12) | (dados$Sex == 'female')),]
ggplot(data = )

#Homens da Terceira Classe que Morreram
TercClasseMen <- homens[homens$Pclass == 3,] 
summary(TercClasseMen)

