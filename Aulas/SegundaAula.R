a <- c(1,2,5)
b <- c(10,12)
d <- c(a,6)


3 * a
3+a
d + b

#for no r

x<-0
for(i in 1:20){
  x <- x + i
  print(x)
}



mean(resultados)
sum(resultados)

#aniversarios iguais 

calcula_probabilidade <- function(n){
  resultados<-c()
  i <- 0
  
  for(i in 1:10000){
    aniversarios <- sample(x = 1:365, size = n, replace = TRUE)
    resultados[i] <- any(duplicated(aniversarios))
  }
  print(mean(resultados))
}

calcula_probabilidade(n=10)

#Mega-Sena

bilhete <- c(1,2,3,4,5,6)
tempoGasto <- c()
h <- 0

for(h in 1:10000){
  semanas <- 0
  acertos <- 0
  
  while(acertos < 4){
    sorteio <- sample(x = 1:60, size = 6, replace=FALSE)
    acertos <- sum(bilhete %in% sorteio)
    semanas <- semanas + 1
  }
  tempoGasto[h] <- (semanas*7)/365
}
mean(tempoGasto)

