# Get chennel info

Get general information about the channel - link to the channel, name,
description, avatar, number of subscribers at the moment.

## Usage

``` r
tg_channel(channel_id = tg_get_channel_id())
```

## Arguments

- channel_id:

  hannel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ...
  or channel ID in 'TGStat')

## Value

tibble with channel metadata

## References

See also [TGStat API Documentation of metrod
channels/get](https://api.tgstat.ru/docs/ru/channels/subscribers.html)

## Examples

``` r
if (FALSE) { # \dontrun{
channel <- tg_channel(channel_id = "R4marketing")
} # }
```
