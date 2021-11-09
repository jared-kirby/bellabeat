rm(list = ls())
library(pillar)
library(plyr)
library(dplyr)

#Create a list of all Fitbit files to import for analysis
fitbit_file_dir <<- "D:/Kirby/Documents/R/data/Fitabase Data 4.12.16-5.12.16"
filenames <- list.files(fitbit_file_dir, pattern="*.csv")
#file_dir.file_names <- paste(fitbit_file_dir, filenames, sep="/")

#Display each file name for validation
#lapply(filenames, head)

# readCSVFunc <- function(filenames) {
#   filename <- filenames[1]
#   dfName <- filenames[1]
#   file_dir.file_name <- paste(fitbit_file_dir, filename, sep="/")
#   tempDF <<- read.csv(file_dir.file_name)
#   assign(paste0("DF",filename),tempDF)
#   #return(filename)
# }
#llply(filenames[2],readCSVFunc)


for (i in filenames) {
  filename <- i
  file_dir.file_name <- paste(fitbit_file_dir, filename, sep="/")
  print(filename)
  assign(paste0("df_",filename), read.csv(file_dir.file_name))
}



glimpse(first_df)
