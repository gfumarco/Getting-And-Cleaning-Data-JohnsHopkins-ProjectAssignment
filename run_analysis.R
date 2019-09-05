# Source of raw datat: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# ASSIGNMENT STEPS:


# STEP 1 - Merges the training and the test sets to create one data set.
# removing from environment for memory saving

X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
X <- rbind(X_train, X_test)
rm(X_train)
rm(X_test)

y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
Y <- rbind(y_train, y_test)
rm(y_train)
rm(y_test)

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
Subject <- rbind(subject_train, subject_test)
rm(subject_train)
rm(subject_test)


# STEP 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
good_features_idx <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, good_features_idx]
# cleaning names
names(X) <- features[good_features_idx, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))


# STEP 3 - Uses descriptive activity names to name the activities in the data set.

activity <- read.table("activity_labels.txt")
activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))
Y[, 1] = activity[Y[ , 1], 2]
names(Y) <- "activity"


# STEP 4 - Appropriately labels the data set with descriptive activity names.

names(Subject) <- "subject"
tidy <- cbind(Subject, Y, X)
write.table(tidy, "tidy_dataset.txt")


# STEP 5 - Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(Subject)[, 1]
numSubjects = length(unique(Subject)[, 1])
numActivities = length(activity[, 1])
numColumns = dim(tidy)[2]
avg_tidy = tidy[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects){
  for (a in 1:numActivities){
    avg_tidy[row, 1] <- uniqueSubjects[s]
    avg_tidy[row, 2] <- activity[a, 2]
    temp <- tidy[tidy$subject == s & tidy$activity == activity[a, 2], ]
    avg_tidy[row, 3:numColumns] <- colMeans(temp[, 3:numColumns])
    row = row + 1
  }
}

write.table(avg_tidy, "avg_tidy_dataset.txt")