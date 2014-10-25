
# R version 3.1.1 (2014-07-10) -- "Sock it to Me"

# Assume the dataset [UCI HAR Dataset] is the same directory as the [run_analysis,R] script.

# Loading dataset
activities <- read.table('.\\UCI HAR Dataset\\activity_labels.txt',
                        header = FALSE,stringsAsFactors=FALSE)
features <- read.table('.\\UCI HAR Dataset\\features.txt', 
                      header = FALSE, stringsAsFactors=FALSE)

X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")


# Merging the training and the test sets to create one data set.
#===============================================================================
Merges <- rbind(cbind(subject_train, y_train, X_train),
                  cbind(subject_test, y_test, X_test))

# Using descriptive activity names to name the activities in the data set
#===============================================================================

names(Merges) <- c("subject", "activity", features[,2])


# Appropriately labeling the data set with descriptive variable names. 
#===============================================================================
Merges$activity <- factor(Merges$activity, levels = c(1:6), 
                          labels = activities[,2])


# Extracting only the measurements on the mean and standard deviation for each measurement. 
#===============================================================================
tidy_data <- Merges[,c(1,2, grep('mean()',names(Merges)), 
                    grep('std()',names(Merges)))]


# Creating a second, independent tidy data set with the average of each 
# variable for each activity and each subject. 
#===============================================================================
library(reshape2)
tidy_data_2 <- melt(tidy_data, id=1:2, measure.vars = 3:68)

# casting data into data frame
tidy_final <- dcast(tidy_data_2, subject + activity ~ variable, mean)

# creating a text file containing the tidy_data set
write.table(tidy_final, "tidy_data.txt", row.names = FALSE)

