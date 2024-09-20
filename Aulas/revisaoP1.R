#Problema1

jogoJorel <- function(){
  juju <- 18
  jorel <- 7
  
  moeda <- c("Cara", "Coroa")
  
  while(juju > 0 && jorel > 0){
    jogo <- sample(x = moeda, size = 1, replace = FALSE)
    if(jogo == "Coroa"){
      jorel <- jorel + 1
      juju <- juju - 1
    }
    else{
      jorel <- jorel - 1
      juju <- juju + 1
    }
  }
  
  if(juju == 25) return ("juju")
  else return ("jorel")
}

N <- 10000
jogos <- c()

for(i in 1:N){
  jogos <- c(jogos, jogoJorel())
}

jujuVitorias <- mean(jogos == "juju")
jujuVitorias
jorelVitorias <- mean(jogos == "jorel")
jorelVitorias


#Problema2

urnaCompleta <- function(){
  bilhetes <- c()
  N <- 0
  
  while(length(unique(bilhetes)) < 30){
    bilhete <- sample(x = 1:30, size = 1, replace = TRUE)
    bilhetes <- c(bilhetes, bilhete)
    N <- N + 1
  }
  
  nro <- length(bilhetes)
  return(nro)
}

qtdadeVezes <- c()

for(j in 1:10000){
  result <- urnaCompleta()
  qtdadeVezes <- c(qtdadeVezes,result)
}

media <- mean(qtdadeVezes)
media

#Problema2 probabilidade

urnaCompletaPROB <- function(){
  probabilidade <- c(1, rep(10,29))
  bilhetes <- c()
  N <- 0
  
  while(length(unique(bilhetes)) < 30){
    bilhete <- sample(x = 1:30, size = 1, replace = TRUE, prob = probabilidade)
    bilhetes <- c(bilhetes, bilhete)
    N <- N + 1
  }
  
  nro <- length(bilhetes)
  return(nro)
}

qtdadeVezes <- c()

for(j in 1:10000){
  result <- urnaCompletaPROB()
  qtdadeVezes <- c(qtdadeVezes,result)
}

media <- mean(qtdadeVezes)
media

#Problema3
library(ggplot2)

chicago <- read.csv(file = "chicago.csv", header = TRUE, sep = ",")
chicago <- chicago[,-1]
chicago$season <- as.factor(chicago$season)

qtdadeCardiovasculares <- sum(chicago$cvd)

ggplot(data = chicago, aes(x = time, y = temp, color = season))+
  geom_point()+
  theme_minimal()


#Problema4

papagaio <- read.table(file = "papagaio.txt", header = TRUE, sep = ",")
papagaio$especie <- as.factor(papagaio$especie)

