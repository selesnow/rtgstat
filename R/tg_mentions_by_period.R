#' Dynamics of the keyword mentions by period
#' @description A method to track the dynamics of mentions and reach of keywords or phrases. Suitable for monitoring the mention of a brand or person in Telegram publications. Returns the number of mentions and reach of a keyword for each day of the requested period.
#' @param query Search query
#' @param peer_type Source type (channel, chat, all)
#' @param start_date Published date from (timestamp)
#' @param end_date Date published to (timestamp)
#' @param group Time group: day, week, month
#' @param hide_forwards Hide reposts from search results
#' @param strong_search Enable strict search (disables morphology and search by part of a word)
#' @param minus_mords List of negative words (separator - space)
#' @param extended_syntax Whether the request uses [extended query syntax](https://api.tgstat.ru/docs/ru/extended-syntax.html), see details
#'
#' @return tibble with mention statistics
#' @export
#'
#' @references See also \href{https://api.tgstat.ru/docs/ru/words/mentions-by-period.html}{TGstat API Documentation of metrod words/mentions-by-period}
#'
#' @details
#' Keyword / phrase search methods support extended query syntax. You must pass the extendedSyntax parameter (or extended_syntax in newer API methods) to indicate to the parser that the search query contains statements from the extended query language.
#'
#' **Morphology:**
#'
#' Regardless of the form in which you used a word in a query, by default all its morphological forms are taken into account (in any case, singular and plural). That is, by request mom will also find publications in which mom, mom, mom, mom, etc. are found.
#' To change this behavior, you must use the `=` operator.
#'
#' **Exact occurrence of the word. Operator =**
#'
#' The `=` operator in front of a word tells the analyzer that the given word should be searched for in an exact match with the transmitted one. The query `=mom` will only find posts with the word mom. Publications containing the words mum, mum, mum, mum in the text will NOT be found.
#'
#' **Search by multiple words**
#'
#' When transferring several words separated by spaces to a search query, publications will be found in which each of these words occurs at the same time.
#' The request mom dad will find publications in the text of which both of these words appear simultaneously in any order and case, at any distance from each other.
#'
#' **OR operator |**
#'
#' If you need to find publications in which at least one of the words occurs, you must use the OR operator `|`.
#' Request `Mom | dad` will find publications in the text of which at least one of these words is found.
#'
#' **Search for a phrase. Operator ""**
#'
#' The query `mama washed the frame`, enclosed in double quotes, sets a strict word order, explaining to the analyzer that it needs to find the entire phrase passed. Only those publications will be found in which these three words appear side by side in the same order as specified in the request.
#' Publications containing these words in word forms other than those submitted will also be found. To change this behavior, you must use the `=` operator.
#' The `query = "mama soap frame"` will only find publications in which these three words appear side by side in the same order and in the same case as indicated in the query.
#'
#' **Using negative keywords. Operator -**
#'
#' Using the operator `-` you can specify which words should not appear in the text of the publication. The query `"mama soap" -frame` will show publications that contain the phrases mummy soap, mummy washed, ..., but do not contain the words frame, frame, etc.
#'
#' **Grouping words. Operator ()**
#'
#' Using parentheses in a search query allows you to group parts of a query and make more complex combinations using the operators described above.
#' The query `(mom | dad | brother | sister)` `(soap | painted)` `(frame | door)` will find publications in the text of which at least one word from each word group is necessarily found. Those. publications will be found containing: mom washed the frame, dad washed the frame, sister painted the door, etc.
#' The query `(mom | dad) (dyed) - (frame | door | hair)` will find publications, the text of which must contain at least one of the words of the first group mom, dad, it must contain a word from the second group painted, dyed, dyed, but not contains words from the last group frame, door, hair.
#'
#' You can practice writing search queries in our [publication search tool](https://tgstat.ru/search) (do not forget to check the "Advanced language" checkbox to enable the advanced query syntax mode).
#'
#' @examples
#' \dontrun{
#' mentions <- tg_mentions_by_period(
#'     query = 'Alexey Seleznev',
#'     start_date = '2021-09-01',
#'     end_date = '2021-09-30'
#' )
#' }
tg_mentions_by_period <- function(
  query,
  peer_type = c('all', 'channel', 'chat'),
  start_date = Sys.Date() - 15,
  end_date = Sys.Date(),
  group = c("day", 'week', 'month'),
  hide_forwards = 0,
  strong_search = 0,
  minus_mords = NULL,
  extended_syntax = 0
) {

  group     <- match.arg(group)
  peer_type <- match.arg(peer_type)

  resp <- tg_make_request(
      method         = 'words/mentions-by-period',
      token          = tg_get_token(),
      q              = query,
      peerType       = peer_type,
      startDate      = as.numeric(as.POSIXct(start_date)),
      endDate        = as.numeric(as.POSIXct(end_date)),
      group          = group,
      hideForwards   = hide_forwards,
      strongSearch   = strong_search,
      minusWords     = minus_mords,
      extendedSyntax = extended_syntax
  )

  res <- tg_parse_response(resp$response, parse_obj = 'items')

  return(res)

}
