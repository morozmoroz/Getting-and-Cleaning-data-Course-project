##Reading test data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

##Reading train data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Merging tes and train data sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subj_data <- rbind(subj_train, subj_test)

## Reading texts
features_texts <- read.table("./UCI HAR Dataset/features.txt")
activity_texts <- read.table("./UCI HAR Dataset/activity_labels.txt")

## assigning correct names to data frame columns
for (counter in features_texts[,1]) {
        names(x_data)[counter]<-paste(features_texts[counter,2])
}

## Assigning activity labels
y_data$Activity <- activity_texts[y_data[[1]],2]


##Finding unnecessary columns 
un_columns =    grepl("mean()", features_texts[,2], fixed = T) |
                grepl("std()", features_texts[,2], fixed = T)

##Removing unnecessary columns 
x_data <- x_data[,un_columns]

##Adding subject and activity labels
x_data$Activity = y_data$Activity
x_data$Subject  = subj_data[[1]]

##Aggregating data by Activity and Subject, calculating mean for other columns
result <- ddply(x_data, .(Activity, Subject), function(df) colwise(mean)(df[, 1:66]) )

## writing data to the disc
write.table(result, "result.txt", row.name=FALSE)