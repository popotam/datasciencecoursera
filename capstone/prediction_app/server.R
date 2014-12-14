library(shiny)

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
    words <- words[ words != 'an' ]
    words <- words[ words != 'and' ]
    words <- words[ words != 'the' ]
    words
}


shinyServer(function(input, output) {
    phrase <- reactive({
        cleanPhrase(input$phrase)
    })

    prediction <- reactive({
        phrase <- phrase()
        prediction <- list(
            first = character(0),
            second = character(0)
        )
        for (i in (length(phrase):1)) {
            first <- phrase[i]
            index <- grep(paste('^', first, '$', sep = ''), bigrams$first)
            second <- bigrams$second[index]
            if (length(second) > 0) {
                prediction <- list(
                    first = first,
                    second = second
                )
                break
            }
        }
        prediction
    })
    
    output$second <- renderText({
        out <- prediction()$second
        if (length(out) > 0)
            out <- paste('<strong>', out, '</strong>')
        else
            out <- '<i>-- no prediction --</i>'
        out
    })
    output$phrase <- renderText({
        out <- phrase()
        if (length(out) > 0)
            out <- paste('<strong>', paste(out), '</strong>')
        else
            out <- '<i>-- no input --</i>'
        out
    })
    output$bigram <- renderText({
        first <- prediction()$first
        second <- prediction()$second
        if (length(first) > 0 || length(second) > 0)
            out <- paste('<strong>', first, second, '</strong>')
        else
            out <- '<i>-- no prediction --</i>'
        out
    })
})