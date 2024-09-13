library(rvest)
library(dplyr)
library(stringr)
library(ggplot2)

url <- "https://www.bosshunting.com.au/entertainment/movies/best-movies-imdb/"

html <- read_html(url)

nomes <- html|>
  html_elements("ol.wp-block-list")|>
  html_elements("li")|>
  html_text2()

anos <- str_extract_all(string = nomes, pattern = "\\(\\d+\\)")
anos <- str_extract_all(string = anos, pattern = "\\d++")
anos <- unlist(anos)
anos <- as.numeric(anos)

notas <- str_extract_all(string = nomes, pattern = "\\d\\.\\d")
notas <- unlist(notas)
notas <- as.numeric(notas) 

titulos <- str_remove_all(string = nomes, pattern = "\\s\\(\\d+\\)")
titulos <- str_remove_all(string = titulos, pattern = "\\sdir\\.$")
