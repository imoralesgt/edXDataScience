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


book %>% unnest_tokens(word, text) %>% select(word) %>%
  filter(!word %in% stop_words$word) %>%
  filter(!str_detect(word, "\\d")) %>% count(word) %>%
  filter(n > 100) %>% count() 



book %>% unnest_tokens(word, text) %>% select(word) %>%
  filter(!word %in% stop_words$word) %>%
  filter(!str_detect(word, "\\d")) %>% count(word) %>%
  filter(n > 100) %>% arrange(desc(n)) 

# ========================================

words <- book %>% unnest_tokens(word, text) %>% 
          filter(!word %in% stop_words$word) %>%
          filter(!str_detect(word, "\\d"))

afinn <- get_sentiments("afinn")

afinn_sentiments <- words %>% inner_join(afinn, by = 'word') %>%
  select(word, value)

afinn_sentiments_positive <- afinn_sentiments %>% filter(value > 0) %>% count()
afinn_positive_proportion <- afinn_sentiments_positive / nrow(afinn_sentiments)
afinn_sentiments_value4 <- afinn_sentiments %>% filter(value == 4) %>% count()

