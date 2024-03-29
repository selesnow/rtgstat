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
  cli_alert_info('Set CHANNEL ID: {.field {channel_id}}')
}

#' Get defaukt channel ID
#'
#' @return character, default session channel id
#' @export
tg_get_channel_id <- function(
) {
  return(getOption('tg.channel_id'))
}

#' Set API limit alert rate
#'
#' @param api_quote_alert_rate Max reach of API limit to alert
#'
#' @return using for side effect, no returm value
#' @export
tg_set_api_quote_alert_rate <- function(
  api_quote_alert_rate
) {
  options(tg.api_quote_alert_rate = api_quote_alert_rate)
  cli_alert_info('Set api_quote_alert_rate: {.field {api_quote_alert_rate}}')
}

#' Set max tries of HTTP queries
#'
#' @param max_tries integer, maximum number of attempts
#'
#' @return using for side effect, no returm value
#' @export
tg_set_max_tries <- function(
  max_tries
) {
  options(tg.max_tries = max_tries)
  cli_alert_info('Set max_tries: {.field {max_tries}}')
}

#' Set time interval in seconds between tries of HTTP queries
#'
#' @param interval delay between retries
#'
#' @return using for side effect, no return value
#' @export
tg_set_interval <- function(
  interval
) {
  options(tg.interval = interval)
  cli_alert_info('Set interval: {.field {interval}}')
}

#' Disable or enable API limit alert
#'
#' @param check_api_quote Logical, disable (or enable) API limit alerts
#'
#' @return using for side effect, no return value
#' @export
tg_set_check_api_quote <- function(
  check_api_quote
) {
  options(tg.check_api_quote = check_api_quote)
  cli_alert_info('Set check_api_quote: {.field {check_api_quote}}')
}

#' Get rtgstat option values
#'
#' @return no return data, using for side effect
#' @export
tg_options <- function() {

  tg_opt <- .Options[ grepl("tg\\.", names(.Options) ) ]
  hidden_set <- c("tg.api_token")
  tg_opt[hidden_set] <- '<hidden>'

  cli_text(style_bold('rtgstat options:'))
  walk(names(tg_opt), ~ cli_text(style_bold('{col_blue(.x)}: '), style_italic('{.field {tg_opt[.x]}}')))

}
