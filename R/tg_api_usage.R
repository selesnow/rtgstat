#' API request statistics
#'
#' @return tibble with API quote stat
#' @export
tg_api_usage <- function(){

  data <- tg_make_request(
    method      = 'usage/stat',
    token       = tg_get_token(),
    check_quote = FALSE
  ) %>%
    tg_parse_response() %>%
    rename_with(to_snake_case)

  columns_to_flatting <- c('spent_channels', 'spent_words', 'spent_requests')

  for ( col in columns_to_flatting ) {

    col_names <- paste(col, c('fact', 'limit'), sep = '_')

    if ( 'spent_channels' %in% names(data) ) {

      data <-
        separate(data, .data[[col]], into = col_names, sep = '/') %>%
        mutate(
          across(col_names, as.numeric),
          across(col_names, replace_na, 0)
        )

    } else {

      data[[col_names[1]]] <- 0
      data[[col_names[2]]] <- 0

    }

  }

  data <- data %>%
    mutate(expired_at = as.POSIXct(.data$expired_at, origin = '1970-01-01'),
           spent_channels_rate = .data$spent_channels_fact / .data$spent_channels_limit,
           spent_requests_rate = .data$spent_requests_fact / .data$spent_requests_limit,
           spent_words_rate    = .data$spent_words_fact    / .data$spent_words_limit,
           across(c('spent_channels_rate',
                    'spent_requests_rate',
                    'spent_words_rate'),
                  replace_na, 0)) %>%
    tg_set_response_class('tg_api_quote')

  return(data)

}

# quota print method ------------------------------------------------------
#' @export
print.tg_api_quote <- function(x, ..., tbl=TRUE) {

  x_quote_warn <- filter(x,
                   .data$spent_channels_rate >= getOption('tg.api_quote_alert_rate') |
                   .data$spent_requests_rate >= getOption('tg.api_quote_alert_rate') |
                   .data$spent_words_rate    >= getOption('tg.api_quote_alert_rate'))

  for (sk in x_quote_warn$service_key) {

    api_name <- x_quote_warn[x_quote_warn$service_key==sk, "title"]
    cli_alert_warning(style_bold('{api_name}:'))

    api_checker_list <- list(
      x = rep(list(tg_get_api_quote(x_quote_warn, sk)), 3),
      service_key = rep(sk, 3),
      quote_type = c('spent_channels_rate', 'spent_requests_rate', 'spent_words_rate')
    )

    pwalk(api_checker_list, tg_quote_printer)

  }

  if (tbl) {
    x_quote_ok <- x$title[! x$service_key %in% x_quote_warn$service_key]
    walk(x_quote_ok, ~ cli_alert_success( c(style_bold('{.}:'), ' ', style_italic( col_br_green('All limits reached less then {getOption("tg.api_quote_alert_rate") * 100}%')))) )
    print(as_tibble(x))
  }

}
