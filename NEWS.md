# rtgstat (development version)

* Fixed bug in `tg_set_channel_id()`: `object 'tg_channel_id' not found`.
* `retry` removed from `rtgstat` dependencies.
* The mechanism for retrying a request in case of an error has been rewritten to the standard means `httr2`, using `req_retry()`.
* Add user agent to request in `tg_make_request()` by `req_user_agent()`.
* Now API endpoint add to URL by `req_url_path_append()` `inside tg_make_request()`.
* Disabled checking the api quota usage in the `tg_categories()`, `tg_countries()`, `tg_languages()`.

# rtgstat 0.1.1

* Fixed errors in DESCRIPTION for CRAN.

# rtgstat 0.1.0

* Added a `NEWS.md` file to track changes to the package.
