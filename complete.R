work_dir <- getwd()
data_dir <- paste(work_dir,"/specdata",sep="")

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ## x <-data.frame()
  index<-c()
  nobs<-c()
  
  for (i in id) {
    file_name <- paste(formatC(i, width=3, flag="0"),".csv",sep="")
    file_path <- paste(directory,"/",file_name,sep="")
    data_raw <- read.csv(file_name)
    index <- rbind(index,i)
    
    cumSum <- 0
    # check for any NA's
    for (j in 1:nrow(data_raw)) {
      cumSum = cumSum + !any(is.na(data_raw[j,]))
    }
    
    nobs <- rbind(nobs,cumSum)
  }
  
  x <- cbind(index,nobs)
  colnames(x) <- c("id","nobs")
  rownames(x) <- 1:length(id)
  x <- as.data.frame(x)
}