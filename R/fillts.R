fillts <- function(zooDaily){
        startDate <- index(zooDaily)[1]
        endDate <- index(zooDaily)[length(index(zooDaily))]
        allDays <- seq(as.Date(startDate),as.Date(endDate),by = 'day')
        newZoo <- zoo(data.frame(zooDaily),order.by = allDays)
        filledDailyZoo <- na.locf(newZoo)

        return(filledDailyZoo)
}
