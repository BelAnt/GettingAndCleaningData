# Step 1. Merges the training and the test sets to create one data set
# 1.1 Data
trainValues <- read.table("./train/X_train.txt")
testValues  <- read.table("./test/X_test.txt")
dataSetValues <- rbind(trainValues, testValues)
rm(trainValues); rm(testValues)

# 1.2 Labels set
trainLabel <- read.table("./train/y_train.txt")
testLabel  <- read.table("./test/y_test.txt")
dataSetLabel <- rbind(trainLabel, testLabel)
rm(trainLabel); rm(testLabel)

# 1.2 Subjects set
trainSubject <- read.table("./train/subject_train.txt")
testSubject <- read.table("./test/subject_test.txt")
dataSetSubject <- rbind(trainSubject, testSubject)
rm(trainSubject); rm(testSubject)

# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt")
meanAndStdFeatures <- grep("-mean\\(\\)|-std\\(\\)", features[,2])
dataSetValues <- dataSetValues[,meanAndStdFeatures]

# Step 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("activity_labels.txt")
dataSetLabel[,1] = activity[dataSetLabel[,1], 2]

dataSet <- cbind(dataSetSubject, dataSetLabel, dataSetValues)
rm(dataSetSubject); rm(dataSetLabel); rm(dataSetValues)

# Step 4. Appropriately labels the data set with descriptive variable names
names(dataSet) <- c("subject","activity",as.character(features[meanAndStdFeatures,2]))
rm(meanAndStdFeatures)

# Step 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyData <- aggregate(dataSet[3:68], by=list(activity = dataSet$activity, subject=dataSet$subject), mean)
tidyData <- tidyData[,c(2,1,3:68)]
write.table(tidyData, "tidyData.txt",sep=",", row.name=FALSE)


