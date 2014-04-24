rankall <- function(outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv")
    ## Check that state and outcome are valid
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
    data[, column] <- as.numeric(as.character(data[, column]))
    data[, 1] <- as.character(data[, 1])
    mortality <- na.omit(data[, c(7, 2, column)])
    names(mortality)[3] <- "Rate"
    # sort by mortality and name
    mortality <- mortality[with(mortality, order(Rate, Hospital.Name)),]
    # split by state
    by_state <- split(mortality, mortality$State)
    if (num == "best") {
        num <- 1
    }
    list_of_frames <- lapply(by_state, function(frame) {
        zenek <- num
        if (zenek == "worst") {
            zenek <- nrow(frame)
        }
        frame[zenek,]
    })
    merged <- Reduce(function(...) merge(..., all=T), list_of_frames)
    names(merged) <- c("state", "hospital", "rate")
    merged <- merged[!is.na(merged$state),]
    rownames(merged) <- merged[,1]
    merged[, c(2, 1)]
}