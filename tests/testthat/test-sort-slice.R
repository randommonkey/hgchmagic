test_that("Sort by numeric var", {

  # data Cat
  data <- sample_data("Cat", 50)
  opts <- dsvizopts::dsviz_defaults()
  opts$postprocess$sort <- "desc"
  data_order <- data %>%
                  group_by_all() %>%
                    summarise(..count = n()) %>%
                      arrange(-..count) %>% .$..count
  l <- hgchmagic_prep(data, opts, ftype = "Cat")
  expect_equal(l$d$..count, data_order)

  # data Cat-Num
  data <- data.frame(thinks = c("Rocks", "Papers", "Scissors", NA),
                     total = c(23, 45, -10, 1),
                     otros = c("One", "Two", "Three", "BLA"),
                     nature = c("Cat", "Fox", "Spider", "BLU"))
  opts <- dsvizopts::dsviz_defaults()
  opts$postprocess$sort <- "asc"

  l <- hgchmagic_prep(data, opts, ftype = "Cat-Num")
  expect_equal(l$d$b, sort(data$total))

  # data Cat-Cat
  data <- sample_data("Cat-Cat", 100)
  opts <- dsvizopts::dsviz_defaults()
  opts$postprocess$sort <- "desc"
  data_order <- data %>%
    group_by_all() %>%
    summarise(..count = n()) %>%
    arrange(-..count) %>% .$..count
  l <- hgchmagic_prep(data, opts, ftype = "Cat-Cat")
  expect_equal(l$d %>% drop_na(..count) %>% .$..count, data_order)


  # data Dat-Cat
  data <- sample_data("Cat-Dat", 1000, rep = T)
  opts <- dsvizopts::dsviz_defaults()
  opts$postprocess$sort <- "desc"
  data_order <- data %>%
    group_by_all() %>%
    summarise(..count = n()) %>% drop_na_(names(data)[2]) %>%
    arrange(-..count) %>% .$..count
  l <- hgchmagic_prep(data, opts, ftype = "Cat-Dat")
  expect_equal(l$d %>% drop_na(..count) %>% .$..count, data_order)


})



test_that("Slice by numeric var", {

  # data Cat
  data <- sample_data("Cat", 50)
  opts <- dsvizopts::dsviz_defaults()
  opts$postprocess$slice_n <- 3

  l <- hgchmagic_prep(data, opts, ftype = "Cat")
  expect_equal(nrow(l$d), 3)

  # data Cat-Num
  data <- sample_data("Cat-Num-Dat-Cat", 50)
  opts <- dsvizopts::dsviz_defaults()
  opts$postprocess$slice_n <- 3

  l <- hgchmagic_prep(data, opts, ftype = "Cat-Num")
  expect_equal(nrow(l$d), 3)


  # data Dat
  data <- sample_data("Dat-Num-Dat-Cat", 50)
  opts <- dsvizopts::dsviz_defaults()
  opts$postprocess$slice_n <- 3

  l <- hgchmagic_prep(data, opts, ftype = "Dat-Num")
  expect_equal(nrow(l$d), 3)

  # data Cat-Cat-Num
  data <- sample_data("Cat-Cat-Num", 50)
  opts <- dsvizopts::dsviz_defaults()
  opts$postprocess$slice_n <- 5

  l <- hgchmagic_prep(data, opts, ftype = "Cat-Cat-Num")
  expect_equal(nrow(l$d), 5)

})
