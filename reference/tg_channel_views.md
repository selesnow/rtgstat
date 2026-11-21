# Getting the number of views in dynamics

Getting the number of views in dynamics

## Usage

``` r
tg_channel_views(
  channel_id = tg_get_channel_id(),
  start_date = Sys.Date() - 15,
  end_date = Sys.Date(),
  group = c("day", "hour", "week", "month")
)
```

## Arguments

- channel_id:

  Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ...
  or channel ID in 'TGStat')

- start_date:

  Start date of report period

- end_date:

  End date of report period

- group:

  Time group: hour, day, week, month

## Value

tibble with channel views

## Details

The method allows you to get the total number of views per day on the
channel, in dynamics by days, weeks, months.

## Examples

``` r
if (FALSE) { # \dontrun{
tg_auth('Your token')
tg_set_channel_id('R4marketing')

views <- tg_channel_views(
  start_date = '2021-09-01',
  end_date = '2021-09-30',
  group = "day"
)
} # }
```
