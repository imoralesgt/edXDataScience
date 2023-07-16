library(rvest)
library(dslabs)
library(dplyr)
library(tidyverse)

url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
h <- read_html(url)

nodes <- html_nodes(h, "table")
length(nodes)

# ====================================

validNodeIdx <- html_table(nodes, fill = TRUE) %>% sapply(ncol) == 9 
validNodes <- html_table(nodes[validNodeIdx])
validNodeIdx
