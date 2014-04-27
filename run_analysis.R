# PEER ASSIGNMENT OF GETTING AND CLEANING DATA. COURSERA 2014.

# DATA FROM: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#------------------------------------------------------------------------------------
# PART 1. Merges the training and the test sets to create one data set.

#note: if the files are in a diffrerent path, change path
X <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt")) 
S <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt"))
Y <- rbind(read.table("UCI HAR Dataset/train/y_train.txt"), read.table("UCI HAR Dataset/test/y_test.txt")) 
#------------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

feat <- read.table("UCI HAR Dataset/features.txt")
mean_std_feat <- grep("-mean\\(\\)|-std\\(\\)", feat[, 2])
X <- X[, mean_std_feat]
names(X) <- feat[mean_std_feat, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X)) 

#------------------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

#------------------------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive activity names.
names(S) <- "subject"
cleaned <- cbind(S, Y, X) #merge subjects, mean and std data and activities tables.
# write.table(cleaned, "cleaned_data.txt")---> Optional saving of the data before averaging.

#------------------------------------------------------------------------------------
# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
Subjects = unique(S)[,1]
num_Subjects = length(unique(S)[,1])
num_Activities = length(activities[,1])
num_Cols = dim(cleaned)[2]
result = cleaned[1:(num_Subjects*num_Activities), ]

row_count = 1
for (s in 1:num_Subjects) {
  for (nu in 1:num_Activities) {
    result[row, 1] = Subjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[nu, 2], ]
    result[row_count, 3:num_Cols] <- colMeans(tmp[, 3:num_Cols])
    row_count = row_count+1
  }
}
write.table(result, "tidy_data_set.txt") #result for the assignment.

