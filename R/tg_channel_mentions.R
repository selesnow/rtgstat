#' Getting a list of mentions
#' @description The method allows you to get a list of mentions of a channel in other channels.
#' @param channel_id Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ... or channel ID in 'TGStat')
#' @param start_date Date mentioned from
#' @param end_date Date mentioned to
#'
#' @return tibble with mention data
#' @export
#'
#' @references See also \href{https://api.tgstat.ru/docs/ru/channels/mentions.html}{TGStat API Documentation of metrod channels/mentions}
#'
#' @details
#' A publication is considered a mention if it contains a link to a channel like username, t.me/username, t.me/username/1234.
#' In case of mentioning a channel, the \code{mention_type} parameter will contain the value 'channel'. If a specific publication of the channel is mentioned, then the parameter will contain the value 'post'.
#'
#' @examples
#' \dontrun{
#' mentions <- tg_channel_mentions(
#'     channel_id = 'R4marketing',
#'     start_date = '2021-10-01',
#'     end_date = '2021-10-31'
#'  )
#' }
tg_channel_mentions <- function(
  channel_id = tg_get_channel_id(),
  start_date = Sys.Date() - 15,
  end_date = Sys.Date()
) {

  limit      <- 50
  offset     <- 0
  iteraction <- 0
  responses  <- list()

  repeat {

    iteraction <- iteraction + 1

    resp <- tg_make_request(
      method       = 'channels/mentions',
      token        = tg_get_token(),
      channelId    = channel_id,
      limit        = limit,
      offset       = offset,
      startDate    = as.numeric(as.POSIXct(start_date)),
      endDate      = as.numeric(as.POSIXct(end_date)),
      extended     = 1
    )

    if (length(resp$response) == 0) {
      cli_alert_warning("No data!")
      if ( iteraction > 1 ) {
        break
      } else {
      return(NULL)
      }
    }

    responses <- append(responses, list(resp$response))

    if ( length(resp$response$items) < limit ) break

    offset <- offset + limit

  }

  channels <- map_dfr(responses, tg_parse_response,  parse_obj = 'channels')
  items    <- map_dfr(responses, tg_parse_response,  parse_obj = 'items')
  data     <- left_join(items, channels, by = c("channelId" = "id")) %>%
              rename_with(to_snake_case) %>%
              mutate(post_date = as.POSIXct(.data$post_date, origin = '1970-01-01'))

  return(data)
}
