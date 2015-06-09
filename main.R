work_dir <- getwd()
data_dir <- paste(work_dir,"/specdata",sep="")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  ## for (i in 1:2) {
    ## load data file
  
  cumSum <- 0
  cumLength <- 0
  
  for (index in id) {
    data_raw <- read.csv(paste(formatC(index, width=3, flag="0"),".csv",sep=""))
  
    # remove NA's
    bad <- is.na(data_raw[,pollutant])
    data_clean = data_raw[!bad,pollutant]
    cumSum = cumSum + sum(data_clean)
    cumLength = cumLength + length(data_clean)
    
        
    }
  
  mean <- cumSum/cumLength
  
}