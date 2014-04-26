DATA DICTIONARY - SAMSUNG UCI HAR Dataset
=========================================

This data set contains cleaned data from SAMSUNG UCI HAR Dataset.

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original data can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data was cleaned by selecting 86 features and averaging them per subject/activity pair.


subject
-------
Subject identification number

    1..30

activity
--------
Activity that user was engaged in

    1            WALKING
    2   WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4            SITTING
    5           STANDING
    6             LAYING

86 features
-----------
86 features were taken from SAMSUNG UCI HAR Dataset 561 features.

Only features with 'mean' or 'std' in their name were taken.

Features were aggregated by mean value grouped by subject / activity pair.

#### List of feature names:

    tBodyAcc-mean()-X
    tBodyAcc-mean()-Y
    tBodyAcc-mean()-Z
    tBodyAcc-std()-X
    tBodyAcc-std()-Y
    tBodyAcc-std()-Z
    tGravityAcc-mean()-X
    tGravityAcc-mean()-Y
    tGravityAcc-mean()-Z
    tGravityAcc-std()-X
    tGravityAcc-std()-Y
    tGravityAcc-std()-Z
    tBodyAccJerk-mean()-X
    tBodyAccJerk-mean()-Y
    tBodyAccJerk-mean()-Z
    tBodyAccJerk-std()-X
    tBodyAccJerk-std()-Y
    tBodyAccJerk-std()-Z
    tBodyGyro-mean()-X
    tBodyGyro-mean()-Y
    tBodyGyro-mean()-Z
    tBodyGyro-std()-X
    tBodyGyro-std()-Y
    tBodyGyro-std()-Z
    tBodyGyroJerk-mean()-X
    tBodyGyroJerk-mean()-Y
    tBodyGyroJerk-mean()-Z
    tBodyGyroJerk-std()-X
    tBodyGyroJerk-std()-Y
    tBodyGyroJerk-std()-Z
    tBodyAccMag-mean()
    tBodyAccMag-std()
    tGravityAccMag-mean()
    tGravityAccMag-std()
    tBodyAccJerkMag-mean()
    tBodyAccJerkMag-std()
    tBodyGyroMag-mean()
    tBodyGyroMag-std()
    tBodyGyroJerkMag-mean()
    tBodyGyroJerkMag-std()
    fBodyAcc-mean()-X
    fBodyAcc-mean()-Y
    fBodyAcc-mean()-Z
    fBodyAcc-std()-X
    fBodyAcc-std()-Y
    fBodyAcc-std()-Z
    fBodyAcc-meanFreq()-X
    fBodyAcc-meanFreq()-Y
    fBodyAcc-meanFreq()-Z
    fBodyAccJerk-mean()-X
    fBodyAccJerk-mean()-Y
    fBodyAccJerk-mean()-Z
    fBodyAccJerk-std()-X
    fBodyAccJerk-std()-Y
    fBodyAccJerk-std()-Z
    fBodyAccJerk-meanFreq()-X
    fBodyAccJerk-meanFreq()-Y
    fBodyAccJerk-meanFreq()-Z
    fBodyGyro-mean()-X
    fBodyGyro-mean()-Y
    fBodyGyro-mean()-Z
    fBodyGyro-std()-X
    fBodyGyro-std()-Y
    fBodyGyro-std()-Z
    fBodyGyro-meanFreq()-X
    fBodyGyro-meanFreq()-Y
    fBodyGyro-meanFreq()-Z
    fBodyAccMag-mean()
    fBodyAccMag-std()
    fBodyAccMag-meanFreq()
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()
    fBodyBodyAccJerkMag-meanFreq()
    fBodyBodyGyroMag-mean()
    fBodyBodyGyroMag-std()
    fBodyBodyGyroMag-meanFreq()
    fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag-std()
    fBodyBodyGyroJerkMag-meanFreq()
    angle(tBodyAccMean,gravity)
    angle(tBodyAccJerkMean),gravityMean)
    angle(tBodyGyroMean,gravityMean)
    angle(tBodyGyroJerkMean,gravityMean)
    angle(X,gravityMean)
    angle(Y,gravityMean)
    angle(Z,gravityMean)
