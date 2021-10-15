if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, stringr, tm, SnowballC, wordcloud, RColorBrewer)
set.seed(1234)

# Our database is here:
https://github.com/janurban/Friday-fun-with-r/blob/main/database429.RDS
# You need to save it locally and then set the path to it, for instance:
setwd("/home/honza/Google Drive/CUK/uceni/friday fun with r")

# And then just load the data and start the analysis:
our.database <- readRDS("database429.RDS")

text <- tolower(our.database$text[2])
words <- strsplit(text, " ")[[1]]
stem <- grepl("rak", words, fixed = TRUE) # do the words contain the stem?
words.with.stem <- words[stem] # what words contain the stem