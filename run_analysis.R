getwd()
library(data.table)
library(dplyr)
library(stringr)
#Load libraries, read data in.
fread("data/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
fread("data/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
testDat <- fread("data/UCI HAR Dataset/test/subject_test.txt")
trainDat <- fread("data/UCI HAR Dataset/train/subject_train.txt")
## merge data sets
mergeDat <- rbind(testDat, trainDat)
## save the merged data sets in csv form 
write.csv(mergeDat, "data/UCI HAR Dataset/merged/subject_merge.txt")

#create a list to store file names, to reference in the loop
inSigPrefixes <- list()
inSigPrefixes$test  <- paste0("data/UCI HAR Dataset/test/Inertial Signals/",dir("data/UCI HAR Dataset/test/Inertial Signals"))
inSigPrefixes$train <- paste0("data/UCI HAR Dataset/train/Inertial Signals/",dir("data/UCI HAR Dataset/train/Inertial Signals"))
testSuffix <- "test.txt"
trainSuffix <- "train.txt"
masterTable <- NULL
#main loop to merge data. Strategy: combine data sets, then take the mean and sd of them.
#use that as one pair of measurements. Repeat this for all inertial signals.
# we build masterTable with these pairs, then after the loop is complete, we write that to file.
# as per the specifications, this output is to a txt, not a csv.
for(i in 1:length(inSigPrefixes$test)){
  testData <- fread(inSigPrefixes$test[i])
  trainData <- fread(inSigPrefixes$train[i])
  mergeData <- rbind(testData, trainData)
  flatData <- unlist(mergeData)
  endMean <- mean(flatData)
  endSD <- sd(flatData)
  summaryMat <- matrix(c(endMean, endSD), 
                       dimnames = list(c("mean","sd"), 
                                       str_sub(dir("data/UCI HAR Dataset/test/Inertial Signals"),1,-10)[i])
                )
  masterTable <- cbind(masterTable, summaryMat)
  write.table(summaryMat,
              file = gsub(".txt", "_summary.csv", gsub("test", "merged", inSigPrefixes$test[i])))
  write.csv(mergeData, file = gsub("txt", "csv", gsub("test", "merged", inSigPrefixes$test[i])))
}
write.table(masterTable, file = "data/UCI HAR Dataset/merged/Inertial Signals/all_inertia_summary.txt")
flatdata <- ydata <- xdata <- list()
# we do similar combinations for the remaining non-inertial files, then write to another csv
xdata$test <- fread("data/UCI HAR Dataset/test/X_test.txt")
xdata$train <- fread("data/UCI HAR Dataset/train/X_train.txt")
ydata$test <- fread("data/UCI HAR Dataset/test/Y_test.txt")
ydata$train <- fread("data/UCI HAR Dataset/train/Y_train.txt")
flatdata$y <- unlist(ydata)
flatdata$x <- unlist(xdata)
endMean <- mean(unlist(flatData))
  endSD <- sd(unlist(flatData))
  summaryMat <- matrix(c(endMean, endSD), 
                       dimnames = list(c("mean","sd"))
                )
write.csv(summaryMat,
            file = "data/UCI HAR Dataset/XYSummary.csv")