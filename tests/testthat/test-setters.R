test_that("setters update options correctly", {
  
  # Тестируем установку канала
  tg_set_channel_id("test_channel_123")
  expect_equal(tg_get_channel_id(), "test_channel_123")
  expect_equal(getOption("tg.channel_id"), "test_channel_123")
  
  # Тестируем установку интервала
  tg_set_interval(10)
  expect_equal(getOption("tg.interval"), 10)
  
  # Тестируем установку количества попыток
  tg_set_max_tries(5)
  expect_equal(getOption("tg.max_tries"), 5)
  
  # Тестируем установку лимитов алерта
  tg_set_api_quote_alert_rate(0.8)
  expect_equal(getOption("tg.api_quote_alert_rate"), 0.8)
  
  # Тестируем включение/отключение чекера
  tg_set_check_api_quote(FALSE)
  expect_false(getOption("tg.check_api_quote"))
  
  # Сохраняем старый токен, чтобы вернуть его
  old_token_opt <- getOption("tg.api_token")
  old_token_env <- Sys.getenv("TG_API_TOKEN")

  # Тестируем tg_auth
  tg_auth("NEW_FAKE_TOKEN")
  expect_equal(getOption("tg.api_token"), "NEW_FAKE_TOKEN")
  expect_equal(Sys.getenv("TG_API_TOKEN"), "NEW_FAKE_TOKEN")
  
  # Возвращаем старый токен
  options(tg.api_token = old_token_opt)
  if (nzchar(old_token_env)) {
    Sys.setenv(TG_API_TOKEN = old_token_env)
  } else {
    Sys.unsetenv("TG_API_TOKEN")
  }

  
  # Возвращаем дефолтные значения (важно для других тестов)
  tg_set_channel_id("R4marketing")
  tg_set_check_api_quote(TRUE)
})
