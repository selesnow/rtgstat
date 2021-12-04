#' List of languages
#' @description List of available languages for 'TGStat' channels
#' @param lang Response language
#'
#' @return tibble
#' @export
#' @references See also \href{https://api.tgstat.ru/docs/ru/database/languages.html}{TGstat API Documentation of metrod database/languages}
tg_languages <- function(
  lang = NULL
) {

  data <- tg_make_request(
    method = 'database/languages',
    token  = tg_get_token(),
    lang   = lang,
    check_quote = FALSE
  ) %>%
    tg_parse_response()

  return(data)
}
