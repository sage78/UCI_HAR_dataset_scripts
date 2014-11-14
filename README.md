# run_analysis.R

## Preconditions
Folder UCI HAR DATASET must be found as a subfolder of current working directory

UCI HAR DATASET can be dowloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Used libraries
- data.table_1.9.4
- dplyr_0.3.0.2
- stringr_0.6.2

## Description
Creates a tidy dataset from UCI HAR DATASET (Human Activity Recognition Using Smartphones Dataset). See UCI HAR DATASET/README.txt for details about the dataset

This script reads data from 
- UCI HAR Dataset/test/subject_test.txt
- UCI HAR Dataset/test/X_test.txt
- UCI HAR Dataset/test/y_test.txt
- UCI HAR Dataset/train/subject_train.txt
- UCI HAR Dataset/train/X_train.txt
- UCI HAR Dataset/train/y_train.txt

The following manipulations are applied
- Column are named as subject, activity and the rest according to UCI HAR Dataset/features.txt, except that parenthesis are removed from column names
- Activities are named according to UCI HAR Dataset/activity_labels.txt
- Only columns related to mean (mean) and standard deviation (std) are included in the result
- Data is grouped by activity and subject
- Column averages are calcuated for each group

## Outputs
A tidy data set with the average of each mean and standard deviation variable for each activity and each subject is created in the working directory and named as tidydataset.txt

## Usage
In R console, type the following command
```
source('run_analysis2.R')
```

## Code book
For general description, see UCI HAR Dataset/README.txt
```
Variables are described below in the following format:
variable          name of variable(s)/column(s).
    type          variable type
    range         variable range
    description   short description about the variable

activity  
    character    
    WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
    Activity performed by the subject
    
subject   
    numeric
    1:30
    Identifier of a volunteer
    
tBodyAcc-mean-X
tBodyAcc-mean-Y          
tBodyAcc-mean-Z
tBodyAcc-std-X
tBodyAcc-std-Y
tBodyAcc-std-Z
tGravityAcc-mean-X
tGravityAcc-mean-Y
tGravityAcc-mean-Z
tGravityAcc-std-X
tGravityAcc-std-Y
tGravityAcc-std-Z
tBodyAccJerk-mean-X
tBodyAccJerk-mean-Y
tBodyAccJerk-mean-Z
tBodyAccJerk-std-X
tBodyAccJerk-std-Y
tBodyAccJerk-std-Z
tBodyGyro-mean-X
tBodyGyro-mean-Y
tBodyGyro-mean-Z
tBodyGyro-std-X
tBodyGyro-std-Y
tBodyGyro-std-Z
tBodyGyroJerk-mean-X
tBodyGyroJerk-mean-Y
tBodyGyroJerk-mean-Z
tBodyGyroJerk-std-X
tBodyGyroJerk-std-Y
tBodyGyroJerk-std-Z
fBodyAcc-mean-X
fBodyAcc-mean-Y
fBodyAcc-mean-Z
fBodyAcc-std-X
fBodyAcc-std-Y
fBodyAcc-std-Z
fBodyAccJerk-mean-X
fBodyAccJerk-mean-Y
fBodyAccJerk-mean-Z
fBodyAccJerk-std-X
fBodyAccJerk-std-Y
fBodyAccJerk-std-Z
fBodyGyro-mean-X
fBodyGyro-mean-Y
fBodyGyro-mean-Z
fBodyGyro-std-X
fBodyGyro-std-Y
fBodyGyro-std-Z
    numeric
    not limited
    Signals used to estimate variables of the feature vector for each pattern. X, Y and Z is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAccMag-mean
tBodyAccMag-std
tGravityAccMag-mean
tGravityAccMag-std
tBodyAccJerkMag-mean
tBodyAccJerkMag-std
tBodyGyroMag-mean
tBodyGyroMag-std
tBodyGyroJerkMag-mean
tBodyGyroJerkMag-std
fBodyAccMag-mean
fBodyAccMag-std
fBodyBodyAccJerkMag-mean
fBodyBodyAccJerkMag-std
fBodyBodyGyroMag-mean
fBodyBodyGyroMag-std
fBodyBodyGyroJerkMag-mean
fBodyBodyGyroJerkMag-std
    numeric
    not limited
    Additional vectors obtained by averaging the signals in a signal window sample
```