iris
iris <- iris[sample(nrow(iris)),]

n <- round(0.8*nrow(iris))
n

treinamento <- iris[1:n,]
teste <- iris[-(1:n),]

ggplot(data = treinamento, aes(x = Petal.Length, y = Petal.Width, col = Species))+
  geom_point(size = 2, alpha = 0.5)+
  theme_minimal()
