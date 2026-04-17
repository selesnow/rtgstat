test_that("tg_channel returns correct data structure", {
  
  # Используем with_mock_dir. При первом запуске он сделает реальный запрос
  # и сохранит его в tests/testthat/tg_channel/
  with_mock_dir("tg_channel", {
    
    # Отключаем check_quote, чтобы тест не дергал еще один эндпоинт (tg_api_usage) 
    # неявно внутри основного запроса. Мы протестируем его отдельно.
    options(tg.check_api_quote = FALSE)
    
    res <- tg_channel(channel_id = "R4marketing")
    
    # Проверяем, что возвращается tibble
    expect_s3_class(res, "tbl_df")
    
    # Проверяем наличие базовых колонок, которые всегда есть у канала
    expect_true("id" %in% names(res))
    expect_true("title" %in% names(res))
    expect_true("link" %in% names(res))
    
    # Проверяем, что вернулась как минимум одна строка
    expect_true(nrow(res) >= 1)
  })
})
