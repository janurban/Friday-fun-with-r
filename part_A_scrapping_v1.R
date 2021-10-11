if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, stringr, tm, SnowballC, wordcloud, RColorBrewer)
set.seed(1234)

value.range <- c(1:700000)

article.index_0 <- sample(value.range, size=3000, replace=FALSE)

article.index <- article.index_0 [c(0:1000)]

len.article.index <- length(article.index)
blesk.url <- "https://www.blesk.cz/clanek/"
#article.num <- 684130
our.database <- NULL

for (i in (1:len.article.index)) {
  article.num <- article.index[i]
  
  blesk.wbpg <- NULL
    try(
    blesk.wbpg <- read_html(paste(blesk.url,article.num,"/", sep=""))) # obsah hlavní stránky
    if (is.null (blesk.wbpg) == F)
      {
      try(page.content <- blesk.wbpg %>% 
       html_node("body") %>% html_children())

      try(substantial.content <- page.content[[12]] %>% html_text())
      
      #  čištění textu
      substantial.content <- str_replace_all(substantial.content, "\\t", "")
      substantial.content <- str_replace_all(substantial.content, "\\n", "") 
      substantial.content <- gsub("\\\\", "", substantial.content) 
      substantial.content <- str_replace_all(substantial.content, "\"", "")  
      substantial.content <- str_replace_all(substantial.content, "/", "")  
      substantial.content <- str_replace_all(substantial.content, "\'", "")
      substantial.content <- gsub("  ", " ", substantial.content)
      
      # uložení obsahu a data
      text <- str_match(substantial.content, "Sdílej:\\s*(.*?)\\s*@context") [2]
      date <- str_match(substantial.content, "published:\\s*(.*?)\\s*,premium") [2]
      
      
      } else { 
        date <- NA
        text <- NA}
      
    new.database.entry <- data.frame(article.num = article.num, text = text, date = date)  
    
    if (is.null(our.database)) {
      our.database <- new.database.entry
      } else {our.database <- rbind(our.database, new.database.entry)}
    
    print(paste ("Downloaded", i, "out of", len.article.index))
    # Sys.sleep(5)  
}

reduced.database <- our.database [sample(c(1:1000), size = 50, replace = F), ] 




 