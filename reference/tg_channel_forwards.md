# Getting a list of reposts from a channel

Allows you to get a list of reposts of publications from a channel to
other channels.

## Usage

``` r
tg_channel_forwards(
  channel_id = tg_get_channel_id(),
  start_date = Sys.Date() - 15,
  end_date = Sys.Date()
)
```

## Arguments

- channel_id:

  Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ...
  or channel ID in 'TGStat')

- start_date:

  Date forwards from

- end_date:

  Date forwards to

## Value

tibble with forwards

## References

See also [TGStat API Documentation of metrod
channels/forwards](https://api.tgstat.ru/docs/ru/channels/forwards.html)

## Examples

``` r
if (FALSE) { # \dontrun{
forwards <- tg_channel_forwards(
    channel_id = 'R4marketing',
    start_date = '2021-01-01',
    end_date   = '2021-09-30'
)
} # }
```
