# Get channel stat

The method allows you to obtain basic statistics - the number of
participants, the average coverage of the publication, the percentage of
engagement of subscribers (ERR), the total daily coverage, the citation
index (CI)

## Usage

``` r
tg_channel_stat(channel_id = tg_get_channel_id())
```

## Arguments

- channel_id:

  Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ...
  or channel ID in 'TGStat')

## Value

tibble with channel stat

## References

See also [TGStat API Documentation of metrod
channels/stat](https://api.tgstat.ru/docs/ru/channels/stat.html)

## Examples

``` r
if (FALSE) { # \dontrun{
channel_stat <- tg_channel_stat(channel_id = "R4marketing")
} # }
```
