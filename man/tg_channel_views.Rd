% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tg_channel_views.R
\name{tg_channel_views}
\alias{tg_channel_views}
\title{Getting the number of views in dynamics}
\usage{
tg_channel_views(
  channel_id = tg_get_channel_id(),
  start_date = Sys.Date() - 15,
  end_date = Sys.Date(),
  group = c("day", "hour", "week", "month")
)
}
\arguments{
\item{channel_id}{Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')}

\item{start_date}{Start date of report period}

\item{end_date}{End date of report period}

\item{group}{Time group: hour, day, week, month}
}
\value{
tibble with channel views
}
\description{
Getting the number of views in dynamics
}
\details{
The method allows you to get the total number of views per day on the channel, in dynamics by days, weeks, months.
}
\examples{
\dontrun{
tg_auth('Your token')
tg_set_channel_id('R4marketing')

views <- tg_channel_views(
  start_date = '2021-09-01',
  end_date = '2021-09-30',
  group = "day"
)
}
}
