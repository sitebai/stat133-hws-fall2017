library(testthat)
source('functions.R')



context("remove missing")
test_that("remove missing",{
  a <- c(1,4,7,NA,10)
  expect_equal(remove_missing(a),c(1,4,7,10))
  expect_identical(remove_missing(a),c(1,4,7,10))
  expect_true(length(remove_missing(a) )== 4)
  expect_false(length(remove_missing(a))==length(a))
})



context("get minimum")
test_that("get minimum",{
  expect_equal(get_minimum(a,na.rm = TRUE),1)
  expect_identical(get_minimum(a),1)
  expect_true(length(get_minimum(a))==1)
  expect_false(get_minimum(a)==2)
})


context("get maximum")
test_that("get maximum",{
  expect_equal(get_maximum(a),10)
  expect_true(get_maximum(a) != get_minimum(a))
  expect_false(get_maximum(a) <= get_minimum(a))
  expect_error(get_maximum(e))
})



context("get median")
test_that("median shows up",{
  e <- c("hello","world")
  expect_equal(get_median(a),5.5)
  expect_true(get_median(a) != get_minimum(a))
  expect_error(get_median(e))
  expect_is(get_median(a),"numeric")
  })


context("get mean")
test_that("mean shows up",{
  expect_equal(get_average(a),5.5)
  expect_is(get_average(a),"numeric")
  expect_true(get_average(a)!=get_maximum(a))
  expect_error(get_average(e))
})


context("get standard deviation")
test_that("sd shows up",{
  expect_true(is.numeric(get_stdev(a)))
  expect_false(get_stdev(a)==get_average(a))
  expect_error(get_stdev(e))
  expect_success(expr = expect_is(get_stdev(a),"numeric"))
})

context("get range")
test_that("range shows up",{
   expect_equal(get_range(a),9)
   expect_is(get_range(a),"numeric")
   expect_error(get_range(e))
   expect_true(get_range(a) <= get_maximum(a))
})

context("get quartile1")
test_that("quartile1",{
  expect_is(get_quartile1(a),"numeric")
  expect_equal(get_quartile1(a),3.25)
  expect_true(get_quartile1(a) != get_average(a))
  expect_error(get_quartile1(e))
})


context("get quartile3")
test_that("quartile3",{
  expect_is(get_quartile3(a),"numeric")
  expect_equal(get_quartile3(a),7.75)
  expect_true(get_quartile3(a) != get_average(a))
  expect_error(get_quartile3(e))
})


context("count missing")
test_that("count missing",{
  expect_is(count_missing(a),"integer")
  expect_equal(count_missing(a),1)
  expect_true(length(count_missing(a)) != length(remove_missing(a)))
  expect_error(count_missing(e))
})


context("drop lowest")
test_that("drop lowest",{
  expect_equal(drop_lowest(a),c(4,7,10))
  expect_is(drop_lowest(a),"numeric")
  expect_true(length(drop_lowest(a)) != length(a))
  expect_error(drop_lowest(e))
  })


context("score hw")
test_that("score hw",{
  expect_equal(score_homework(a,drop = TRUE),7)
  expect_is(score_homework(a,drop = TRUE),"numeric")
  expect_equal(score_homework(a,drop = FALSE),5.5)
  expect_true(score_homework(a,drop = TRUE) != score_homework(a,
                                                              drop = FALSE))
  })

context("score quiz")
test_that("score quiz",{
  expect_equal(score_quiz(a,drop = TRUE),7)
  expect_is(score_quiz(a,drop = TRUE),"numeric")
  expect_equal(score_quiz(a,drop = FALSE),5.5)
  expect_true(score_quiz(a,drop = TRUE) != score_quiz(a,
                                                       drop = FALSE))
  })

context("score lab")
test_that("score lab",{
  expect_equal(score_lab(2),0)
  expect_is(score_lab(9),"numeric")
  expect_identical(score_lab(7),20)
  expect_true(score_lab(2) != score_lab(11))
  })



context("summary test")
test_that("summary shows up",{
  expect_is(summary_stats(a),"list")
  expect_true(length(summary_stats(a))==11)
  expect_error(summary_stats(e))
  
})


context("rescale 100")
test_that("rescale 100",{
  m <- c(10,14,20,30,40)
  expect_equal(rescale100(a,xmin = 0,xmax = 20),c(5,20,
                                                  35,NA,50))
  expect_is(rescale100(m,xmin=0,xmax=50),"numeric")
  expect_true(length(rescale100(m,xmin = 0,xmax = 50))==5)
  expect_error(rescale100(e,xmin = 0,xmax = 50))
})




context("print summary")
test_that("print summary",{
  expect_error(print_stats(e))
expect_is(print_stats(summary_stats(a)),"NULL")
expect_false(length(print_stats(summary_stats(a)))==12)
expect_true(length(print_stats(summary_stats(a)))==0)
  })



