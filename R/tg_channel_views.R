#' Getting the number of views in dynamics
#' @details The method allows you to get the total number of views per day on the channel, in dynamics by days, weeks, months.
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#' @param start_date Start date of report period
#' @param end_date End date of report period
#' @param group Time group: hour, day, week, month
#'
#' @return tibble with channel views
#' @export
#'
#' @examples
#' \dontrun{
#' tg_auth('Your token')
#' tg_set_channel_id('R4marketing')
#'
#' views <- tg_channel_views(
#'   start_date = '2021-09-01',
#'   end_date = '2021-09-30',
#'   group = "day"
#' )
#' }
tg_channel_views <- function(
  channel_id = tg_get_channel_id(),
  start_date = Sys.Date() - 15,
  end_date = Sys.Date(),
  group = c("day", 'hour', 'week', 'month')
) {

  group <- match.arg(group)

  resp <- tg_make_request(
    method    = 'channels/views',
    token     = tg_get_token(),
    channelId = channel_id,
    startDate = as.numeric(as.POSIXct(start_date)),
    endDate   = as.numeric(as.POSIXct(end_date)),
    group     = group
  )

  data <- tg_parse_response(resp)

  return(data)

}
