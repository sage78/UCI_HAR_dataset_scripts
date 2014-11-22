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
- Columns are named as subject, activity and the rest according to UCI HAR Dataset/features.txt, except that parenthesis are removed and only lower case letters are used
- Activities are named according to UCI HAR Dataset/activity_labels.txt
- Only columns related to mean (mean) and standard deviation (std) are included in the result
- Data is grouped by activity and subject
- Column averages are calculated for each group

## Outputs
A tidy data set with the average of each mean and standard deviation variable for each activity and each subject is created in the working directory and named as tidydataset.txt

## Usage
In R console, type the following command
```
source('run_analysis.R')
```

## Code book
For general description, see UCI HAR Dataset/README.txt
```
Variables are described below in the following format:
variable          name of variable(s)/column(s)
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
    
tbodyacc-mean-x
tbodyacc-mean-y          
tbodyacc-mean-z
tbodyacc-std-x
tbodyacc-std-y
tbodyacc-std-z
tgravityacc-mean-x
tgravityacc-mean-y
tgravityacc-mean-z
tgravityacc-std-x
tgravityacc-std-y
tgravityacc-std-z
tbodyaccjerk-mean-x
tbodyaccjerk-mean-y
tbodyaccjerk-mean-z
tbodyaccjerk-std-x
tbodyaccjerk-std-y
tbodyaccjerk-std-z
tbodygyro-mean-x
tbodygyro-mean-y
tbodygyro-mean-z
tbodygyro-std-x
tbodygyro-std-y
tbodygyro-std-z
tbodygyrojerk-mean-x
tbodygyrojerk-mean-y
tbodygyrojerk-mean-z
tbodygyrojerk-std-x
tbodygyrojerk-std-y
tbodygyrojerk-std-z
fbodyacc-mean-x
fbodyacc-mean-y
fbodyacc-mean-z
fbodyacc-std-x
fbodyacc-std-y
fbodyacc-std-z
fbodyaccjerk-mean-x
fbodyaccjerk-mean-y
fbodyaccjerk-mean-z
fbodyaccjerk-std-x
fbodyaccjerk-std-y
fbodyaccjerk-std-z
fbodygyro-mean-x
fbodygyro-mean-y
fbodygyro-mean-z
fbodygyro-std-x
fbodygyro-std-y
fbodygyro-std-z
    numeric
    not limited
    Signals used to estimate variables of the feature vector for each pattern. X, Y and Z is used to denote 3-axial signals in the X, Y and Z directions.

tbodyaccmag-mean
tbodyaccmag-std
tgravityaccmag-mean
tgravityaccmag-std
tbodyaccjerkmag-mean
tbodyaccjerkmag-std
tbodygyromag-mean
tbodygyromag-std
tbodygyrojerkmag-mean
tbodygyrojerkmag-std
fbodyaccmag-mean
fbodyaccmag-std
fbodybodyaccjerkmag-mean
fbodybodyaccjerkmag-std
fbodybodygyromag-mean
fbodybodygyromag-std
fbodybodygyrojerkmag-mean
fbodybodygyrojerkmag-std
    numeric
    not limited
    Additional vectors obtained by averaging the signals in a signal window sample
```