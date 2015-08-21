This script is developed as course project for "Getting and cleaning data" course on Coursera:
https://class.coursera.org/getdata-031/human_grading

Data downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Script needs it to pe unzipped in a working directory.Data is processed in following steps: 

1. Read test and train data;
2. Merge test and train data sets;
3. Read texts for variables 
4. Assign correct names to data frame columns;
5. Assign activity labels;
6. Remove columns except those containing mean() and std()
7. Add subject and activity labels do a data set
8. Aggregate data by Activity and Subject, calculating mean for other columns
9. Write result to a disk