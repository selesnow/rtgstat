tg_make_request <- function(method, ...) {

  resp <- request(str_glue('{getOption("tg.base_url")}{method}')) %>%
    req_url_query(...) %>%
    req_perform() %>%
    resp_body_json()

  if ( 'error' %in% names(resp) ) {
    cli_abort(resp$error)
  }

  return(resp)

}

tg_set_response_class <- function(x, class) {
  class(x) <- c(class, class(x))
  return(x)
}

# parser
tg_parse_response <- function(resp, parse_obj = 'response') {
  UseMethod("tg_parse_response")
}


#' @export
tg_parse_response.default <- function(resp, parse_obj = 'response') {

  tibble(res = resp[[parse_obj]]) %>%
    unnest_wider('res')

}

#' @export
tg_parse_response.to_list <- function(resp, parse_obj = 'response') {

  tibble(res = list(resp[[parse_obj]])) %>%
    unnest_wider('res')

}
