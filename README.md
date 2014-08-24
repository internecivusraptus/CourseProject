# How To Run

1. Run R
2. Load the script into your environment 
`   source("run_analysis.R")   `
3. Run analysis function 
`   run_analysis()   `
4. It will produce simultaneously
  a. tidy data in your environment
  b. tidy data in tidydata.txt file

# How to understand variables

- See [CodeBook](../master/CodeBook.md)

# How does it work

At first data was read from files and merged into one 

# Useful information

- lowerCamelCase was used to provide better human-readability
- Each abbreviation was expanded into full-length word except std (standard deviation), e.g. Acc -> Accelerometer, etc. See ```cleancolnames``` function for better understanding of what and how it was expanded.
- wide data format was considered as a good tidy data approach
- meanFreq() variables wasn't considered as true mean variables because of description from original info
> weighted average of the frequency components to obtain a mean frequency

- angle() variables wasn't considered as true mean variables because of description from original info 
> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable.

# How is it licensed

- See [Licenses](../master/LICENSE.md)
