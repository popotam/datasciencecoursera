load.data <- function() {
    data <- read.csv("data.csv", sep=";", na.strings="?")
    format <- "%d/%m/%Y %H:%M:%s"
    dates <- paste(data$Date, data$Time, sep=" ")
    dates <- strptime(dates, format)
    data$Time <- dates
    data <- data[,names(data) != "Date"]
    data
}