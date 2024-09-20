#Operações básicas do R

1 + 2 #adição
1 - 6 #subtração
3 * 4 #multiplicação
4 / 9 #divisão
3 ** 6 #potenciação
3 ^ 6 #outra potenciação

a <- 123 * 98
12 + 1245 -> b
class(a)

w <- "furiosa"
class(w)

y <- TRUE
class(y)

a + b
a + w
a + y


#Vetores

x <- c(23,10,45)
x
d <- c(x,45)
d + c(TRUE,FALSE)

x[c(2,3,3)]

sum(x < 30)
x[x < 30]
which(x < 30)

v <- c(12, 34, "vasco")
p <- 1026:121025
p[8]


dado1<- sample (x=1:6, size = 10000, replace = TRUE)
dado1

sum(dado1 == 3)
mean(dado1 == 3)

dado2 <- sample (x = 1:6, size = 10000, replace = TRUE)

soma <- dado1 + dado2
soma[1:10]
mean(soma == 3)

dado3 <- sample (x = 1:6, size = 10, replace = TRUE)
mean(dado3 == 3)