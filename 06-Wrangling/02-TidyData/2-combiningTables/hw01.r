library(dplyr)
library(tidyverse)
library(dslabs)

data(murders)
data("polls_us_election_2016")

tab <- left_join(murders, results_us_election_2016, by = "state")
head(tab)

tab1 <- tab[1:2,]
tab2 <- tab[3:4,]

tab2
