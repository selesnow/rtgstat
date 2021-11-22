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
  ) %>%
    tg_set_response_class('to_list')
    tg_parse_response(resp = .$response$views)
  map_dfr(responses, tg_parse_response,  parse_obj = 'views')

  return(data)
}
