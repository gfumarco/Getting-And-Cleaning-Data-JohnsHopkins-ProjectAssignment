# Getting and Cleaning Data

This is a repository contaning the code written for the "Getting and Cleaning Data"" Coursera peer reviewed project assignment.  



## Course Project 

* Unzip the raw data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the working directory 

* Put run_analysis.R into the working directory  

* In RStudio: source("run_analysis.R")  

* Use data <- read.table("avg_tidy_dataset.txt") to read the data.



## Notes

For this raw data, avg_tidy_dataset dimension is 180x68 because the averages "for each activity and each subject" is given by 30 subjects times 6 activities.


The provided R script has no assumptions on numbers of records, only on locations of files.  