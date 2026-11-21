# rtgstat - R пакет для работы с TGStat API

## Содержание

- [Функции
  пакета](#%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8-%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%B0)
- [Устновка](#%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0)
- [Авторизация](#%D0%B0%D0%B2%D1%82%D0%BE%D1%80%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F)
- [Пример
  использования](#%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80-%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
- [Опции
  пакета](#%D0%BE%D0%BF%D1%86%D0%B8%D0%B8-%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%B0)
- [Переменные
  среды](#%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5-%D1%81%D1%80%D0%B5%D0%B4%D1%8B)

## Функции пакета

Пакет `rtgstat` включает в себя функции для работы со всеми методами
[TGStat Search
API](https://api.tgstat.ru/docs/ru/start/intro.html#api-%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0-api-search)
и [TGStat Stat
API](https://api.tgstat.ru/docs/ru/start/intro.html#api-%D1%81%D1%82%D0%B0%D1%82%D0%B8%D1%81%D1%82%D0%B8%D0%BA%D0%B8-api-stat).

На данный момент в `rtgstat` доступны следующие функции, и
соответствующие им методы API:

- [`tg_auth()`](https://alexey-seleznev.pro/rtgstat/reference/tg_auth.md) -
  [Авторизация](https://api.tgstat.ru/docs/ru/start/token.html)
- [`tg_channel()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel.md) -
  [Получение информации о
  канале](https://api.tgstat.ru/docs/ru/channels/get.html)
- [`tg_channels_search()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channels_search.md) -
  [Поиск каналов \*](https://api.tgstat.ru/docs/ru/channels/search.html)
- [`tg_channel_stat()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_stat.md) -
  [Получение статистики
  канала](https://api.tgstat.ru/docs/ru/channels/stat.html)
- [`tg_channel_posts()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_posts.md) -
  [Получение списка публикаций
  канала](https://api.tgstat.ru/docs/ru/channels/posts.html)
- [`tg_channel_mentions()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_mentions.md) -
  [Получение списка
  упоминаний](https://api.tgstat.ru/docs/ru/channels/mentions.html)
- [`tg_channel_forwards()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_forwards.md) -
  [Получение списка репостов из
  канала](https://api.tgstat.ru/docs/ru/channels/forwards.html)
- [`tg_channel_subscribers()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_subscribers.md) -
  [Получение кол-ва подписчиков в динамике
  \*](https://api.tgstat.ru/docs/ru/channels/subscribers.html)
- [`tg_channel_views()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_views.md) -
  [Получение кол-ва просмотров в динамике
  \*](https://api.tgstat.ru/docs/ru/channels/views.html)
- [`tg_channel_avg_posts_reach()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_avg_posts_reach.md) -
  [Получение среднего охвата публикаций канала в динамике
  \*](https://api.tgstat.ru/docs/ru/channels/avg-posts-reach.html)
- [`tg_channel_err()`](https://alexey-seleznev.pro/rtgstat/reference/tg_channel_err.md) -
  [Получение показателя ERR для канала в динамике
  \*](https://api.tgstat.ru/docs/ru/channels/err.html)
- [`tg_post()`](https://alexey-seleznev.pro/rtgstat/reference/tg_post.md) -
  [Получение данных о
  публикации](https://api.tgstat.ru/docs/ru/posts/get.html)
- [`tg_post_stat()`](https://alexey-seleznev.pro/rtgstat/reference/tg_post_stat.md) -
  [Получение статистики
  публикации](https://api.tgstat.ru/docs/ru/posts/stat.html)
- [`tg_posts_search()`](https://alexey-seleznev.pro/rtgstat/reference/tg_posts_search.md) -
  [Поиск публикаций \*](https://api.tgstat.ru/docs/ru/posts/search.html)
- [`tg_mentions_by_period()`](https://alexey-seleznev.pro/rtgstat/reference/tg_mentions_by_period.md) -
  [Динамика упоминания ключевого слова по периодам
  \*](https://api.tgstat.ru/docs/ru/words/mentions-by-period.html)
- [`tg_mentions_by_channels()`](https://alexey-seleznev.pro/rtgstat/reference/tg_mentions_by_channels.md) -
  [Упоминания ключевого слова в разрезе каналов
  \*](https://api.tgstat.ru/docs/ru/words/mentions-by-channels.html)
- [`tg_categories()`](https://alexey-seleznev.pro/rtgstat/reference/tg_categories.md) -
  [Список категорий
  \*\*](https://api.tgstat.ru/docs/ru/database/categories.html)
- [`tg_languages()`](https://alexey-seleznev.pro/rtgstat/reference/tg_languages.md) -
  [Список языков
  \*\*](https://api.tgstat.ru/docs/ru/database/languages.html)
- [`tg_countries()`](https://alexey-seleznev.pro/rtgstat/reference/tg_countries.md) -
  [Список стран
  \*\*](https://api.tgstat.ru/docs/ru/database/countries.html)
- [`tg_api_usage()`](https://alexey-seleznev.pro/rtgstat/reference/tg_api_usage.md) -
  [Статистика запросов к API
  \*\*](https://api.tgstat.ru/docs/ru/usage/stat.html)

Звёздочкой \* отмечены методы, доступные только на платных тарифах API.

Двумя звёздами \*\* отмечаны методы, доступные на всех тарифах и не
участвующие в тарификации.

## Установка

На данный момент пакет `rtgstat` можно устновить из CRAN:

``` r

install.packages("rtgstat")
```

Или [GitHub](https://github.com/):

``` r

# install.packages("devtools")
devtools::install_github("selesnow/rtgstat")
```

## Авторизация

Для прохождения авторизации вам необходимо активировать в своём профиле
TGStat один из доступных [тарифов](https://api.tgstat.ru/) TGStat API.

![Токен доступа к API](http://img.netpeak.ua/alsey/99FBST.png)

Токен доступа к API

Более подробно о токенах и работе с ними читай в [официальной
справке](https://api.tgstat.ru/docs/ru/start/token.html).

## Пример использования

Пример запроса данных из TGStat API:

``` r

library(rtgstat)

tg_auth('Ваш токен')

# Замените на ID вашего канала
tg_set_channel_id('R4marketing')

# Статистика канала
stat <- tg_channel_stat()
subscribers <- tg_channel_subscribers()
views <- tg_channel_views()

# Статистика публикации
posts <- tg_channel_posts()
post_stat <- tg_post_stat(post_id = posts$link[1])
post_views    <- post_stat$views
post_forwards <- post_stat$forwards
post_mentions <- post_stat$mentions

# Упоминания
mentions_dinamics <- tg_mentions_by_period(query = 'Алексей Селезнёв')
mentions_channels <- tg_mentions_by_channels(query = 'Алексей Селезнёв')
mentions   <- mentions_channels$items
m_channels <- mentions_channels$channels
```

## Опции пакета

В пакете доступны следующие опции:

- `tg.api_token` - Позволяет задать API токен в рамках текущей сессии;
- `tg.channel_id` - Идентификатор канала в рамках сессии;
- `tg.check_api_quote` - Позволяет отключать проверку квоты API, по
  умолчанию `TRUE`, для отключения устновите `FALSE`;
- `tg.api_quote_alert_rate` - Задаёт порог предупреждений об
  израсходованной квоте API, по умолчанию значение 0.9, т.е.
  предупреждение будет отображаться если вы израсходовали какую то квоту
  API более чем на 90%;
- `tg.max_tries` - Позволяет задать количество повторных отправок
  запроса, в случае сбоя API;
- `tg.interval` - Позволяет задать паузу между повторными отправками
  запросов, по умолчанию пакет сам управляет паузами;
- `tg.base_url` - Базовый URL обращения к API, крайне не рекомендуется
  изменять данную опцию.

Для установки каждой опции в `rtgstat` есть вспомогательная функция с
именем заданным следующим щаблоном `tg_set_имя_опции(значение_опции)`.
Т.е. установить любую опцию можно двумя способами:

``` r

tg_set_check_api_quote(FALSE)
# тоже самое что и
options(tg.check_api_quote = FALSE)
```

Посмотреть текущие значения опций `rtgstat` можно с помощью функции
[`tg_options()`](https://alexey-seleznev.pro/rtgstat/reference/tg_options.md):

``` r
tg_options()

rtgstat options:
tg.api_token: <hidden>
tg.base_url: https://api.tgstat.ru/
tg.max_tries: 1
tg.check_api_quote: TRUE
tg.api_quote_alert_rate: 0.9
```

## Переменные среды

Для удобства работы вы можете использовать переменные среды для
установки значений по умолчанию:

- `TG_API_TOKEN` - Ваш токен доступа к TGStat API;
- `TG_CHANNEL_ID` - Идентификатор основного канала для работы с TGStat
  API.

Прописать переменные среды можно в файле `.Renviron`, или использовать
интерйес операционной системы.

## Автор

Alexey Seleznev, Head of analytics dept. at
[Netpeak](https://netpeak.us/)  
Telegram Channel: [R4marketing](https://t.me/R4marketing)  
YouTube Channel:
[R4marketing](https://www.youtube.com/R4marketing/?sub_confirmation=1)  
email: <selesnow@gmail.com>  
facebook: [facebook.com/selesnow](https://www.facebook.com/selesnow)  
blog:
[alexeyseleznev.wordpress.com](https://alexeyseleznev.wordpress.com/)
