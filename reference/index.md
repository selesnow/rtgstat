# Package index

## Main page

rtgstat documentation main page

- [`rtgstat`](https://alexey-seleznev.pro/rtgstat/reference/rtgstat-package.md)
  [`rtgstat-package`](https://alexey-seleznev.pro/rtgstat/reference/rtgstat-package.md)
  : rtgstat: Client for 'TGStat API'

## Setters

options setters functions

- [`tg_set_channel_id()`](https://alexey-seleznev.pro/rtgstat/reference/tg_set_channel_id.md)
  : Set session default channel id
- [`tg_get_channel_id()`](https://alexey-seleznev.pro/rtgstat/reference/tg_get_channel_id.md)
  : Get defaukt channel ID
- [`tg_set_interval()`](https://alexey-seleznev.pro/rtgstat/reference/tg_set_interval.md)
  : Set time interval in seconds between tries of HTTP queries
- [`tg_set_max_tries()`](https://alexey-seleznev.pro/rtgstat/reference/tg_set_max_tries.md)
  : Set max tries of HTTP queries
- [`tg_set_api_quote_alert_rate()`](https://alexey-seleznev.pro/rtgstat/reference/tg_set_api_quote_alert_rate.md)
  : Set API limit alert rate
- [`tg_set_check_api_quote()`](https://alexey-seleznev.pro/rtgstat/reference/tg_set_check_api_quote.md)
  : Disable or enable API limit alert
- [`tg_options()`](https://alexey-seleznev.pro/rtgstat/reference/tg_options.md)
  : Get rtgstat option values

## Authorization

Managing authorization process

- [`tg_auth()`](https://alexey-seleznev.pro/rtgstat/reference/tg_auth.md)
  : Set API Token of 'TgStat'
- [`tg_get_token()`](https://alexey-seleznev.pro/rtgstat/reference/tg_get_token.md)
  : Get API Token of 'TgStat'

## TGStat API Stat

Get statistics

- [`tg_channel()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel.md)
  : Get chennel info
- [`tg_channel_stat()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_stat.md)
  : Get channel stat
- [`tg_channel_posts()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_posts.md)
  : Retrieving a list of publications
- [`tg_channel_mentions()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_mentions.md)
  : Getting a list of mentions
- [`tg_channel_forwards()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_forwards.md)
  : Getting a list of reposts from a channel
- [`tg_channel_subscribers()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_subscribers.md)
  : Get channel subscribers nunmber by day
- [`tg_channel_avg_posts_reach()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_avg_posts_reach.md)
  : Getting the average coverage of channel publications over time
- [`tg_channel_err()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_err.md)
  : Obtaining an ERR indicator for a channel in dynamics
- [`tg_channel_views()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_views.md)
  : Getting the number of views in dynamics
- [`tg_post()`](https://alexey-seleznev.pro/rtgstat/reference/tg_post.md)
  : Retrieving publication data
- [`tg_post_stat()`](https://alexey-seleznev.pro/rtgstat/reference/tg_post_stat.md)
  : Getting publication statistics

## TGStat API Search

Search data

- [`tg_posts_search()`](https://alexey-seleznev.pro/rtgstat/reference/tg_posts_search.md)
  : Search publications
- [`tg_channels_search()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channels_search.md)
  : Channel search
- [`tg_mentions_by_period()`](https://alexey-seleznev.pro/rtgstat/reference/tg_mentions_by_period.md)
  : Dynamics of the keyword mentions by period
- [`tg_mentions_by_channels()`](https://alexey-seleznev.pro/rtgstat/reference/tg_mentions_by_channels.md)
  : Keyword mentions by channel
- [`tg_channel()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel.md)
  : Get chennel info
- [`tg_post()`](https://alexey-seleznev.pro/rtgstat/reference/tg_post.md)
  : Retrieving publication data

## Dictionary

Dictionary data

- [`tg_categories()`](https://alexey-seleznev.pro/rtgstat/reference/tg_categories.md)
  : Category list
- [`tg_languages()`](https://alexey-seleznev.pro/rtgstat/reference/tg_languages.md)
  : List of languages
- [`tg_countries()`](https://alexey-seleznev.pro/rtgstat/reference/tg_countries.md)
  : List of countries

## API limits

Check API limits

- [`tg_api_usage()`](https://alexey-seleznev.pro/rtgstat/reference/tg_api_usage.md)
  : API request statistics
