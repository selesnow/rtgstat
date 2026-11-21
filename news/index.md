# Changelog

## rtgstat 0.3.6

CRAN release: 2026-04-17

- Replaced R 4.1.0 function shorthand syntax `\(x)` with classic
  `function(x)` in
  [`tg_api_usage()`](https://alexey-seleznev.pro/rtgstat/reference/tg_api_usage.md)
  to maintain compatibility with R versions \< 4.1.0 without adding a
  hard `Depends: R (>= 4.1.0)` requirement. This fixes the CRAN NOTE
  during the 0.3.5 submission.

## rtgstat 0.3.5

- Changed `Language: ru` to `Language: en-US` in DESCRIPTION to fix Nu
  HTML checker warnings reported by CRAN (the documentation is written
  in English).
- Added comprehensive unit testing using `httptest2` to mock API
  responses and preserve rate limits.
- Fixed an issue with
  [`httr2::req_retry()`](https://httr2.r-lib.org/reference/req_retry.html)
  compatibility in recent `httr2` versions (parameter `after` now
  expects a function).
- Updated `dplyr` syntax in
  [`tg_api_usage()`](https://alexey-seleznev.pro/rtgstat/reference/tg_api_usage.md)
  to comply with recent `dplyr` changes (replaced `across(...)` external
  vector warnings and deprecated `...` argument).

## rtgstat 0.3.4

CRAN release: 2024-10-25

- Change link to netpeak site in README.

## rtgstat 0.3.3

- Update default value for `tg.max_tries` options from 1 to 2.

It fixed error:

    Error in `req_retry()`:
    ! `max_tries` must be a whole number larger than or equal to 2 or `NULL`, not the number 1.

## rtgstat 0.3.2

CRAN release: 2022-08-12

- Rebuild documentation, for cran policy (html5)

## rtgstat 0.3.1

CRAN release: 2022-05-02

- Update error handing policy in `tg_make_request()`, now using
  `req_error()` for response error handing.
- The description lists the minimum required versions of most imported
  packages.

## rtgstat 0.3.0

CRAN release: 2022-02-01

### New functions

- [`tg_channels_search()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channels_search.md)-
  Search telegram channel.

### Bug fixes

- Fix
  [`tg_get_token()`](https://alexey-seleznev.pro/rtgstat/reference/tg_get_token.md),
  previously the function only looked for the token in the options,
  ignoring the environment variable
  [issue#1](https://github.com/selesnow/rtgstat/issues/1)

### Other

- [`tg_get_token()`](https://alexey-seleznev.pro/rtgstat/reference/tg_get_token.md)
  return error when API token doesn’t set.

## rtgstat 0.2.1

CRAN release: 2021-12-22

- Only CRAN fixes.

## rtgstat 0.2.0

### New functions

- [`tg_channel_avg_posts_reach()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_avg_posts_reach.md) -
  Getting the average coverage of channel publications over time.
- [`tg_channel_err()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_err.md) -
  Obtaining an ERR indicator for a channel in dynamics.
- [`tg_set_check_api_quote()`](https://alexey-seleznev.pro/rtgstat/reference/tg_set_check_api_quote.md) -
  Enable and disable API limit rate alerts.

### New options

- `tg.check_api_quote` - allows you to disable api quota check.

### Bug fixes

- Fixed bug in
  [`tg_set_channel_id()`](https://alexey-seleznev.pro/rtgstat/reference/tg_set_channel_id.md):
  `object 'tg_channel_id' not found`.
- Fixed API quote parser in
  [`tg_api_usage()`](https://alexey-seleznev.pro/rtgstat/reference/tg_api_usage.md).

### Other

- `rtgstat` added to [TGStat API
  documentation](https://api.tgstat.ru/docs/ru/client-libs.html#%D1%8F%D0%B7%D1%8B%D0%BA-r).
- The mechanism for retrying a request in case of an error has been
  rewritten to the standard means `httr2`, using `req_retry()`.
- Add user agent to request in `tg_make_request()` by
  `req_user_agent()`.
- Now API endpoint add to URL by `req_url_path_append()`
  `inside tg_make_request()`.
- Disabled checking the api quota usage in the
  [`tg_categories()`](https://alexey-seleznev.pro/rtgstat/reference/tg_categories.md),
  [`tg_countries()`](https://alexey-seleznev.pro/rtgstat/reference/tg_countries.md),
  [`tg_languages()`](https://alexey-seleznev.pro/rtgstat/reference/tg_languages.md).
- `retry` removed from `rtgstat` dependencies.

## rtgstat 0.1.1

CRAN release: 2021-11-29

- Fixed errors in DESCRIPTION for CRAN.

## rtgstat 0.1.0

- Added a `NEWS.md` file to track changes to the package.
