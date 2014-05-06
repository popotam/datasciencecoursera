plot3 <- function(data) {
    # set locale to en_US to get English names of day
    Sys.setlocale("LC_ALL", "en_US")
    # proceed with the plotting
    png(
        "plot3.png",
        width = 504,
        height = 504,
        units = "px",
        pointsize = 12,
        bg = "transparent"
    )
    plot(
        data$Time,
        data$Sub_metering_1,
        type="n",
        xlab = "",
        ylab = "Energy sub metering"
    )
    lines(
        data$Time,
        data$Sub_metering_1
    )
    lines(
        data$Time,
        data$Sub_metering_2,
        col = "red"
    )
    lines(
        data$Time,
        data$Sub_metering_3,
        col = "blue"
    )
    legend(
        "topright",
        legend = names(data)[6:8],
        col = c("black", "red", "blue"),
        lty = 1,
    )
    dev.off()
}