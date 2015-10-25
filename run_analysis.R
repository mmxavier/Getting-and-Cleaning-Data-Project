library(plyr)

#0.Read all the data

features <- read.table("features.txt") 
activities <- read.table("activity_labels.txt") 

xtrain <- read.table("train/X_train.txt")
xtest <- read.table("test/X_test.txt") 

ytrain <- read.table("train/y_train.txt") 
ytest <- read.table("test/y_test.txt")

subtrain <- read.table("train/subject_train.txt") 
subtest <- read.table("test/subject_test.txt") 

#1.Merges the training and the test sets to create one data set.

xdata <- rbind(xtrain, xtest) 
ydata <- rbind(ytrain, ytest) 
subdata <- rbind(subtrain, subtest) 

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 

meanstd <- grep("-(mean|std)\\(\\)", features[, 2]) 
xdatam <- xdata[, meanstd] 
names(xdatam) <- features[meanstd, 2] 

#3.Uses descriptive activity names to name the activities in the data set

ydata[, 1] <- activities[ydata[, 1], 2] 
names(ydata) <- "activity" 

#4.Appropriately labels the data set with descriptive variable names. 

names(subdata) <- "subject" 
alldata <- cbind(xdata, ydata, subdata) 

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66])) 
write.table(tidydata, "averages_data.txt", row.name=FALSE) 

