## Assessment part 2
library(tidyverse)
library(gutenbergr)
library(tidytext)
options(digits = 3)

pattern = "Pride and Prejudice"

gutenberg_metadata %>%
  filter(str_detect(title, pattern = pattern)) %>% count()

gutenberg_works() %>%
  filter(str_detect(title, pattern = pattern)) %>% select(gutenberg_id) 
  


# Sentiment analysis

book <- tibble(gutenberg_download(1342, mirror = "http://mirrors.xmission.com/gutenberg/"))
book %>% unnest_tokens(word, text) %>% select(word) %>%
  filter(!word %in% stop_words$word) %>%
  filter(!str_detect(word, "\\d")) %>%
  count()
