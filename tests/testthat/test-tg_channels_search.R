test_that("tg_channels_search works correctly with parameters", {
  
  with_mock_dir("tg_channels_search", {
    
    options(tg.check_api_quote = FALSE)
    
    # Делаем тестовый поиск
    res <- tg_channels_search(
      query = "data",
      country = "ru",
      category = "tech",
      limit = 5
    )
    
    # Проверяем структуру ответа
    expect_s3_class(res, "tbl_df")
    
    # Проверяем обязательные поля в выдаче
    expect_true("id" %in% names(res))
    expect_true("link" %in% names(res))
    
    # Если поиск прошел успешно и мы не ограничены нулем результатов
    if (nrow(res) > 0) {
      expect_true(nrow(res) <= 5) # Проверяем, что лимит сработал
    }
  })
})

test_that("tg_channels_search aborts on missing both query and category", {
  # Ожидаем ошибку (cli_abort), если не передать ни query, ни category
  expect_error(
    tg_channels_search(), 
    "At least one of the query or category parameters must be passed"
  )
})
