#' Getting publication statistics
#'
#' @param post_id Post ID (t.me/username/123, t.me/c/1256804429/1230 or post ID in TGStat)
#' @param group Grouping results (hour, day)
#' @details Obtaining publication statistics - the number of views at the moment, the list of reposts and mentions, the dynamics of the growth of views by hours / days.
#' @return list with tibbles
#' @export
#'
#' @references See also \href{https://api.tgstat.ru/docs/ru/posts/stat.html}{TGstat API Documentation of metrod posts/stat}
#'
#' @examples
#' \dontrun{
#' post_stat <- tg_post_stat(
#'     post_id = 'https://t.me/R4marketing/887',
#'     group = 'day'
#' )
#'
#' views <- post_stat$views
#' forwards <- post_stat$forwards
#' mentions <- post_stat$mentions
#' }
tg_post_stat <- function(
  post_id,
  group = c("day", 'hour')
) {

  group <- match.arg(group)

  responses <- tg_make_request(
    method    = 'posts/stat',
    token     = tg_get_token(),
    postId    = post_id,
    group     = group
  )

  views    <- tg_parse_response(resp = responses$response, parse_obj = 'views') %>%
              mutate(viewsGrowth = as.integer(.data$viewsGrowth)) %>%
              unnest_longer('viewsGrowth')
  forwards <- tg_parse_response(resp = responses$response, parse_obj = 'forwards')
  mentions <- tg_parse_response(resp = responses$response, parse_obj = 'mentions')

  res <- list(views = views, forwards = forwards, mentions = mentions)

  return(res)

}
