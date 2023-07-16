library(rvest)
library(tidyverse)
library(dslabs)

url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)

nodes <- html_nodes(h, "table")
payrolls <- html_table(nodes[[8]])
payrolls

# =============================

sapply(nodes[1:4], html_table)
sapply(nodes[18:20], html_table)

# =============================


tab_1 <- html_table(nodes[10]) %>% as.data.frame() %>%
  select(-X1)
tab_2 <- html_table(nodes[19]) %>% as.data.frame()

tab_1 <- tab_1[2:nrow(tab_1),]
tab_2 <- tab_2[2:nrow(tab_2),]

col_names <- c("Team", "Payroll", "Average")

tab_1 <- tab_1 %>% setNames(col_names)
tab_2 <- tab_2 %>% setNames(col_names)


tab_joint <- full_join(tab_1, tab_2, by = "Team")
nrow(tab_joint)

