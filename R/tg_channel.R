#' Get chennel info
#'
#' @param channel_id hannel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#'
#' @return tibble with channel metadata
#' @export
tg_channel <- function(
  channel_id
) {

  resp <- tg_make_request(
    method    = 'channels/get',
    token     = tg_get_token(),
    channelId = channel_id
  ) %>% tg_set_response_class('to_list')

  data <- tg_parse_response(resp = resp)

  return(data)
}
