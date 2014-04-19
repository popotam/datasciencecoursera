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
    
    data = data.frame(row.names=c("id", "nobs"))
    for (i in id) {
        filename <- sprintf("%03d.csv", i)
        filepath <- paste(directory, filename, sep = "/")
        csv <- read.csv(filepath)
        nobs <- nrow(na.omit(csv))
        data <- rbind(data, c(i, nobs))
    }
    names(data) <- c("id", "nobs")
    data
}
