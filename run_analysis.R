###
# Creates a tidy dataset from UCI HAR DATASET
#
# Preconditions: 
# - Folder UCI HAR DATASET must be found as a subfolder of current working directory
#
# Usage:
# - execute command source('run_analysis.R')
#
# Outputs:
# - tidydataset.txt: a tidy data set with the average of each variable for each activity and each subject
###
library("data.table")
library("dplyr")
library("stringr")

# read data files and combine the data
testdata <- cbind(
    read.table("UCI HAR Dataset/test/subject_test.txt", colClasses="numeric"),
    read.table("UCI HAR Dataset/test/X_test.txt", colClasses="numeric"),
    read.table("UCI HAR Dataset/test/y_test.txt", colClasses="numeric"))
traindata <- cbind(
    read.table("UCI HAR Dataset/train/subject_train.txt", colClasses="numeric"),
    read.table("UCI HAR Dataset/train/X_train.txt", colClasses="numeric"),
    read.table("UCI HAR Dataset/train/y_train.txt", colClasses="numeric"))
data <- rbind(testdata, traindata)
  
# set column names: subject, activityid and the rest according to UCI HAR Dataset/features.txt
# remove parenthesis from columns names
# make column names unique, as features have some duplicate names
features <- read.table("UCI HAR Dataset/features.txt", colClasses="character")
featurenames <- sapply(features[,2], str_replace_all, "[\\(\\)]", "")
colnames(data) <- make.unique(c("subject", featurenames, "activityid"))
  
# convert numeric activity ids to textual activity names
# add column activity
activities <- read.table("UCI HAR Dataset/activity_labels.txt", colClasses="character")
colnames(activities) <- c("id", "activity")
data[,"activity"] <- activities$activity[data$activityid]
  
# use dplyr to construct tidy dataset
# select columns subjet, activity and all columns related to mean (mean) and standard deviation (std)
# group by activity and subject
# calculate column means for the groups 
tidydata <- tbl_df(data)
tidydata <- select(tidydata, matches("subject\\b|.mean\\-.|.mean\\b|.std\\-.|.std\\b|activity\\b", ignore.case = FALSE))
tidydata <- group_by(tidydata, activity, subject)
tidydata <- summarise_each(tidydata, funs(mean))

# write the results in a file
write.table(tidydata, "tidydataset.txt", row.name=FALSE)