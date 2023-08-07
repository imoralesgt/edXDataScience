library(tidyverse)
library(pdftools)
library(stringr)
options(digits = 3)    # report 3 significant digits

# Question 8
tail_index <- s %>% str_which("Total")
tail_index

# Question 9
n <- s %>% str_count(pattern = '\\d+')
sum(n == 1)

# Question 10
removeIndices <- c(1:header_index, which(n==1), tail_index:length(s))
cleanData <- s[-removeIndices]
cleanData

# Question 11
s2 <- str_split_fixed(s, "\\s+", n = 6)[,1:5]
s2

s2 <- str_remove_all(s2, "[^\\d\\s]")
s2

# Question 12
s2 <- str_split_fixed(s2, "\\s+", n = 6)[,1:5]

tab <- s2 %>% as_tibble() %>%
  set_names(c("day", header)) %>%
  mutate_all(as.numeric)

tab