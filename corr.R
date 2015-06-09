work_dir <- getwd()
data_dir <- paste(work_dir,"/specdata",sep="")

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  x <- complete(directory)
  y <- c()
  
  
  for (i in 1:nrow(x)) {
    if (x$nobs[i] > threshold) {
      data_raw <- read.csv(paste(formatC(i, width=3, flag="0"),".csv",sep=""))
      index_good <- !is.na(data_raw[,2]) & !is.na(data_raw[,3]) 
      sulfate_clean <- data_raw[index_good,2]
      nitrate_clean <- data_raw[index_good,3]
      y <- rbind(y,cor(sulfate_clean,nitrate_clean))
    }
  }
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  y[,1]
}