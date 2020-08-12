library(dplyr)
library(data.table)

## 0. Downloading and collecting data that we're going to use
temp<-tempfile(fileext=".zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)

features<-read.table(unz(temp, "UCI HAR Dataset/features.txt"), header=F)
features<-as.character(features[,2])
activityLabels<-read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"), header=F)
activityLabels<-as.character(activityLabels[,2])
dataTrainX<-read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"), header=F)
dataTrainY<-read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"), header=F)
dataTrainSubject<-read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"), header=F)
dataTestX<-read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"), header=F)
dataTestY<-read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"), header=F)
dataTestSubject<-read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"), header=F)
dataTrain<-data.frame(dataTrainSubject, dataTrainY, dataTrainX)
dataTest<-data.frame(dataTestSubject, dataTestY, dataTestX)
unlink(temp)

dataTrain<-data.frame(dataTrainSubject, dataTrainY, dataTrainX)
dataTest<-data.frame(dataTestSubject, dataTestY, dataTestX)

names(dataTrain)<-c(c("subject", "activity"), features)
names(dataTest)<-c(c("subject", "activity"), features)

## 1. Merging training and test data frames
data <- rbind(dataTrain,dataTest)

## 2. Extracting only the measurement on the mean and standard deviations for each measurement
extractedData <- data[,which(colnames(data) %in% c("subject","activity",grep("mean()|std()",colnames(data),value = T)))]

## 3. Use descriptive activity names to name the activities in the data set
extractedData$activity <- activityLabels[extractedData$activity]

## 4. Appropriately label the data set with descriptive variable names
names(extractedData)[-c(1:2)]<-gsub("^t", "time", names(extractedData)[-c(1:2)])
names(extractedData)[-c(1:2)]<-gsub("^f", "frequency", names(extractedData)[-c(1:2)])
names(extractedData)[-c(1:2)]<-gsub("Acc", "Accelerometer", names(extractedData)[-c(1:2)])
names(extractedData)[-c(1:2)]<-gsub("Gyro", "Gyroscope", names(extractedData)[-c(1:2)])
names(extractedData)[-c(1:2)]<-gsub("Mag", "Magnitude", names(extractedData)[-c(1:2)])
names(extractedData)[-c(1:2)]<-gsub("BodyBody", "Body", names(extractedData)[-c(1:2)])

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
tidyData<-aggregate(. ~ subject + activity, extractedData, mean)
tidyData<-tidyData[order(tidyData$subject,tidyData$activity),]
write.table(tidyData, "./tidy_data.txt", row.names = FALSE, quote = FALSE)
