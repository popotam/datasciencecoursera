plot2 <- function(data) {
    # set locale to en_US to get English names of day
    Sys.setlocale("LC_ALL", "en_US")
    # proceed with the plotting
    png(
        "plot2.png",
        width = 504,
        height = 504,
        units = "px",
        pointsize = 12,
        bg = "transparent"
    )
    plot(
        data$Time,
        data$Global_active_power,
        type="n",
        xlab = "",
        ylab = "Global Active Power (kilowatts)"
    )
    lines(
        data$Time,
        data$Global_active_power
    )
    dev.off()
}