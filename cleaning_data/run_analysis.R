library(reshape2)

# The run_analysis function does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation
#    for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each
#    variable for each activity and each subject.

run_analysis <- function() {
    # Point 1 - merge train and test data
    data <- cbind(
        # subject column
        rbind(
            read.table("UCI HAR Dataset//train//subject_train.txt"),
            read.table("UCI HAR Dataset//test//subject_test.txt")
        ),
        # activity column
        rbind(
            read.table("UCI HAR Dataset//train//y_train.txt"),
            read.table("UCI HAR Dataset//test//y_test.txt")
        ),
        # features columns
        rbind(
            read.table("UCI HAR Dataset//train//X_train.txt"),
            read.table("UCI HAR Dataset//test//X_test.txt")
        )
    )

    # Point 3 and 4 - add appropriate labels to data
    # read labels
    activities <- read.table("UCI HAR Dataset//activity_labels.txt",
                             col.names=c("activityID", "activityName"))
    features <- read.table("UCI HAR Dataset//features.txt",
                           col.names=c("featureID", "featureName"),
                           stringsAsFactors=FALSE)
    # add column names
    colnames(data) <- c("subject", "activity", features$featureName)
    # add labels to activities
    data[,2] <- factor(data[,2], labels=activities[,2])

    # Point 2 - drop columns that aren't mean or std
    interesting_columns <- names(data)[
        vapply(
            names(data),
            function(name) {
                (grepl("mean", name, ignore.case=TRUE)
                 | grepl("std", name, ignore.case=TRUE)
                 | name == "activity"
                 | name == "subject")
            },
            logical(1))
        ]
    data <- data[, interesting_columns]

    # Point 5 - create a second data set with the average of each
    #           variable for each activity and each subject.
    melted <- melt(data, id=c('subject', 'activity'))
    averages <- dcast(melted, subject + activity ~ variable, mean)

    # return cleaned data set
    averages
}