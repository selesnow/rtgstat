#' Retrieving a list of publications
#' @description The method allows you to get channel publications according to the specified parameters. Returns channel messages sorted in reverse chronological order (most recent from the top).
#'
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#' @param start_time Date of publication from
#' @param end_time Date of publication to
#' @param hide_forwards Hide reposts from search results
#' @param hide_deleted Hide deleted posts
#'
#' @return tibble with channel posts
#' @references See also \href{https://api.tgstat.ru/docs/ru/channels/posts.html}{TGStat API Documentation of metrod channels/posts}
#' @export
#'
#' @examples
#' \dontrun{
#' posts <- tg_channel_posts(
#'    channel_id = "R4marketing",
#'    start_time = "2021-11-01 00:00:00",
#'    end_time = "2021-11-30 23:59:59"
#' )
#' }
#'
tg_channel_posts <- function(
  channel_id = tg_get_channel_id(),
  start_time = Sys.Date() - 15,
  end_time = Sys.Date(),
  hide_forwards = 0,
  hide_deleted = 0
) {

  limit     <- 50
  offset    <- 0
  count     <- 0
  responses <- list()

  repeat {

    resp <- tg_make_request(
      method       = 'channels/posts',
      token        = tg_get_token(),
      channelId    = channel_id,
      limit        = limit,
      offset       = offset,
      startTime    = as.numeric(as.POSIXct(start_time)),
      endTime      = as.numeric(as.POSIXct(end_time)),
      hideForwards = hide_forwards,
      hideDeleted  = hide_deleted
    )

    responses <- append(responses, list(resp$response))

    count <- count + resp$response$count

    if ( count >= resp$response$total_count ) break

  }

  data <- map_dfr(responses, tg_parse_response,  parse_obj = 'items')

  return(data)
}
