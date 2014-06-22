library(shiny)

x <- seq(-2, 2, length.out = 101)

generateData <- function(noise) {    
    coef <- rnorm(6)
    y <- (
        coef[1] * x
        + coef[2] * x ^ 3
        + 0.001 * coef[3] * x ^ 5
        + 0.0001 * coef[4] * x ^ 7
        + 0.00001 * coef[5] * x ^ 9
        + 0.000001 * coef[6] * x ^ 11
        + noise * rnorm(101)
    )
    y
}

shinyServer(function(input, output) {
    output$plot <- renderPlot({
        set.seed(input$seed)
        y <- generateData(input$noise)
        fit <- lm(y ~ poly(x, degree = input$num.coef, raw = TRUE))
        nx <- seq(-2, 2, length.out = 10001)
        ny <- predict(fit, newdata = data.frame(x = nx))
        plot(x, y)
        lines(nx, ny, col = "red")
    })
    output$residuals <- renderPlot({
        set.seed(input$seed)
        y <- generateData(input$noise)
        fit <- lm(y ~ poly(x, degree = input$num.coef, raw = TRUE))
        plot(fit, which = 1)
    })
})