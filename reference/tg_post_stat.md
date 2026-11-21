# Getting publication statistics

Getting publication statistics

## Usage

``` r
tg_post_stat(post_id, group = c("day", "hour"))
```

## Arguments

- post_id:

  Post ID (t.me/username/123, t.me/c/1256804429/1230 or post ID in
  TGStat)

- group:

  Grouping results (hour, day)

## Value

list with tibbles

## Details

Obtaining publication statistics - the number of views at the moment,
the list of reposts and mentions, the dynamics of the growth of views by
hours / days.

## References

See also [TGStat API Documentation of metrod
posts/stat](https://api.tgstat.ru/docs/ru/posts/stat.html)

## Examples

``` r
if (FALSE) { # \dontrun{
post_stat <- tg_post_stat(
    post_id = 'https://t.me/R4marketing/887',
    group = 'day'
)

views <- post_stat$views
forwards <- post_stat$forwards
mentions <- post_stat$mentions
} # }
```
