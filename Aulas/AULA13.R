library(rvest)
library(dplyr)
library(tidytext)
 
url <- "https://www.bbc.com/portuguese/articles/cql3lwgl3ldo"
 
html <- read_html(url)
          
titulo <- html |>
  html_elements('h1')|>
  html_text2()

noticia <- html |>
  html_elements("p.bbc-hhl7in")|>
  html_text2()

noticia <- paste(noticia, collapse = " ")

artigos <- data.frame(titulo, noticia)
