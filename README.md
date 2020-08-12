# Getting and Cleaning Data Course Project
- The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

- The data for this project can be downloaded through the link:   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Files
- `CodeBook.md.` describes the variables, the data, and any work that are performed to clean up the data.

- `run_analysis.R` contains all the coding for doing the course project, that includes downloading and unzipping the dataset that is used for this project.

- `tidy_data.txt` is a written out text file from `run_analysis.R`. 

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
