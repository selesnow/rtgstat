#' Get chennel info
#' @description  Get general information about the channel - link to the channel, name, description, avatar, number of subscribers at the moment.
#' @param channel_id hannel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#'
#' @return tibble with channel metadata
#'
#' @references See also \href{https://api.tgstat.ru/docs/ru/channels/subscribers.html}{TGstat API Documentation of metrod channels/get}
#'
#' @export
#' @examples
#' \dontrun{
#' channel <- tg_channel(channel_id = "R4marketing")
#' }
tg_channel <- function(
  channel_id
) {

  data <- tg_make_request(
    method    = 'channels/get',
    token     = tg_get_token(),
    channelId = channel_id
  ) %>%
    tg_set_response_class('to_list') %>%
    tg_parse_response()

  return(data)
}
