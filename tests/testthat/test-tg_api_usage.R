test_that("tg_api_usage parses response and structure correctly", {
  
  with_mock_dir("tg_api_usage", {
    
    # Запрашиваем квоты
    res <- tg_api_usage()
    
    # Проверяем, что вернулся кастомный класс
    expect_s3_class(res, "tg_api_quote")
    expect_s3_class(res, "tbl_df")
    
    # Проверяем, что колонки были правильно конвертированы из snake_case
    expect_true("service_key" %in% names(res))
    
    # Проверяем работу логики сплющивания (flatting) и расчета rate
    expect_true("spent_channels_rate" %in% names(res))
    expect_true("spent_requests_rate" %in% names(res))
    expect_true("spent_words_rate" %in% names(res))
    
    # Убеждаемся, что даты переведены в формат POSIXct
    expect_s3_class(res$expired_at, "POSIXct")
  })
})
