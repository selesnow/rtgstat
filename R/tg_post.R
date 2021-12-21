#' Retrieving publication data
#' @details Get information and publications in Telegram - number of views, publication date, content, ...
#' @param post_id Post ID (t.me/username/123, t.me/c/1256804429/1230 or post ID in TGStat)
#'
#' @return tibble with post data
#' @export
#'
#' @references See also \href{https://api.tgstat.ru/docs/ru/posts/get.html}{TGStat API Documentation of metrod posts/get}
#'
#' @examples
#' \dontrun{
#' post <- tg_post(
#'     post_id = 'https://t.me/R4marketing/887'
#' )
#' }
tg_post <- function(
  post_id
) {

  data <- tg_make_request(
    method    = 'posts/get',
    token     = tg_get_token(),
    postId    = post_id
  ) %>%
    tg_set_response_class('to_list') %>%
    tg_parse_response()

  return(data)
}
