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
  options(tg.api_token = token)
  cli_alert_success('API token was set success!')

}

#' Get API Token of 'TgStat'
#'
#' @return Api token
#' @export
tg_get_token <- function() {
  if (!is.null(getOption('tg.api_token'))) {
    return(getOption('tg.api_token'))
  }
  if (identical(Sys.getenv('TG_API_TOKEN'), "")) {
    cli_abort("API token does't set. Please use tg_auth() for authorization.")
  } else {
    return(Sys.getenv('TG_API_TOKEN'))
  }
}
