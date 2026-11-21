# Set session default channel id

Set session default channel id

## Usage

``` r
tg_set_channel_id(channel_id)
```

## Arguments

- channel_id:

  Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ...
  or channel ID in 'TGStat')

## Value

Using for side effect, no return data

## Examples

``` r
if (FALSE) { # \dontrun{
tg_set_channel_id('R4marketing')
stat <- tg_channel_stat()
} # }
```
