# Get channel subscribers nunmber by day

The method allows you to get the number of channel subscribers in
dynamics by hours, days, weeks, months.

## Usage

``` r
tg_channel_subscribers(
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

tibble with subscribers stat

## Details

For grouping group = day, the number of subscribers as of the end of the
day will be returned.

For groupings group = week and group = month, the number of subscribers
at the end of the last day of the period (week or month) will be
returned.

Depending on the requested grouping type group - the period field will
take one of the following formats:

- hour: Y-m-d H:00

- day: Y-m-d

- week: Y-W

- month: Y-m

## References

See also [TGStat API Documentation of metrod
channels/subscribers](https://api.tgstat.ru/docs/ru/channels/subscribers.html)

## Examples

``` r
if (FALSE) { # \dontrun{
channel_subscribers <- tg_channel_subscribers(
    channel_id = "R4marketing",
    start_date = "2021-06-01",
    end_date = "2021-10-31",
    group = "month"
 )
} # }
```
