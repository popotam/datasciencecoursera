rankhospital <- function(state, outcome, num = "best") {
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
    if (num != "best" & num != "worst" & is.na(as.integer(num))) {
        stop("invalid num")
    }
    state_data <- data[data$State == state,]
    state_data[, column] <- as.numeric(as.character(state_data[, column]))
    state_data[, 1] <- as.character(state_data[, 1])
    mortality <- na.omit(state_data[, c(2, column)])
    names(mortality)[2] <- "Rate"
    # sort by mortality and name
    mortality <- mortality[with(mortality, order(Rate, Hospital.Name)),]
    if (num == "best") {
        num <- 1
    }
    if (num == "worst") {
        num <- nrow(mortality)
    }
    as.character(mortality[num, 1])
}