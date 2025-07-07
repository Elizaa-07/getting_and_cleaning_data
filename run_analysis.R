library(dplyr)
library(tidyr)


# 1.1 Load the datasets (Test + Training)
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names = c("subject"))
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", col.names = "activity_code")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = c("subject"))
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "activity_code")

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

write.table(final_data, "tidy_dataset.txt", row.name = FALSE)


