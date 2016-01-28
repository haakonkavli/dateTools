eomdate <- function(dates,format =  "%Y-%m-%d"){
# Input arguments:
        # dates = 'Date', 'yearmon' or 'character' object with dates to be transformed to end of month.
        # format = character object specifying format of date. Only necessary if 'dates' is character object and non-standard format (see ?as.Date).
        if (class(dates) == 'yearmon') {
              dates <- as.Date(dates)


        } else if (class(dates) == "character") {
                dates <- as.Date(dates,format)


        } else if (class(dates) != "Date") {
                stop("Must pass in 'Date', 'yearmon' or 'character' object. Character object may need a 'format' argument if non-standard format (see ?as.Date).")
        }
        #Move to the first of next month, then subtract one day to get last day of current month
        firstDay <- as.Date(paste(format(dates,'%Y-%m'),'-01',sep = ''))
        nextMonth <- lapply(lapply(firstDay,seq,length=2,by='1 month'),'[',2)
        lastDate <- do.call("c",lapply(lapply(nextMonth,seq,length=2,by='-1 day'),'[',2))
        dates.out <- lastDate
        return(dates.out)
}
