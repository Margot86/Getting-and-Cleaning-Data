# Getting-and-Cleaning-Data

# Introduction of files
This repository contains a script (run_analysis.R) to merge data from a number of .txt files from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and creates a tidy data set.

The data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0" have been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The original dataset included the following data files:

'features.txt': List of all features.

'activity_labels.txt': List of class labels and their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'train/subject_train.txt': ID's of subjects in the training data

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

'test/subject_test.txt': ID's of subjects in the training data


# A brief description of the script:

The run_analysis.R script merges data from a number of .txt files and produces a tidy data set.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A description of the "tidyData.txt" file can be found in the "CodeBook.md" file.

