
# This script downloads and unzips SAMSUNG UCI HAR Dataset
# into current working directory.
# It uses method = "curl", so if you don't have curl installed
# you might want to use different method.

get_data <- function(method = "curl") {
    message("Downloading UCI HAR Dataset")
    download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        "dataset.zip",
        method)
    unzip("dataset.zip")
}