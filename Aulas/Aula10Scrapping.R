library(rvest)
library(dplyr)
library(ggplot2)
library(stringr)
library(geobr)

url <- "https://pt.wikipedia.org/wiki/Lista_de_unidades_federativas_do_Brasil_por_alfabetiza%C3%A7%C3%A3o"

html <- read_html(url)
html


#html_elements(html,"table")
tabelas <- html |>
  html_elements("table") |>
  html_table()

alfabetizacao <- tabelas[[3]]
alfabetizacao <- alfabetizacao[,c(2,3)]
names(alfabetizacao) <- c("estado", "taxa")
names(alfabetizacao)

parte1 <- str_replace_all(string = alfabetizacao$taxa, pattern = ",", replacement = ".")
parte2 <- str_replace_all(string = parte1, pattern = "%", replacement = "")
partefinal <- as.numeric(parte2)

alfabetizacao$taxa <- partefinal

minas <-read_state(code_state = "MG")

ggplot(data = minas)+
  theme_minimal()+
  geom_sf()

municipioMG <- read_municipality(code_muni = "MG")

ggplot(data = municipioMG)+
  theme_minimal()+
  geom_sf()

estados <- read_state()
estados$name_state
order(estados$name_state)
estados[2,]

alfabetizacao <- alfabetizacao[order(alfabetizacao$estado),]
alfabetizacao$estado



estados <- estados[order(estados$name_state),]
estados$taxa <- alfabetizacao$taxa

ggplot(data = estados, aes(fill = taxa)) +
  geom_sf()+
  scale_fill_gradient(low = "#56B1F7", high = "#132B43")


