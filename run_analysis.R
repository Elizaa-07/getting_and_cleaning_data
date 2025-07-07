library(dplyr)
library(tidyr)


# 1. Download and unzip the dataset if it doesn't already exist
filename <- "UCI_HAR_Dataset.zip"
foldername <- "UCI HAR Dataset"

if (!file.exists(filename)) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, destfile = filename, mode = "wb")
}

if (!file.exists(foldername)) {
  unzip(filename)
}

# 2. Read in the data
features <- read.table(file.path(foldername, "features.txt"), col.names = c("index", "feature"))
activities <- read.table(file.path(foldername, "activity_labels.txt"), col.names = c("code", "activity"))

subject_train <- read.table(file.path(foldername, "train", "subject_train.txt"), col.names = "subject")
X_train <- read.table(file.path(foldername, "train", "X_train.txt"), col.names = features$feature)
Y_train <- read.table(file.path(foldername, "train", "y_train.txt"), col.names = "activity_code")

subject_test <- read.table(file.path(foldername, "test", "subject_test.txt"), col.names = "subject")
X_test <- read.table(file.path(foldername, "test", "X_test.txt"), col.names = features$feature)
Y_test <- read.table(file.path(foldername, "test", "y_test.txt"), col.names = "activity_code")


# 1.2 Merge Data 
x <- rbind(X_train, X_test)
y <- rbind(Y_train, Y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, x,y)

# 2.1 Extracts only the measurements on the mean and standard deviation for each measurement
mean_std_columns <- grep("mean|std", names(merged_data), value = TRUE)
selected_columns <- c("subject","activity_code", mean_std_columns)
tidy_data <- merged_data %>%
  select(all_of(selected_columns))

tidy_data$activity_code <- activities[tidy_data$activity_code, 2]
names(tidy_data)[2] <- "activity"

names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))

final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

write.table(final_data, "tidy_dataset.txt", row.names = FALSE)
print("Tidy data written to file!")


