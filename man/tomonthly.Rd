\name{tomonthly}
\alias{tomonthly}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Convert zoo from daily to monthly}
\description{
Convert zoo from daily to monthly by using end of month observation
}
\usage{
tomonthly(daily, aggMethod = "Nearest")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{daily}{
zoo object of daily frequency}
  \item{aggMethod}{
character string with value Nearest or Exact}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns zoo object of monthly frequency}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Haakon Kavli}
\note{
Plan to add more aggregation methods}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# Generate data for zoo object with daily frequency
daily.data <- rnorm(1000)
daily.dates <- seq(Sys.Date(),length = 1000,by = "1 day")
daily.zoo <- zoo(daily.data,order.by = daily.dates)

# Convert daily frequency to monthly frequency using last observed data for each month
monthly.zoo <- tomonthly(daily.zoo)


# Convert daily frequency to monthly frequency using data observed on last date of month
monthly.zoo <- tomonthly(daily.zoo,aggMethod = "Exact")


## The function is currently defined as
function (daily, aggMethod = "Nearest")
{
    if (class(daily) != "zoo") {
        stop("Must pass in daily zoo object..")
    }
    days <- index(daily)
    alldays <- seq(as.Date(days[1]), as.Date(days[length(days)]),
        1)
    alldaily <- merge(daily, zoo(rep(0, length(alldays)), order.by = alldays))
    if (aggMethod == "Nearest") {
        alldaily <- na.locf(alldaily[, -ncol(alldaily)])
    }
    else if (aggMethod == "Exact") {
        alldaily <- alldaily[, -ncol(alldaily)]
    }
    else {
        alldaily <- na.locf(alldaily[, -ncol(alldaily)])
        warning("Invalid aggregation method (aggMethod) specified - I used default value: Nearest.")
    }
    months <- unique(eomdate(alldays))
    monthly <- alldaily[as.Date(index(alldaily)) \%in\% months,
        ]
    return(monthly)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
