# Retrieving a list of publications

The method allows you to get channel publications according to the
specified parameters. Returns channel messages sorted in reverse
chronological order (most recent from the top).

## Usage

``` r
tg_channel_posts(
  channel_id = tg_get_channel_id(),
  start_time = Sys.Date() - 15,
  end_time = Sys.Date(),
  hide_forwards = 0,
  hide_deleted = 0
)
```

## Arguments

- channel_id:

  Channel ID (@username, t.me/username, t.me/joinchat/AAAAABbbbbcccc ...
  or channel ID in 'TGStat')

- start_time:

  Date of publication from

- end_time:

  Date of publication to

- hide_forwards:

  Hide reposts from search results

- hide_deleted:

  Hide deleted posts

## Value

tibble with channel posts

## References

See also [TGStat API Documentation of metrod
channels/posts](https://api.tgstat.ru/docs/ru/channels/posts.html)

## Examples

``` r
if (FALSE) { # \dontrun{
posts <- tg_channel_posts(
   channel_id = "R4marketing",
   start_time = "2021-11-01 00:00:00",
   end_time = "2021-11-30 23:59:59"
)
} # }
```
