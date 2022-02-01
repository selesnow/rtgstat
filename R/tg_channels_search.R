#' Channel search
#' @description The method allows you to search for channels by keyword or get a list of channels in a category.
#'
#' @param query Search keyword
#' @param search_by_description Search in channel description?
#' @param country Channel geography (country). Use \code{\link{tg_countries}} for get countries dictionary.
#' @param language Channel content language. Use \code{\link{tg_languages}} for get languages dictionary.
#' @param category Channel category. Use \code{\link{tg_categories}} for get categories dictionary.
#' @param limit Maximum number of channels in a response, no more than 100.
#'
#' @return tibble with channels
#' @references See also \href{https://api.tgstat.ru/docs/ru/channels/search.html}{TGStat API Documentation of metrod channels/search}
#' @export
#'
#' @examples
#' \dontrun{
#' channels <- tg_channels_search(
#'    query    = "data",
#'    country  = "ru",
#'    category = "tech"
#' )
#' }
#'
tg_channels_search <- function(
  query                 = NULL,
  search_by_description = FALSE,
  country               = 'ru',
  language              = 'russian',
  category              = NULL,
  limit                 = 100
) {

  if ( missing(query) & missing(category) ) cli_abort('At least one of the query or category parameters must be passed.')

  resp <- tg_make_request(
    method                = 'channels/search',
    token                 = tg_get_token(),
    q                     = query,
    search_by_description = as.integer(search_by_description),
    country               = country,
    language              = language,
    category              = category,
    limit                 = limit
  )

  responses <- tg_parse_response(resp$response, parse_obj = 'items')

  return(responses)

}
