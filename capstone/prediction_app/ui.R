library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Text prediction widget"),
    
    sidebarPanel(
        h5("Introduction"),
        p(
            "Around the world, people are spending an increasing amount ",
            "of time on their mobile devices for email, social networking, ",
            "banking and a whole range of other activities. But typing ",
            "on mobile devices can be a serious pain. ",
            "SwiftKey, a corporate partner in this capstone, ",
            "builds a smart keyboard that makes it easier for people ",
            "to type on their mobile devices."
        ),
        p(
            "This web widget is a prototype of a smart keyboard solution, ",
            "that predicts the best word to type in based on the previous words"
        ),

        h5("Description"),
        p("The prediction is based on bigrams (sequences of two words)",
          "extracted from the SwiftKey dataset (available ",
          a(href="", "here"),
          ")."),
        p("Before starting work on a prediction engine, ",
          "I have done a brief exploratory analysis of this data set ",
          "(available ",
          a(href="http://rpubs.com/popotam/capstone_milestone_report", "here"),
          ")."),
        p("Both the dataset and the phrase entered by user are cleaned ",
          "and tokenized in the following way:"),
        tags$ul(
            tags$li("converted to lowercase"),
            tags$li("punctuation was replaced with spaces"),
            tags$li("all non-ASCI letter characters were removed"),
            tags$li("document was split into words"),
            tags$li("stopwords (like 'a' and 'the') were removed")
        ),
        p("Then the last word from the phrase is matched with bigrams ",
          "to produce a prediction. If word is not matched, ",
          "the second last word is tried, etc.")
    ),
    
    mainPanel(
        h5("Inctructions"),
        p("Please use the input below to enter a phrase ",
          "that will be used to predict next word."),
        br(),

        wellPanel(fluidRow(
            column(6,
                   textInput("phrase", "Phrase:")
            ),
            column(6,
                   p("Predicted word:"),
                   htmlOutput("second")
            )
        )),
        br(),
        br(),
        br(),
        br(),

        h5("Behind the scenes"),
        p("In this section you can take a glimpse on the inner workings ",
          "of the algorithm.", br(),
          "You can see what transformations have been made",
          "to your input and which bigram was matched and used to predict ",
          "a word."),
        br(),
        p("Your input was tokenized as:"),
        p(
            style="min-height: 25px; margin-left: 30px",
            htmlOutput("phrase", inline=T)
        ),

        p("The following bigram was matched:"),
        p(
            style="min-height: 25px; margin-left: 30px",
            htmlOutput("bigram", inline=T)
        )
    )
))