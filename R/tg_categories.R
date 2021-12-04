#' Category list
#' @description List of 'TGStat' channel categories
#' @param lang Response language
#' @references See also \href{https://api.tgstat.ru/docs/ru/database/categories.html}{TGstat API Documentation of metrod database/categories}
#' @return tibble with categories
#' @export
tg_categories <- function(
  lang = NULL
) {

  data <- tg_make_request(
    method = 'database/categories',
    token  = tg_get_token(),
    lang   = lang,
    check_quote = FALSE
  ) %>%
    tg_parse_response()

  return(data)
}
