# Getting-and-cleaning-data-course-project

This repository contains the R script and documentation for the final project of the Getting and Cleaning Data Coursera course.

## Project Files
* `run_analysis.R`: The R script used to transform the raw UCI HAR dataset into a tidy summary.
* `CodeBook.md`: Describes the variables, the data, and the transformations performed.
* `tidy_data.txt`: The final output file containing the averages of each variable for each activity and each subject.

## How the script works
The `run_analysis.R` script performs the following steps:
1. Merges the training and test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names (e.g., WALKING, SITTING) to name the activities.
4. Appropriately labels the data set with descriptive variable names (e.g., changing 't' to 'Time').
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Dependencies
This script requires the `dplyr` package.
