download_data <- function() {
    message("Downloading UCI HAR Dataset")
    download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        "dataset.zip", "curl")
    unzip("dataset.zip")
}