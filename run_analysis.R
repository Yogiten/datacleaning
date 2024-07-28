# Load required libraries
library(dplyr)

# Define the URL and the destination file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "UCI_HAR_Dataset.zip"

# Download and unzip the dataset
if (!file.exists(destfile)) {
  download.file(url, destfile, mode = "wb")
}
unzip(destfile)

# Read the data
# Training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Features and activity labels
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

# Merge training and test sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Extract only the measurements on the mean and standard deviation
mean_std_features <- grep("-(mean|std)\\(\\)", features$V2)
x_data <- x_data[, mean_std_features]
names(x_data) <- features$V2[mean_std_features]

# Use descriptive activity names to name the activities in the data set
y_data$V1 <- factor(y_data$V1, levels = activity_labels$V1, labels = activity_labels$V2)
names(y_data) <- "activity"

# Appropriately label the data set with descriptive variable names
names(subject_data) <- "subject"
all_data <- cbind(subject_data, y_data, x_data)

# Create a tidy data set with the average of each variable for each activity and each subject
tidy_data <- all_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Write the tidy data set to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

