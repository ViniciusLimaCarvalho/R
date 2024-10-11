data(iris)

library(ggplot2)

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width))+
  geom_point()

cor(iris$Petal.Length, iris$Petal.Width)
cor(iris[,-5])

setosa <- iris[iris$Species == 'setosa',]
cor(setosa$Petal.Length, setosa$Petal.Width)

versicolor <- iris[iris$Species == 'versicolor',]
cor(versicolor$Petal.Length, versicolor$Petal.Width)

virginica <- iris[iris$Species == 'virginica',]
cor(virginica$Petal.Length, virginica$Petal.Width)



femur <- read.csv(file = "femur.csv")
femur <- femur[,-1]


cor(femur$femur, femur$altura)

homens <- femur[femur$genero == "Male",]
mulheres <- femur[femur$genero == "Female",]

cor(homens$femur, homens$altura)
cor(mulheres$femur, mulheres$altura)

ggplot(data = homens, aes(x = femur, y = altura))+
  geom_point()

modelo_linear <- lm(data = homens, formula = altura ~ femur)

ggplot(data = mulheres, aes(x = femur, y = altura))+
  geom_point()

linearMulheres <- lm (data = mulheres, formula = altura ~ femur)
