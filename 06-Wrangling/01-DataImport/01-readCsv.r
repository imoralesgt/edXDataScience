library(readr)
readLines('../data/murders.csv')
dat <- read_csv('../data/murders.csv')
head(dat)

# Download from remote server
url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"
datUrl <- read_csv(url)
head(datUrl);