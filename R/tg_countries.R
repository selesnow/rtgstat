#' List of countries
#' @description List of countries 'TGStat'
#' @param lang Response language
#'
#' @return tibble with countries
#' @export
#' @references See also \href{https://api.tgstat.ru/docs/ru/database/countries.html}{TGstat API Documentation of metrod database/countries}
tg_countries <- function(
  lang = NULL
) {

  data <- tg_make_request(
    method = 'database/countries',
    token  = tg_get_token(),
    lang   = lang
  ) %>%
    tg_parse_response()

  return(data)
}
