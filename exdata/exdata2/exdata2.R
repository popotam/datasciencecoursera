load.data <- function() {
    unzip('exdata-data-NEI_data.zip')
    NEI <<- readRDS("summarySCC_PM25.rds")
    SCC <<- readRDS("Source_Classification_Code.rds")
}

# Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008?
# Using the base plotting system, make a plot showing the total
# PM2.5 emission from all sources for each of the years 1999,
# 2002, 2005, and 2008.
plot1 <- function() {
    # load data if not loaded yet
    if (!exists('NEI') | !exists('SCC')) load.data()

    # aggregate data - sum Emissions by year
    data <- aggregate(NEI$Emissions, by=list(NEI$year), sum)
    names(data) <- c('Year', 'Emissions')

    # create png file with plot
    png("plot1.png", bg = "transparent")
    with(
        data,
        plot(
            Year, Emissions,
            main = "Total Emissions per Year",
            xlim = c(1998, 2009),
            ylim = c(0, 1.2 * max(Emissions)),  # scale from zero!
            type = 'b',
        )
    )
    dev.off()
}


# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.
plot2 <- function() {
    # load data if not loaded yet
    if (!exists('NEI') | !exists('SCC')) load.data()

    # filter data to Baltimore
    data <- with(NEI, NEI[fips == "24510",])

    # aggregate data - sum Emissions by year
    data <- aggregate(data$Emissions, by=list(data$year), sum)
    names(data) <- c('Year', 'Emissions')

    # create png file with plot
    png("plot2.png", bg = "transparent")
    with(
        data,
        plot(
            Year, Emissions,
            main = "Total Emissions per Year in Baltimore City",
            xlim = c(1998, 2009),
            ylim = c(0, 1.2 * max(Emissions)),  # scale from zero!
            type = 'b',
        )
    )
    dev.off()
}


# Of the four types of sources indicated by the type
# (point, nonpoint, onroad, nonroad) variable, which
# of these four sources have seen decreases in emissions
# from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer
# this question.
plot3 <- function() {
    library(ggplot2)

    # load data if not loaded yet
    if (!exists('NEI') | !exists('SCC')) load.data()

    # filter data to Baltimore
    data <- with(NEI, NEI[fips == "24510",])

    # aggregate data - sum Emissions by year and by type
    data <- aggregate(data$Emissions, by=list(data$year, data$type), sum)
    names(data) <- c('Year', 'Type', 'Emissions')

    # create plot definition
    plot <- (
        ggplot(
            data,
            aes(x=Year, y=Emissions, colour=Type)
        )
        + geom_line()
        + theme_bw()
        + ggtitle("Total Emissions per Year in Baltimore City")
    )

    # print plot to a png file
    png("plot3.png", bg = "transparent")
    print(plot)
    dev.off()
}


# Across the United States, how have emissions from coal
# combustion-related sources changed from 1999–2008?
plot4 <- function() {
    library(ggplot2)

    # load data if not loaded yet
    if (!exists('NEI') | !exists('SCC')) load.data()

    # find all coal combustion related SCCs
    description <- with(SCC, paste(Short.Name, EI.Sector, SCC.Level.One,
                                   SCC.Level.Two, SCC.Level.Three,
                                   SCC.Level.Four))
    match <- grepl("Coal", description) & grepl("Comb", description)
    coal.comb <- SCC[match,][["SCC"]]

    # filter data to coal combustion related
    data <- with(NEI, NEI[SCC %in% coal.comb,])

    # aggregate data - sum emissions by year
    data <- aggregate(data$Emissions, by=list(data$year), sum)
    names(data) <- c('Year', 'Emissions')

    # create plot definition
    plot <- (
        ggplot(
            data,
            aes(x=Year, y=Emissions),
        )
        + geom_line()
        + theme_bw()
        + ylim(0, 1.2 * max(data$Emissions))
        + ggtitle("Coal Combustion Related Emissions per Year")
    )

    # print plot to a png file
    png("plot4.png", bg = "transparent")
    print(plot)
    dev.off()
}


# How have emissions from motor vehicle sources changed
# from 1999–2008 in Baltimore City?
plot5 <- function() {
    library(ggplot2)

    # load data if not loaded yet
    if (!exists('NEI') | !exists('SCC')) load.data()

    # find all motor vehicle related SCCs
    motor <- SCC[grepl("Highway Veh", SCC$Short.Name),][["SCC"]]

    # filter data to motor related in Baltimore
    data <- with(NEI, NEI[SCC %in% motor & fips == "24510",])

    # aggregate data - sum emissions by year
    data <- aggregate(data$Emissions, by=list(data$year), sum)
    names(data) <- c('Year', 'Emissions')

    # create plot definition
    plot <- (
        ggplot(
            data,
            aes(x=Year, y=Emissions),
        )
        + geom_line()
        + theme_bw()
        + ylim(0, 1.2 * max(data$Emissions))
        + ggtitle("Motor Vehicle Related Emissions per Year")
    )

    # print plot to a png file
    png("plot5.png", bg = "transparent")
    print(plot)
    dev.off()
}


# Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
