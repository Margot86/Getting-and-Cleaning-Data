#Load packages
library(data.table)
library(reshape2)

#Set working directory
setwd("~/Downloads/UCI HAR Dataset")

#Read the files .txt
dtSubjectTrain <- fread("subject_train.txt")
dtSubjectTest <- fread("subject_test.txt")
dtActivityTrain <- fread("Y_train.txt")
dtActivityTest <- fread("Y_test.txt")
dtTrain <- fread("X_train.txt")
dtTest <- fread("X_test.txt")
dtActivityNames <- fread("activity_labels.txt")

# Combines train and test sets
dtSubject <- rbind(dtSubjectTrain, dtSubjectTest)
dtActivity <- rbind(dtActivityTrain, dtActivityTest)
dt <- rbind(dtTrain, dtTest)

# Change names of the columns
setnames(dtSubject, "V1", "subject") #Change name "V1" of the column to "subject"
setnames(dtActivity, "V1", "activityNum")
setnames(dtActivityNames, names(dtActivityNames), c("activityNum", "activityName"))

# Merge columns
dtSubject <- cbind(dtSubject, dtActivity)
dt <- cbind(dtSubject, dt)

#setKey
setkey(dt, subject, activityNum)

dtFeatures <- fread("features.txt")
setnames(dtFeatures, names(dtFeatures), c("featureNum", "featureName"))
dtFeatures <- dtFeatures[grepl("mean\\(\\)|std\\(\\)", featureName)] #Select only the rows with mean() or std()
head(dtFeatures)

#Add a column featureCode
dtFeatures$featureCode <- dtFeatures[, paste0("V", featureNum)]

#Select the variables in dataset dt where the variable occurs in dtFeatures$featureCode
dt <- dt[, c(key(dt), dtFeatures$featureCode), with=FALSE]

#Add the activity names to dt based on column name "activityNum"
dt <- merge(x=dt, y=dtActivityNames, by="activityNum", all.x=TRUE)
setkey(dt, subject, activityNum, activityName)

#Reshape it to a more readable format keep the columns defined by setkey and give the new variable the name "featureCode"
dt <- data.table(melt(dt, key(dt), variable.name="featureCode"))

dt <- merge(x=dt, y=dtFeatures, by="featureCode", all.x=TRUE)

dt$activity <- factor(dt$activityName)
dt$feature <- factor(dt$featureName)
dt$subjectF <- factor(dt$subject)

# Making second tidy data set 
tidyData = aggregate(dt$value, by=list(activity = dt$activity, subject=dt$subjectF), FUN=mean, na.rm=TRUE)

# Writing the tidyData set to a txt file
write.table(tidyData, "tidyData.txt", row.names = FALSE)

