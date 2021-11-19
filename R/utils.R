tg_make_request <- function(method, ...) {

  request(str_glue('https://api.tgstat.ru/{method}')) %>%
    req_url_query(...) %>%
    req_perform() %>%
    resp_body_json()

}

tg_set_response_class <- function(x, class) {
  class(x) <- c(class, class(x))
}

# parser
tg_parse_response <- function(resp) {
  UseMethod("tg_parse_response")
}


#' @export
tg_parse_response.default <- function(resp) {

  tibble(res = resp$response) %>%
    unnest_wider('res')

}

#' @export
tg_parse_response.to_list <- function(resp) {

  tibble(res = list(resp$response)) %>%
    unnest_wider('res')

}
