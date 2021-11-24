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
    rename_with(to_snake_case) %>%
    separate('spent_channels', into = c('spent_channels_fact', 'spent_channels_limit'), sep = '/') %>%
    separate('spent_requests', into = c('spent_requests_fact', 'spent_requests_limit'), sep = '/') %>%
    separate('spent_words', into = c('spent_words_fact', 'spent_words_limit'), sep = '/') %>%
    mutate(expired_at = as.POSIXct(.data$expired_at, origin = '1970-01-01'),
           across(c('spent_channels_fact',
                    'spent_channels_limit',
                    'spent_requests_fact',
                    'spent_requests_limit',
                    'spent_words_fact',
                    'spent_words_limit'),
                  as.numeric),
           across(c('spent_channels_fact',
                    'spent_channels_limit',
                    'spent_requests_fact',
                    'spent_requests_limit',
                    'spent_words_fact',
                    'spent_words_limit'),
                  replace_na, 0),
           spent_channels_rate = .data$spent_channels_fact / .data$spent_channels_limit,
           spent_requests_rate = .data$spent_requests_fact / .data$spent_requests_limit,
           spent_words_rate    = .data$spent_words_fact / .data$spent_words_limit,
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

  quote_90 <- filter(x,
                     .data$spent_channels_rate >= 0.9 |
                     .data$spent_requests_rate >= 0.9 |
                     .data$spent_words_rate >= 0.9)

  if ( nrow(quote_90) > 0 ) {

    for ( sk in quote_90$service_key ) {

      api_name <- quote_90[quote_90$service_key==sk, "title"]
      cli_alert_warning(style_bold('{api_name}:'))
      quotes <- c()

      if ( quote_90[quote_90$service_key==sk, 'spent_requests_rate'] > 0.9 ) {
        quotes <- c(quotes, style_italic(col_br_red('API requests count quota limit has reached over 90%')))
      }

      if ( quote_90[quote_90$service_key==sk, 'spent_channels_rate'] > 0.9 ) {
        quotes <- c(quotes, style_italic(col_br_red('API channels count quota limit has reached over 90%')))
      }

      if ( quote_90[quote_90$service_key==sk, 'spent_words_rate'] > 0.9 ) {
        quotes <- c(quotes, style_italic(col_br_red('API words count quota limit has reached over 90%')))
      }

      cli_ul(quotes)

    }

  }

  if (tbl) print(as_tibble(x))

}
