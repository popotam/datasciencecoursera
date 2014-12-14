library(shiny)

punctuation <- '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~’'
acceptable <- 'abcdefghijklmnopqrstuvwxyz '
stopwords <- c('a', 'the', 'an')

bigrams <- readRDS("data/bigrams.rds")


cleanPhrase <- function(phrase) {
    # drop letter case
    phrase <- tolower(phrase)
    # remove punctuation
    phrase <- gsub('[[:punct:]’]', ' ', phrase)
    # remove non-words
    phrase <- gsub('[^[:lower:] ]', '', phrase)
    # get word list
    words <- strsplit(phrase, split=' ')[[1]]
    words <- words[ nchar(words) > 0 ]
    words <- words[ nchar(words) < 20 ]
    words <- words[ words != 'a' ]
    words <- words[ words != 'the' ]
    words <- words[ words != 'an' ]
    words
}


shinyServer(function(input, output) {
    phrase <- reactive({
        cleanPhrase(input$phrase)
    })
    
    output$word <- renderText({
        phrase <- phrase()
        lastWord = phrase[length(phrase)]
        index <- grep(paste('^', lastWord, '$', sep = ''), bigrams$first)
        out <- bigrams$second[index]
        if (length(out) > 0)
            out <- paste('<strong>', out, '</strong>')
        else
            out <- '<i>--NO PREDICTION--</i>'
        out
    })
    output$phrase <- renderPrint({
        phrase()
    })
})