#' Set session default channel id
#'
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#'
#' @return Using for side effect, no return data
#' @export
#'
#' @examples
#' \dontrun{
#' tg_set_channel_id('R4marketing')
#' stat <- tg_channel_stat()
#' }
tg_set_channel_id <- function(
  channel_id
) {
  options(tg.channel_id = channel_id)
}

#' Get defaukt channel ID
#'
#' @return character, default session channel id
#' @export
tg_get_channel_id <- function(
) {
  return(getOption('tg.channel_id'))
}
