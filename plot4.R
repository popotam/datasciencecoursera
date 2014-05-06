plot4 <- function(data) {
    # set locale to en_US to get English names of day
    Sys.setlocale("LC_ALL", "en_US")

    # prepare device
    png(
        "plot4.png",
        width = 504,
        height = 504,
        units = "px",
        pointsize = 12,
        bg = "transparent"
    )

    # prepare grid for 4 plots
    par(mfrow = c(2, 2))

    # topleft plot copied from plot2.R
    plot(
        data$Time,
        data$Global_active_power,
        type="n",
        xlab = "",
        ylab = "Global Active Power"  # this is different than in plot2.R
    )
    lines(
        data$Time,
        data$Global_active_power
    )

    # topright plot
    plot(
        data$Time,
        data$Voltage,
        type="n",
        xlab = "datetime",
        ylab = "Voltage"
    )
    lines(
        data$Time,
        data$Voltage
    )

    # bottomleft plot copied from plot3.R
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
        bty = "n"  # disable legend box - this is different than in plot3.R
    )

    # bottom right plot
    plot(
        data$Time,
        data$Global_reactive_power,
        type="n",
        xlab = "datetime",
        ylab = "Global_reactive_power"
    )
    lines(
        data$Time,
        data$Global_reactive_power
    )

    # shutdown device
    dev.off()
}