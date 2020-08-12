# About Data
- This project will use six data files, which are `x_train.txt`, `x_test.txt`, `y_train.txt`, `y_test.txt`, `subject_train.txt` and `subject_test.txt`.
- The `features.txt` contains the correct variable name, which corresponds to each column of `x_train.txt` and `x_test.txt`. 
- The `activity_labels.txt` contains the desciptive names for each activity label, which corresponds to each number in the `y_train.txt` and `y_test.txt`.

This dataset provide the following variables for each activity:
  1. *subject* - ID of participant
  2. *activity* - ID of activity type
  3. Mean and standart deviation for the following features (other values are presented in initial dataset, but for this reasearch only these parameters were used)
      * tBodyAcc-XYZ
      * tGravityAcc-XYZ
      * tBodyAccJerk-XYZ
      * tBodyGyro-XYZ
      * tBodyGyroJerk-XYZ
      * tBodyAccMag
      * tGravityAccMag
      * tBodyAccJerkMag
      * tBodyGyroMag
      * tBodyGyroJerkMag
      * fBodyAcc-XYZ
      * fBodyAccJerk-XYZ
      * fBodyGyro-XYZ
      * fBodyAccMag
      * fBodyAccJerkMag
      * fBodyGyroMag
      * fBodyGyroJerkMag

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

# Course Project Introduction
The script `run_analysis.R` uses the `data.table` package for renaming column and reading in files. It performs 5 major steps including:

1. Merges the training and the test sets to create one data set. (In the following the word data means both train and test).
The `x_data.txt`, `y_data.txt`, `subject_data.txt` should be binded by row, and after that all three of them should binded by column.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
For the column of `x_data.txt`, extract only the ones that have mean() or std() in their names, compare it with `feature.txt`.

3. Uses descriptive activity names to name the activities in the data set.
Match each number in the `y_data` column with `activity_labels.txt`.

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.   
