library(testthat)
setwd("/Users/baibai/stat133/stat133-hws-fall17/hw4")
source('code/functions.R')
test_file('code/tests.R')


sink('../output/test-reporter.txt')
test_file('tests.R')
sink()
