plot1 <- function(data) {
    png(
        "plot1.png",
        width = 504,
        height = 504,
        units = "px",
        pointsize = 12,
        bg = "transparent"
    )
    hist(
        data$Global_active_power,
        col = "red",
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)"
    )
    dev.off()
}