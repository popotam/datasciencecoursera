corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    data = numeric(0)
    for (i in 1:332) {
        filename <- sprintf("%03d.csv", i)
        filepath <- paste(directory, filename, sep = "/")
        csv <- read.csv(filepath)
        complete <- na.omit(csv)
        if (nrow(complete) < threshold) {
            next
        }
        corr <- cor(complete[["sulfate"]], complete[["nitrate"]])
        data <- c(data, corr)
    }
    data
}
