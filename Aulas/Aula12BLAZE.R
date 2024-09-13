library(httr)
library(httr2)
library(jsonlite)
library(dplyr)

url <- "https://blaze1.space/api/roulette_games/history?startDate=2024-08-14T16:43:27.697Z&endDate=2024-09-13T16:43:27.698Z&page=1"

dados <- content(GET(url), "text")

dados <- fromJSON(dados)
table(dados$records$color)

url_base <- "https://blaze1.space/api/roulette_games/history?startDate=2024-08-14T16:43:27.697Z&endDate=2024-09-13T16:43:27.698Z&page="
resultados <- c()

for(j in 1:50){
  url <- paste0(url_base, j)
  dados <- content(GET(url),"text")
  dados <- fromJSON(dados)
  resultados <- c(resultados, dados$records$color)
}
resultados
prop.table(table(resultados))
