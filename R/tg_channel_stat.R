#' Get channel stat
#' @description The method allows you to obtain basic statistics - the number of participants, the average coverage of the publication, the percentage of engagement of subscribers (ERR), the total daily coverage, the citation index (CI)
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#'
#' @return tibble with channel stat
#' @references See also \href{https://api.tgstat.ru/docs/ru/channels/stat.html}{TGstat API Documentation of metrod channels/stat}
#' @export
#' @examples
#' \dontrun{
#' channel_stat <- tg_channel_stat(channel_id = "R4marketing")
#' }
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
