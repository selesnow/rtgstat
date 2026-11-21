# Retrieving publication data

Retrieving publication data

## Usage

``` r
tg_post(post_id)
```

## Arguments

- post_id:

  Post ID (t.me/username/123, t.me/c/1256804429/1230 or post ID in
  TGStat)

## Value

tibble with post data

## Details

Get information and publications in Telegram - number of views,
publication date, content, ...

## References

See also [TGStat API Documentation of metrod
posts/get](https://api.tgstat.ru/docs/ru/posts/get.html)

## Examples

``` r
if (FALSE) { # \dontrun{
post <- tg_post(
    post_id = 'https://t.me/R4marketing/887'
)
} # }
```
