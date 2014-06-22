library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Polynomial Regression and Overfitting"),
    
    sidebarPanel(
        h5("Data Generation"),
        sliderInput("seed", 
                    "Random seed", 
                    min = 1,
                    max = 100, 
                    value = 1),
        sliderInput("noise", 
                    "Amount of noise", 
                    min = 0.0,
                    max = 5.0, 
                    value = 1.0,
                    step = 0.01),
        br(),
        h5("Polynomial Regression"),
        sliderInput("num.coef", 
                    "Degree of polynomial regression", 
                    min = 1,
                    max = 100, 
                    value = 20),
        br(),
        h5("Inctructions"),
        p("Please use the sliders above to generate a random polynomial with added noise and to specify degree of polynomial regression that will be used to fit the data."),
        p("Observe two things:"),
        tags$ul(
            tags$li("When noise is set to 0, as you increase the degree of polynomial you recieve better fit. You get perfect fit once you hit the real data degree and higher degree doesn't change anything."),
            tags$li("When noise is added, as you increase the degree of polynomial at some point you overfit the training data - your regression line gets spiky and nonsensical.")
        )
    ),
    
    mainPanel(
        plotOutput("plot"),
        plotOutput("residuals")
    )
))