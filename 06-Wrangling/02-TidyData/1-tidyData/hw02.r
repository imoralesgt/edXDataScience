library(tidyverse)
library(dslabs)

dat <- co2

co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

co2_tidy <- pivot_longer(co2_wide, cols = -year, names_to = 'month', values_to = 'co2')
co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) +
  geom_line()


# Next exercise
data(admissions)
dat <- admissions %>% select(-applicants)
datTidy <- dat %>% pivot_wider(names_from = gender, values_from = admitted)
datTidy



tmp <- admissions %>%
  pivot_longer(cols = c(admitted, applicants), names_to = "key", values_to = "value")

tmp2 <- unite(tmp, column_name, c(key, gender))
# separate(tmp2, names_from = column_name)
tmp2

