# Copyright © 2014  Igor Gritsenko

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

## function to read the data and merge it in one table
gatherdata <- function () {

	feats    <- read.table(file = "UCI HAR Dataset/features.txt",colClasses =
						   	"character")
	activs   <- read.table(file = "UCI HAR Dataset/activity_labels.txt")
	colNames <- c("Subject", "Activity", feats[[2]])

	ytest    <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
	ytrain   <- read.table(file = "UCI HAR Dataset/train/y_train.txt")

	subtest  <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")
	subtrain <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")
	xtrain   <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
	xtest    <- read.table(file = "UCI HAR Dataset/test/X_test.txt")

	syxtest  <- cbind(subtest, ytest, xtest, deparse.level = 0)
	syxtrain <- cbind(subtrain, ytrain, xtrain, deparse.level = 0)

	colnames(syxtest)  <- colNames
	colnames(syxtrain) <- colNames

	wholetbl <- rbind(syxtest, syxtrain, deparse.level = 0)
	acfac <- factor(cleanacts(activs[[2]]))

	wholetbl$Activity <- acfac[wholetbl$Activity]
	return(wholetbl)
}

## Function to make activities more human-readable
cleanacts <- function (v) {
	v <- sub("_", " ", v)
	v <- tolower(v)
	v <- sub("^(\\w)", "\\U\\1", v, perl = TRUE)
	return(v)
}

## Function to make features (aka column names) cleaner
cleanfeatures <- function (v) {
	v <- gsub("[-)(]", "", v)
	return (v)
}

cleandata <- function(x) {
	newcols <- grep("(mean|std)\\(\\)", colnames(x))
	x <- x[,c(1, 2, newcols)]
	return(x)
}

processdata <- function (x) {
	xmelt	<- melt(x, id=c("Subject", "Activity"),
				  measure.vars = colnames(x)[-c(1, 2)])
	dxmelt	<- dcast(xmelt, Subject+Activity~variable, mean)

	return(dxmelt)
}

run_analysis <- function() {

	if(!require(reshape2, quietly = TRUE, warn)) {
		stop("\nEssential package is not available!\nInstall reshape2 package.")
	}

	mytbl <- gatherdata()
	mytbl <- cleandata(mytbl)
	mytbl <- processdata(mytbl)
	write.table(mytbl, "tidydata.txt", row.names = FALSE)
	View(mytbl)
	return(mytbl)
}
