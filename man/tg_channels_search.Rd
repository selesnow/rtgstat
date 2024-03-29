% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tg_channels_search.R
\name{tg_channels_search}
\alias{tg_channels_search}
\title{Channel search}
\usage{
tg_channels_search(
  query = NULL,
  search_by_description = FALSE,
  country = "ru",
  language = "russian",
  category = NULL,
  limit = 100
)
}
\arguments{
\item{query}{Search keyword}

\item{search_by_description}{Search in channel description?}

\item{country}{Channel geography (country). Use \code{\link{tg_countries}} for get countries dictionary.}

\item{language}{Channel content language. Use \code{\link{tg_languages}} for get languages dictionary.}

\item{category}{Channel category. Use \code{\link{tg_categories}} for get categories dictionary.}

\item{limit}{Maximum number of channels in a response, no more than 100.}
}
\value{
tibble with channels
}
\description{
The method allows you to search for channels by keyword or get a list of channels in a category.
}
\examples{
\dontrun{
channels <- tg_channels_search(
   query    = "data",
   country  = "ru",
   category = "tech"
)
}

}
\references{
See also \href{https://api.tgstat.ru/docs/ru/channels/search.html}{TGStat API Documentation of metrod channels/search}
}
