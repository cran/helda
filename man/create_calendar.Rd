% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_calendar.R
\name{create_calendar}
\alias{create_calendar}
\title{Complete empty calendar}
\usage{
create_calendar(data, key_variable, time_variable, start_year, end_year)
}
\arguments{
\item{data}{a R data frame.}

\item{key_variable}{a character. This represents the variable name that refers to the key variable in the panel data (an ID, ...).}

\item{time_variable}{a character. This represents the time variable name that permits to sort observation on a time scale.}

\item{start_year}{integer of the starting year of the time series.}

\item{end_year}{integer of the ending year of the time series.}
}
\value{
a R data frame with the key and time variable. Each id key is associated with all years between
\code{start_year} and \code{end_year}.
}
\description{
This function allows to create a complete empty calendar on a year scale
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
\code{\link{start_end_to_fill}} \code{\link{gap_to_fill}}
}
\author{
Simon CORDE
}
\keyword{calendar}
\keyword{fill}
\keyword{gaps}
\keyword{series}
\keyword{time}
