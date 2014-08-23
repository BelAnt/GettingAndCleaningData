Getting And Cleaning Data Project CodeBook
======================

##Source data##

The source data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Used files:
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.
* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.
* `test/subject_test.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

##Transformations##

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

##Output data##

After run `run_analysis.R` you get several datasets and values:
* `activity`: data set with id and name of all activities
* `features`: data set with id and name of all features
* `dataSet`: data set with subject, activity and values of mean and std features
* `tidyData`: data set with the average of each variable for each activity and each subject from `dataSet`

Output files:
* `tidyData.txt`: content of `tidyData` data set 


