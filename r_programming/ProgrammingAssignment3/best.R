best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv")
    ## Check that state and outcome are valid
    if (!sum(data$State == state)) {
        stop("invalid state")
    }
    outcome_columns <- list(
        "heart attack" = 11,
        "heart failure" = 17,
        "pneumonia" = 23
    )
    column <- outcome_columns[[outcome]]
    if (is.null(column)) {
        stop("invalid outcome")
    }
    data <- data[data$State == state,]
    # interpret data as.numeric
    data[, column] <- as.numeric(as.character(data[, column]))
    data[, 1] <- as.character(data[, 1])
    data <- na.omit(data[, c(2, column)])
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    value <- min(data[[2]])
    subset <- data[data[, 2] == value,]
    result <- min(subset$Hospital.Name)
    as.character(result)
}