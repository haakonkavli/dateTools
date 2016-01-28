## Synopsis

The repository includes the **dateTools** R Package.

The package includes many replicas of Matlab's fints functions, such as:

1. **`eomdate()`**  - Finds the end of the month for each element in a vector of date objects.

2. **`tomonthly()`** - Aggregates a daily time series (zoo) to monthly frequency using the end of month observation.

3. **`fillts()`** - Fills the last observed value for each missing day in a time series (zoo) object. Recommende to use prior to `tomonthly()`.


## Code example

``` R
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

```

## Contributors
Haakon Kavli - Haakon.Kavli@Prescient.co.za

## License
Proprietary to Prescient Investment Management.

