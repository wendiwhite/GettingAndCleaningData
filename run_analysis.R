# Getting and Cleaning Data Course Project
#
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is 
# to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no 
# questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to 
# a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the
# data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also 
# include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are 
# connected.  
#
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article.
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
# The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy 
# S smartphone. A full description is available at the site where the data was obtained: 
#         
#         http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# Here are the data for the project: 
#         
#         https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# You should create one R script called run_analysis.R that does the following. 
#       1. Merges the training and the test sets to create one data set.
#       2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#       3. Uses descriptive activity names to name the activities in the data set
#       4. Appropriately labels the data set with descriptive variable names. 
#       5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for
#               each activity and each subject.

# Load or install required packages
library(data.table)
library(dplyr)
library(reshape)
# install.packages("data.table")
# install.packages("dplyr")
# install.packages("reshape")

# Read activity labels
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt",
        header = FALSE, 
        col.names = c("activitycode", "activitylabel"))

# Read features
features <- read.table("UCI HAR Dataset/features.txt",
        header = FALSE, col.names = c("feature_code", "feature_label")) %>%
        select(-feature_code)

# Merge the training and the test sets to create one data set
dataset <- cbind(   
        rbind(
                read.table("UCI HAR Dataset/test/subject_test.txt",
                        header = FALSE,
                        col.names = c("subject")),
                read.table("UCI HAR Dataset/train/subject_train.txt",
                        header = FALSE,
                        col.names = c("subject"))
        ),
         
        rbind(
                read.table("UCI HAR Dataset/test/y_test.txt",
                        header = FALSE),
                read.table("UCI HAR Dataset/train/y_train.txt",
                        header = FALSE)
        ) %>%
        
        # Use descriptive activity names to name the activities in the data set
        merge(activitylabels, by.x = "V1", by.y = "activitycode", sort = FALSE) %>%
        
        # Appropriately label the data set with descriptive activity names
        select(activitylabel),
        
        # Load measurement data
        rbind(
                read.table("UCI HAR Dataset/test/X_test.txt",
                        header = FALSE,
                        col.names = gsub("[[:punct:]]", "", c(as.matrix(features[,1])))),
                read.table("UCI HAR Dataset/train/X_train.txt",
                        header = FALSE,
                        col.names = gsub("[[:punct:]]", "", c(as.matrix(features[,1]))))
        ) %>%
 
        # Extract only the measurements on the mean and standard deviation for each measurement
        select(contains("std"), contains("mean"))
)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy.data2 <- melt(dataset, c("subject", "activitylabel")) %>%
cast(subject + activitylabel ~ variable, mean)

# Upload the tidy data set as a txt file created with write.table() using row.names=FALSE 
write.table(tidy.data2, file = "UCI HAR Dataset/tidy.data2.txt", row.names = FALSE)