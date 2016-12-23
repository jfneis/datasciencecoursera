complete <- function(directory, id = 1:332) {
    file = c()
    nobs = c()
    
    for (x in id) {
        completeObs = filterCompleteObservations(directory, x)
        
        # counts
        file <- c(file, x)
        nobs <- c(nobs, nrow(completeObs))
    }

    data.frame(id = file, nobs = nobs)
}

filterCompleteObservations <- function(directory, id) {
    # 3-digit x
    x <- formatC(id, width = 3, format = "d", flag = "0")
    
    # reads each file (file: directory/id.csv) and filters
    data <- read.csv(paste(directory, "/", x, ".csv", sep = ""))   
    data <- subset(data, !is.na(data$sulfate) & !is.na(data$nitrate))
    
    data
}