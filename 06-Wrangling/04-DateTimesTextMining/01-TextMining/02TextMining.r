# Assessment exercise
library(dslabs)
library(tidyverse)
library(lubridate)
library(dplyr)

data("brexit_polls")

brexit_polls %>% filter(month(ymd(startdate)) == 4) %>% count()

brexit_polls %>% filter(round_date(enddate, unit = "week") == "2016-06-12") %>% count()

brexit_polls %>% mutate(weekday = weekdays(ymd(enddate))) %>% count(weekday)


# ==========
# Exercise 2
# ==========

data(movielens)

movielens %>% mutate(newTs = as_datetime(timestamp)) %>% select(newTs) %>%
  count(year(newTs)) %>% arrange(desc(n)) %>% head()

movielens %>% mutate(newTs = as_datetime(timestamp)) %>% select(newTs) %>%
  count(hour(newTs)) %>% arrange(desc(n)) %>% head()

#movielens %>% mutate(newDate = as_datetime(timestamp)) %>%
#  count(newDate) %>% head(n = 10) %>% order(n, decreasing = TRUE)