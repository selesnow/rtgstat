#' Get channel stat
#'
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#'
#' @return tibble with channel stat
#' @export
tg_channel_stat <- function(
  channel_id
) {

  resp <- tg_make_request(
    method    = 'channels/stat',
    token     = tg_get_token(),
    channelId = channel_id
  ) %>% tg_set_response_class('to_list')

  data <- tg_parse_response(resp = resp)

  return(data)
}
