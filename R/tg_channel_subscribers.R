#' Get channel subscribers nunmber by day
#' @description The method allows you to get the number of channel subscribers in dynamics by hours, days, weeks, months.
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#' @param start_date Start date of report period
#' @param end_date End date of report period
#' @param group Time group: hour, day, week, month
#'
#' @references See also \href{https://api.tgstat.ru/docs/ru/channels/subscribers.html}{TGstat API Documentation of metrod channels/subscribers}
#'
#' @return tibble with subscribers stat
#' @export
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
