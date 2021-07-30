if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, stringr, tm, SnowballC, wordcloud, RColorBrewer) # toto je velmi šikovný způsob instalace knihoven
# nejříve kontroluje, jestli je knihovna dostupná a pokud není, tak instaluje a 
# potom načte do paměti

blesk.wbpg<- read_html("https://www.blesk.cz/clanek/684130") # stáhneme obsah hlavní stránky

# nápověda: dá se to napsat s variabilním číslem takto:  
# article.number <- 684130
# url <- paste("https://www.blesk.cz/clanek/", article.number, sep = "")
# blesk.wbpg<- read_html(url)
# naším cílem je nechat běžet rutinu před nějaká rozumná čísla článku, 
# možná to bude něco jako 500000-700000, nebo nějaký užší výběr

page.content <- blesk.wbpg %>% 
 html_node("body") %>% html_children()

page.content # podíváme se na obsah nodů; zdá se, že obsah, který nás zajímá 
# je v nodu 12

page.content[[12]] %>% html_text() # podíváme se, co je uvnitř

substantial.content <- page.content[[12]] %>% html_text()
substantial.content # podíváme se na obsah

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

# R bohužel nativně neumí přidávat nové hodnoty do stávajících objektů
# existují na to funkce, ale nativní způsob je, že se objekt uloží s novými hodnotami
# např. s data frame se to dá udělat takto: 
# před rutinu (ale mimo ni) dát: my.data <- NULL
# to mi zajistí, že v rámci rutiny se nejprve správně objekt vytvoří, pokud doposud neexistoval
# v rámci rutiny:
# new.data <- data.frame(date = date, text = text)
# if (is.NULL(my.data)) {my.data <- new.data # tady se objekt vytváří
# } else {my.data <- cbind (my.data, new.data)} # tady se napojuje existující objekt (v dalších kolech)

# analýza textu podle http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know
docs <- Corpus(VectorSource(text))
inspect(docs)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("czech")) # nefunguje
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

# ukoly na příště: 
# načíst česká stopwords: https://raw.githubusercontent.com/stopwords-iso/stopwords-cs/master/stopwords-cs.txt
# nebo využít: https://cran.r-project.org/web/packages/stopwords/readme/README.html
# zopakovat analýzu



 