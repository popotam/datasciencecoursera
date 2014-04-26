
# This script downloads and unzips SAMSUNG UCI HAR Dataset
# into current working directory.
# It uses method = "curl", so it might not work
# if you don't have curl installed.

download_data <- function() {
    message("Downloading UCI HAR Dataset")
    download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        "dataset.zip", "curl")
    unzip("dataset.zip")
}