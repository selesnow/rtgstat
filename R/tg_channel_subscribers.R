#' Get channel subscribers nunmber by day
#' @description The method allows you to get the number of channel subscribers in dynamics by hours, days, weeks, months.
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#' @param start_date Start date of report period
#' @param end_date End date of report period
#' @param group Time group: hour, day, week, month
#'
#' @details
#' For grouping group = day, the number of subscribers as of the end of the day will be returned.
#'
#' For groupings group = week and group = month, the number of subscribers at the end of the last day of the period (week or month) will be returned.
#'
#' Depending on the requested grouping type group - the period field will take one of the following formats:
#' * hour: Y-m-d H:00
#' * day: Y-m-d
#' * week: Y-W
#' * month: Y-m
#'
#' @references See also \href{https://api.tgstat.ru/docs/ru/channels/subscribers.html}{TGstat API Documentation of metrod channels/subscribers}
#'
#' @return tibble with subscribers stat
#' @export
#' @examples
#' \dontrun{
#' channel_subscribers <- tg_channel_subscribers(
#'     channel_id = "R4marketing",
#'     start_date = "2021-06-01",
#'     end_date = "2021-10-31",
#'     group = "month"
#'  )
#' }
tg_channel_subscribers <- function(
  channel_id,
  start_date = Sys.Date() - 15,
  end_date = Sys.Date(),
  group = c("day", 'hour', 'week', 'month')
) {

  group <- match.arg(group)

  resp <- tg_make_request(
    method    = 'channels/subscribers',
    token     = tg_get_token(),
    channelId = channel_id,
    startDate = as.numeric(as.POSIXct(start_date)),
    endDate   = as.numeric(as.POSIXct(end_date)),
    group     = group
  )

  data <- tg_parse_response(resp)

  return(data)

}
