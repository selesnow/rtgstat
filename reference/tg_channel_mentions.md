# Getting a list of mentions

The method allows you to get a list of mentions of a channel in other
channels.

## Usage

``` r
tg_channel_mentions(
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

  Date mentioned from

- end_date:

  Date mentioned to

## Value

tibble with mention data

## Details

A publication is considered a mention if it contains a link to a channel
like username, t.me/username, t.me/username/1234. In case of mentioning
a channel, the `mention_type` parameter will contain the value
'channel'. If a specific publication of the channel is mentioned, then
the parameter will contain the value 'post'.

## References

See also [TGStat API Documentation of metrod
channels/mentions](https://api.tgstat.ru/docs/ru/channels/mentions.html)

## Examples

``` r
if (FALSE) { # \dontrun{
mentions <- tg_channel_mentions(
    channel_id = 'R4marketing',
    start_date = '2021-10-01',
    end_date = '2021-10-31'
 )
} # }
```
