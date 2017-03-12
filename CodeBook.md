## Code Book

This code book describes describes the variables and elaborates the transformations required to create the resulting tidy data set.

### Overview

30 volunteers performed 6 different activities while wearing a smartphone. The smartphone captured various data about their movements.

* [Original Data Source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [Project Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Explanation of data files used

* `features.txt`: Names of features.
* `activity_labels.txt`: Names and IDs for each of the 6 activities.
* `X_train.txt`: 7352 observations of the 561 features, for 21/30 volunteers.
* `subject_train.txt`: A vector of 7352 integers, denoting ID of the volunteer related to each of the observations in `X_train.txt`.
* `y_train.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.
* `X_test.txt`: 2947 observations of the 561 features, for 9/30 volunteers.
* `subject_test.txt`: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in `X_test.txt`.
* `y_test.txt`: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in `X_test.txt`.

More information about the files is available in `README.txt`. More information about the features is available in `features_info.txt`.

N.B. This analysis did not require raw signals, hence the data in `Inertial Signals` were redundant

### Processing steps

* Firstly, all relevant files were read into data frames
* The test and train data were merged
* The feature values were used to generate the single data-set
* The activity ID's were replaced with their corresponding activity names
* All feature columns containing `mean` or `std` were extracted.
* A tidy data set is created containing the mean per feature, per subject, and per activity. 
(E.g. Each subject has one row per activity in the tidy data set, where each row has contains values for each of the features on the subject/activity combination. Thus, for the 30 subjects, there are a total of 180 rows.)
* This dataset is output to [`tidyData.txt`](tidyData.txt)
