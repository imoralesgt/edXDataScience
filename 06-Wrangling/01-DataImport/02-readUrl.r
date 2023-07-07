library(readr)
url <-'https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data'
# read_lines(url, n_max = 4)
dat <- read_csv(url, col_names = FALSE)
head(dat)