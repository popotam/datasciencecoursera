Cleaned SAMSUNG UCI HAR Dataset
===============================

Description
-----------

This data set contains cleaned data from SAMSUNG UCI HAR Dataset.

A full description of SAMSUNG UCI HAR Dataset is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original data can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data was cleaned by selecting 86 features and averaging them per subject/activity pair.

Only features with 'mean' or 'std' in their name were taken.


Scripts
-------

#### get_data.R

This script downloads and unzips the original dataset.

Usage:

    > get_data()

#### run_analysis.R

This script cleans the data.

Dependencies:

    > install.packages(reshape2)

Usage:

    > run_analysis()


Data Cleanup
------------

Data is cleaned in the following steps:

* test data is merged with training data:

    shape of the merged data:

    column 1        column2   columns3-563
    --------------------------------------
    subject_train + y_train + X_train
           +          +         +
    subject_test  + y_test  + X_test

* feature labels and activity names are loaded and added to data

* features not containing 'mean' or 'std' are dropped, which leaves 86 features

* reshape2 package is used to average the variables while groupping by subject/activity pair - this reduces number of rows from 10299 to 30 subjects * 6 activities = 180 rows

* cleaned data is returned

For details see: [run_analysis.R]



[run_analysis.R]:https://github.com/popotam/datasciencecoursera/blob/master/cleaning_data/run_analysis.R
