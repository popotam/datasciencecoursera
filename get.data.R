
# This script downloads and unzips SAMSUNG UCI HAR Dataset
# into current working directory.
# It uses method = "curl", so if you don't have curl installed
# you might want to use different method.

get.data <- function(method = "curl") {
    message("Downloading UCI HAR Dataset")
    download.file(
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
        "dataset.zip",
        method)
    unzip("dataset.zip")
    file.remove('dataset.zip')
    # filter only 2007-02-01 and 2007-02-02
    system("head -1 household_power_consumption.txt > data.csv")
    system("grep '^[12]/2/2007' household_power_consumption.txt >> data.csv")
    file.remove('household_power_consumption.txt')
}