#Read datasets
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

test_x <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

header.dat <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activity.dat <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Merge test/train
x <- rbind(train_x, test_x)
y <- rbind(train_y, test_y)
subject <- rbind(subject_train, subject_test)

#Feature fetch
heads <- as.character(header.dat[,2])
names(x) <- heads
names(y) <- c("Activity")
names(subject) <- c("Subject")

#Merging data sets to create single dataset
merge.dat <- cbind(x, y, subject)

#Replacing Activity IDs with appropriate activity names
names(activity.dat) <- c("V1","Activity_Name")
suppressWarnings(tidy <- merge(merge.dat, activity.dat, by.x = 'Activity', by.y = 'V1'))

#Rm obsolete/redundant col/frames
tidy$Activity <- NULL
rm(x, y, subject, train_x, train_y, subject_train, test_x, test_y, subject_test) 
rm(merge.dat, activity.dat)

#Extract measurements on mean and std
mean_std_names <- names(tidy[,grep("mean|std", names(tidy))])
mean_std_measures <- tidy[,mean_std_names]

#Create tidy dataset with average of each variable for each activity and each subject
tidy_activity_subject <- aggregate(mean_std_measures, by = list(tidy$Activity_Name,tidy$Subject), mean)

#Adding appropriate column names
names(tidy_activity_subject) <- c("Activity_Name", "Subject", names(mean_std_measures))

#write.csv(tidy, file = "merged.csv", row.names = FALSE)
write.table(tidy_activity_subject, file = "tidyData.txt", sep = ",", row.names = FALSE)
