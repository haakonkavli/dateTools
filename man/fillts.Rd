\name{fillts}
\alias{fillts}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Fill daily zoo}
\description{
        Fills last day's value for all missing days
        }
\usage{
        filledDailyZoo <- fillts(dailyZoo)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
        \item{dailyZoo}{
                 Zoo object. Will be forced to daily if not already.}
}
\details{
        %%  ~~ If necessary, more details than the description above ~~
}
\value{
        Returns daily zoo object with no NAs (missing values filled with most recent observation.)}
\references{
        %% ~put references to the literature/web site here ~
}
\author{
        Haakon Kavli
}
\note{
        %%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

        \seealso{
                %% ~~objects to See Also as \code{\link{help}}, ~~~
        }
\examples{
        lastDate <- eomdate(c('2004-05-03','2004-06-03'))


        ## The function is currently defined as
        function (dates, format = "\%Y-\%m-\%d")
        {
                if (class(dates) == "yearmon") {
                        dates <- as.Date(dates)
                }
                else if (class(dates) == "character") {
                        dates <- as.Date(dates, format)
                }
                else if (class(dates) != "Date") {
                        stop("Must pass in 'Date', 'yearmon' or 'character' object. Character object may need a 'format' argument if non-standard format (see ?as.Date).")
                }
                firstDay <- as.Date(paste(format(dates, "\%Y-\%m"), "-01",
                                          sep = ""))
                nextMonth <- lapply(lapply(firstDay, seq, length = 2, by = "1 month"),
                                    "[", 2)
                lastDate <- do.call("c", lapply(lapply(nextMonth, seq, length = 2,
                                                       by = "-1 day"), "[", 2))
                dates.out <- lastDate
                return(dates.out)
        }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
