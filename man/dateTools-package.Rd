\name{dateTools-package}
\alias{dateTools-package}
\alias{dateTools}
\docType{package}
\title{Manipulate date and time series objects
}
\description{
\packageDescription{dateTools}
}
\details{
\packageDESCRIPTION{dateTools}
\packageIndices{dateTools}
}
\author{
\packageAuthor{dateTools}

Maintainer: \packageMaintainer{dateTools}
}
\references{
}
\keyword{ package }
\examples{
#Load dateTools package
library(dateTools)

# Create a date vector of monthly observations on first day of month:
firstOfMonth <- seq(as.Date('2000-01-01'),as.Date('2005-01-01'),by='month')
# Transform to end of month:
endOfMonth <- eomdate(firstOfMonth)

# Create a daily date vector with missing days:
dailyDates <- seq(as.Date('2000-01-01'),as.Date('2001-01-01'),by='day')
# Remove every fifth day
dailyDatesWithMissing <- dailyDates[-(seq(2,length(dailyDates),by = 5))]
dailyZooWithMissing <- zoo(rnorm(length(dailyDatesWithMissing)),order.by = dailyDatesWithMissing)
dailyZooFilled <- fillts(dailyZooWithMissing)
print(paste('Filled in ',length(dailyZooFilled) - length(dailyZooWithMissing),' missing days..',sep = ''))

# Aggregate dailyZooFilled to monthly frequency:
monthlyZoo <- tomonthly(dailyZooFilled)
}
