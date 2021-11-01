#' Get channel stat
#'
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#'
#' @return tibble with channel stat
#' @export
tg_channel_stat <- function(
  channel_id
) {

  data <- request('https://api.tgstat.ru/channels/stat') %>%
    req_url_query(
      token     = tg_get_token(),
      channelId = channel_id
    ) %>%
    req_perform() %>%
    resp_body_json()

  data <- tibble(res = list(data$response)) %>%
          unnest_wider('res')

  return(data)
}
