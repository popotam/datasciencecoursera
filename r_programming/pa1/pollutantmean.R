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
    
    data <- numeric(0)
    for (i in id) {
        filename <- sprintf("%03d.csv", i)
        filepath <- paste(directory, filename, sep = "/")
        csv <- read.csv(filepath)
        data <- c(data, csv[[pollutant]])
    }
    mean(data, na.rm = TRUE)
}
