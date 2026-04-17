library(httptest2)

# Настройка очистки (redaction) для сокрытия токена в моках
set_redactor(function(resp) {
  # Пытаемся получить токен из опций или переменных окружения
  token <- getOption("tg.api_token")
  if (is.null(token)) token <- Sys.getenv("TG_API_TOKEN")
  
  if (nzchar(token)) {
    # Заменяем реальный токен в URL и теле ответа на безопасную строку
    resp <- gsub_response(resp, token, "FAKE_TOKEN")
  }
  return(resp)
})

# Если мы запускаем тесты на чистом окружении (CI/CD Github Actions),
# где нет реального токена, устанавливаем фейковый,
# чтобы тесты могли пройти на базе сохраненных моков.
if (identical(Sys.getenv("TG_API_TOKEN"), "")) {
  Sys.setenv(TG_API_TOKEN = "FAKE_TOKEN")
  options(tg.api_token = "FAKE_TOKEN")
}

# Устанавливаем дефолтный канал для тестов, если он не задан
if (is.null(getOption("tg.channel_id"))) {
  options(tg.channel_id = "R4marketing")
}
