# extra import ------------------------------------------------------------
is_response <- getFromNamespace("is_response", "httr2")
globalVariables(".data")
globalVariables(".env")

# request -----------------------------------------------------------------
tg_make_request <- function(method, ..., check_quote = TRUE) {

  if ( check_quote ) {
    api_quote <- tg_api_usage()
    print(api_quote, tbl = FALSE)
  }

  resp <- request(str_glue('{getOption("tg.base_url")}{method}')) %>%
    req_url_query(...) %>%
    req_user_agent("rtgstat") %>%
    req_retry(
      max_tries    = getOption('tg.max_tries'),
      is_transient = ~ !is_response(.x) && resp_status(.x) != 200,
      after        = getOption('tg.interval')
    ) %>%
    req_perform()

  resp <- resp_body_json(resp)

  if ( 'error' %in% names(resp) ) {
    cli_abort(resp$error)
  }

  return(resp)

}

tg_set_response_class <- function(x, class) {
  class(x) <- c(class, class(x))
  return(x)
}


# parser ------------------------------------------------------------------
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


# chek api quote ----------------------------------------------------------
tg_quote_printer <- function(
  x,
  service_key,
  quote_type
) {

  fact <- tg_get_api_quote(x, service_key) %>%
          select(any_of(quote_type)) %>%
          pull(quote_type)

  if ( fact > getOption('tg.api_quote_alert_rate') ) {
    cli_ul(style_italic(col_br_red('API {str_replace_all(quote_type, "_", " ")} quota limit has reached over {getOption("tg.api_quote_alert_rate") * 100}%')))
  }

}

tg_get_api_quote <- function(x, service_key) {
  filter(x, .data$service_key == .env$service_key)
}
