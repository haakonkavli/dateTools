tomonthly <- function(daily,aggMethod = 'Nearest'){

        # Check that zoo object is passed
        if (class(daily) != 'zoo') {
                stop('Must pass in daily zoo object..')
        }

        # Get days:
        days <- index(daily)

        # Find all days in sample period:
        alldays <- seq(as.Date(days[1]),as.Date(days[length(days)]),1)

        # Add in missing days:
        alldaily <- merge(daily,zoo(rep(0,length(alldays)),order.by = alldays))

        # Fill in last observed value for missing days
        if (aggMethod == 'Nearest') {
                alldaily <- na.locf(alldaily[,-ncol(alldaily)])
        } else if (aggMethod == 'Exact') {
                alldaily <- alldaily[,-ncol(alldaily)]
        } else {
                alldaily <- na.locf(alldaily[,-ncol(alldaily)])
                warning('Invalid aggregation method (aggMethod) specified - I used default value: Nearest.')
        }

        months <- unique(eomdate(alldays))
        monthly <- alldaily[as.Date(index(alldaily)) %in% months,]
        return(monthly)
}
