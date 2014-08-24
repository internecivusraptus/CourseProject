# How To Run

1. Run R
2. Load the script into your environment 
`   source("run_analysis.R")   `
3. Run analysis function 
`   run_analysis()   `
4. It will produce simultaneously
  1. tidy data in your environment
  2. tidy data in tidydata.txt file

# How to understand variables

- See [CodeBook](../master/CodeBook.md)

# How does it work

At first data was read from files via ```read.table()``` and merged into one table using a couple of ```cbind()```'s and ```rbind()```.
Then features names were searched with ```grep()``` for std() and mean() occurence and corresponding columns were selected for further processing.
After melting (```melt()```) and casting(```dcast()```) we got a tidy data set that still required some work on it.
First, feature names were expanded and last, activity ids were replaced with modified activity names. 
We have nothing more to do except for ```write.table()``` and ```return()```.
Our job is completed and fresh tidy dataset is produced. 

# Useful information

- Do not forget to add header=TRUE while read.table()
- lowerCamelCase was used to provide better human-readability
- Each abbreviation was expanded into full-length word except std (standard deviation), e.g. Acc -> Accelerometer, etc. See ```cleancolnames``` function for better understanding of what and how it was expanded.
- wide data format was considered as a good tidy data approach
- meanFreq() variables wasn't considered as true mean variables because of description from original info
> weighted average of the frequency components to obtain a mean frequency

- Mean columns inside angle() wasn't considered as true mean variables because of description from original info 
> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable.

- BodyBody is considered as mistyping, corrected in my dataset.

# How is it licensed

- See [Licenses](../master/LICENSE.md)
