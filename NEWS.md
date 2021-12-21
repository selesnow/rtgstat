# rtgstat (development version)

## New function
* `tg_channel_avg_posts_reach()` - Getting the average coverage of channel publications over time.
* `tg_channel_err()` - Obtaining an ERR indicator for a channel in dynamics.

## New options
* `tg.check_api_quote` - allows you to disable api quota check.

## Bug fixes
* Fixed bug in `tg_set_channel_id()`: `object 'tg_channel_id' not found`.
* Fixed API quote parser in `tg_api_usage()`.

## Other
* `rtgstat` added to [TGStat API documentation](https://api.tgstat.ru/docs/ru/client-libs.html#%D1%8F%D0%B7%D1%8B%D0%BA-r).
* The mechanism for retrying a request in case of an error has been rewritten to the standard means `httr2`, using `req_retry()`.
* Add user agent to request in `tg_make_request()` by `req_user_agent()`.
* Now API endpoint add to URL by `req_url_path_append()` `inside tg_make_request()`.
* Disabled checking the api quota usage in the `tg_categories()`, `tg_countries()`, `tg_languages()`.
* `retry` removed from `rtgstat` dependencies.

# rtgstat 0.1.1

* Fixed errors in DESCRIPTION for CRAN.

# rtgstat 0.1.0

* Added a `NEWS.md` file to track changes to the package.
