# About Data
- This project will use six data files, which are `x_train.txt`, `x_test.txt`, `y_train.txt`, `y_test.txt`, `subject_train.txt` and `subject_test.txt`.
- The `features.txt` contains the correct variable name, which corresponds to each column of `x_train.txt` and `x_test.txt`. 
- The `activity_labels.txt` contains the desciptive names for each activity label, which corresponds to each number in the `y_train.txt` and `y_test.txt`.

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
