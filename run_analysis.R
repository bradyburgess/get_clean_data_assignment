# run_analysis.R

library(dplyr)


# Reads files from the Human Activity Recognition Using Smartphones Dataset Version 1.0
# and assembles data into: 
# 1) a dataset containing select data features and all observations  
# 2) a dataset containing data averaged by group and subject
# See associated readme file for more information

# Reads files in from the UCI HAR Dataset directory

test_y <- read.table("test/y_test.txt", stringsAsFactors = FALSE)
test_s <- read.table("test/subject_test.txt", stringsAsFactors = FALSE)
test <- read.table("test/X_test.txt", stringsAsFactors = FALSE, nrows = nrow(test_y)) 
train_y <- read.table("train/y_train.txt", stringsAsFactors = FALSE)
train_s <- read.table("train/subject_train.txt", stringsAsFactors = FALSE)
train <- read.table("train/X_train.txt", stringsAsFactors = FALSE, nrows = nrow(train_y)) 
features <- read.table("features.txt", stringsAsFactors = FALSE)
activity <- read.table("activity_labels.txt", stringsAsFactors = FALSE)


# binds the relevant row identifiers to the training dataset 
train <- cbind(train_s, train_y) %>% cbind(train) 
colnames(train) <- c('subject', "V1", features[, 2])

# binds the relevant row identifiers to the test dataset 
test <- cbind(test_s, test_y) %>% cbind(test) 
colnames(test) <- c('subject', "V1", features[, 2])

#joins both test and train sets 
all.data <- rbind(test, train) 
rm(test, train)

# replaces activity codes with meaningful descriptors provided with the dataset
all.data <- merge(activity, all.data) %>% rename(activity = V2) %>% select(2:564)

# extracts only datafeatures that represent mean() or std() values
extract.feats <- grep('mean()', colnames(all.data), fixed = TRUE)
extract.feats <- append(extract.feats, grep('std()', colnames(all.data), fixed = TRUE))
extract.feats <- sort(extract.feats)
tidy.data <- select(all.data, 2, 1, extract.feats)
rm(all.data)

# creates a separate summarized data set with all data features averaged by subject and activity
avg.data <- tidy.data %>% group_by(subject, activity) %>% summarize_all(funs(mean))

#writes out txt files for the full and summarized datasets
write.table(tidy.data, "tidy-extracted-data-all-observations.txt", col.names = TRUE, row.names = FALSE)
write.table(avg.data, "tidy-summary-by-grp-activity.txt", col.names = TRUE, row.names = FALSE)

# reads the summarized text file back in to memory if required
avg.data <- read.table("tidy-summary-by-grp-activity.txt", header = TRUE, check.names = FALSE)
tidy.data <- read.table("tidy-extracted-data-all-observations.txt", header = TRUE, check.names = FALSE)
