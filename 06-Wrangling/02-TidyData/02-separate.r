# import data
path <- system.file("extdata", package = "dslabs")
fname <-  "life-expectancy-and-fertility-two-countries-example.csv"
filename <- file.path(path, fname)

raw_dat <- read_csv(filename)
dat <- raw_dat %>% pivot_longer(-country)
tidyDat <- dat %>% separate(name, c("year", "name"), sep = "_", 
                extra = "merge", convert = TRUE) %>%
  pivot_wider()

tidyDat
