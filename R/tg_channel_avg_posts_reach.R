#' Getting the average coverage of channel publications over time
#' @description Allows you to get the indicator "average coverage of publications" in dynamics by days, weeks, months.
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#' @param start_date Start date of report period
#' @param end_date End date of report period
#' @param group Time group: day, week, month
#'
#' @references See also \href{https://api.tgstat.ru/docs/ru/channels/avg-posts-reach.html}{TGStat API Documentation of metrod channels/avg-posts-reach}
#'
#' @return tibble with post reach dinamics
#' @export
#'
#' @details
#' For the \code{group = 'day'} grouping, the value for the "average coverage of publications" as of the end of the day will be returned.
#' For groupings \code{group = 'week'} and \code{group = 'month'}, the value of the indicator "average coverage of publications" at the end of the last day of the period (week or month) will be returned.
#' By default, the result will be returned for the last 10 days. However, you can specify the required period using the `start_date` and `end_date` parameters, while observing the restrictions on your tariff.
#' Depending on the requested grouping type group - the `period` field will take one of the following formats:
#' * day: Y-m-d
#' * week: Y-W
#' * month: Y-m
#'
#' @examples
#' \dontrun{
#' tg_set_channel_id('R4marketing')
#' post_reach <- tg_channel_avg_posts_reach()
#' }
tg_channel_avg_posts_reach <- function(
  channel_id = tg_get_channel_id(),
  start_date = Sys.Date() - 15,
  end_date = Sys.Date(),
  group = c('day', 'week', 'month')
) {

  group <- match.arg(group)

  resp <- tg_make_request(
    method    = 'channels/avg-posts-reach',
    token     = tg_get_token(),
    channelId = channel_id,
    startDate = as.numeric(as.POSIXct(start_date)),
    endDate   = as.numeric(as.POSIXct(end_date)),
    group     = group
  )

  data <- tg_parse_response(resp)

  return(data)

}
