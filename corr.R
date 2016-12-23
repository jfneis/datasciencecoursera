corr <- function(directory, threshold = 0) {

    result = numeric(0)
    
    for (f in list.files(directory)) {
        id = str_replace(f, ".csv", "")
        nobs = complete(directory, id)
        
        if ((nobs$nobs[1] >= threshold) & (nobs$nobs[1] > 0)) {
            data = filterCompleteObservations(directory, id)
            result <- c(result, cor(data$sulfate, data$nitrate))
        }
    }
    
    result
}