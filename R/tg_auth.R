#' Set API Token of 'TgStat'
#'
#' @param token Your API token.
#' @references See also \href{https://api.tgstat.ru/docs/ru/start/token.html}{TGStat API Documentation of Authorization}
#'
#' @return Use only for set token. No return value.
#' @export
tg_auth <- function(
  token
) {

  Sys.setenv('TG_API_TOKEN' = token)
  cli_alert_success('API token was set success!')

}

#' Get API Token of 'TgStat'
#'
#' @return Api token
#' @export
tg_get_token <- function() {
  Sys.getenv('TG_API_TOKEN')
}
