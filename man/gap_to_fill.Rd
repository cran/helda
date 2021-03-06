% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gap_to_fill.R
\name{gap_to_fill}
\alias{gap_to_fill}
\title{Filling intermediate gaps in a time serie}
\usage{
gap_to_fill(data, gap_variable, key_variable, time_variable, digits = 2)
}
\arguments{
\item{data}{a R data frame.}

\item{gap_variable}{a character. This represents the name of the variable we want to fill the start and end gaps.}

\item{key_variable}{a character. This represents the variable name that refers to the key variable in the panel data (an ID, ...).}

\item{time_variable}{a character. This represents the time variable name that permits to sort observation on a time scale.}

\item{digits}{an integer. This is the number of decimals to keep for the rounding (by default set to 2).}
}
\value{
a R data frame that contains the original columns and a new one:
\itemize{
 \item \code{gap_variable}_corrected_2: the gap variable with intermediate gaps filled
 }
}
\description{
This function allows to fill intermediate gaps in panel data by linear interpolation
}
\examples{
library(dplyr)

# We take three countries from 2011 to 2018
fr_sp_ge_pop <- world_countries_pop \%>\%
filter(country_name \%in\% c('France', 'Spain', 'Germany')) \%>\%
filter(year > 2010) \%>\%
arrange(country_name, year)

# We artificially create some gaps in time series
fr_sp_ge_pop$population[c(1, 5, 11, 12, 24)] <- NA
fr_sp_ge_pop <- na.omit(fr_sp_ge_pop)

data_1 <- create_calendar(data = fr_sp_ge_pop, key_variable = "country_code",
time_variable = "year", start_year = 2011, end_year = 2018)
data_2 <- start_end_to_fill(data = fr_sp_ge_pop, calendar = data_1, gap_variable = "population",
key_variable = "country_code", time_variable = "year")
data_3 <- gap_to_fill(data = data_2, gap_variable = "population_corrected_1",
key_variable = "country_code", time_variable = "year", digits = 1)
}
\references{
Link to the author's github package repository:
\url{https://github.com/Redcart/helda}
}
\seealso{
\code{\link{create_calendar}} \code{\link{start_end_to_fill}}
}
\author{
Simon CORDE
}
\keyword{fill}
\keyword{gaps}
\keyword{interpolation}
\keyword{series}
\keyword{time}
