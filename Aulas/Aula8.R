library(ggplot2)
library(class)
library(rpart)
library(rpart.plot)

cancer <- read.table(file = "cancer.csv", header = TRUE, sep = ",")
cancer <- na.omit(cancer)

n <- round(0.8 * nrow(cancer))

indices_treino <- sample(1:nrow(cancer), n, FALSE)

treino <- cancer[indices_treino,]
teste <- cancer[-indices_treino,]

modelo.arvore <- rpart(formula = diagnosis~., data = treino, method = "class")
rpart.plot(modelo.arvore, extra = 101)

previsao <- predict(modelo.arvore, newdata = teste, type = "class")
mean(previsao == teste$diagnosis)


