library(dplyr)
library(dslabs)
library(Lahman)

top <- Batting %>%
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%
  slice(1:10)

top %>% as_tibble()

People %>% as_tibble()


top_names <- top %>% left_join(People) %>%
  select(playerID, nameFirst, nameLast, HR)

top_names


# ====================================================


top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names) %>%
  select(nameFirst, nameLast, teamID, HR, salary)

top_salary

# ===================================================

AwardsPlayers %>% filter(yearID == 2016) %>%
  inner_join(top_names) %>% select(playerID) %>%
  unique() %>% count()

AwardsPlayers %>% filter(yearID == 2016) %>%
  anti_join(top_names) %>% select(playerID) %>% 
  unique() %>% count()

