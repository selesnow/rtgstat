# Channel search

The method allows you to search for channels by keyword or get a list of
channels in a category.

## Usage

``` r
tg_channels_search(
  query = NULL,
  search_by_description = FALSE,
  country = "ru",
  language = "russian",
  category = NULL,
  limit = 100
)
```

## Arguments

- query:

  Search keyword

- search_by_description:

  Search in channel description?

- country:

  Channel geography (country). Use
  [`tg_countries`](https://alexey-seleznev.pro/rtgstat/reference/tg_countries.md)
  for get countries dictionary.

- language:

  Channel content language. Use
  [`tg_languages`](https://alexey-seleznev.pro/rtgstat/reference/tg_languages.md)
  for get languages dictionary.

- category:

  Channel category. Use
  [`tg_categories`](https://alexey-seleznev.pro/rtgstat/reference/tg_categories.md)
  for get categories dictionary.

- limit:

  Maximum number of channels in a response, no more than 100.

## Value

tibble with channels

## References

See also [TGStat API Documentation of metrod
channels/search](https://api.tgstat.ru/docs/ru/channels/search.html)

## Examples

``` r
if (FALSE) { # \dontrun{
channels <- tg_channels_search(
   query    = "data",
   country  = "ru",
   category = "tech"
)
} # }
```
