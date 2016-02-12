fillts <- function(zooDaily){
        startDate <- index(zooDaily)[1]
        endDate <- index(zooDaily)[length(index(zooDaily))]
        allDays <- data.table(datestamp = seq(as.Date(startDate),as.Date(endDate),by = 'day'))
        setkey(allDays,'datestamp')
        oldZoo.dt <- data.table(datestamp = index(zooDaily), zooDaily)
        setkey(oldZoo.dt,'datestamp')
        newZoo.df <- data.frame(oldZoo.dt[allDays])
        newZoo <- zoo(newZoo.df[,-1],order.by = newZoo.df[,1])
        filledDailyZoo <- na.locf(newZoo)
        return(filledDailyZoo)
}
