pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    allData <- c()
    
    for (x in id) {
        # 3-digit x
        x <- formatC(x, width = 3, format = "d", flag = "0")
        
        # reads each file (file: directory/id.csv)
        idData = read.csv(paste(directory, "/", x, ".csv", sep = ""))   
        
        # merges with whole data
        allData <- c(allData, idData[[pollutant]])
    }
    
    # calculates the mean (!NA)
    mean(allData, na.rm = TRUE)
}