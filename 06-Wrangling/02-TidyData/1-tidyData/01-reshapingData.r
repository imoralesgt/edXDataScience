library(tidyverse)
library(dslabs)
library(ggplot2)
data(gapminder)

tidyData <- gapminder %>% 
  filter(country %in% c("South Korea", "Germany")) %>%
  select(country, year, fertility)
head(tidyData)

tidyData %>%
  ggplot(aes(year, fertility, color = country)) +
  geom_point()

# Loading the same data, but in wide format (columns are observations)
# Reshaping is required to "transpose" the data
wide_data <- read_csv('../data/fertility-two-countries-example.csv')
select(wide_data, country, `1960`:`1967`)

# Using pivot_longer() from tidr package to convert wide to tidy data
wide_data %>% pivot_longer(`1960`:`2015`)

# Equivalent to:
wide_data %>% pivot_longer(-country) #All the columns, except Country

new_tidy_data <- wide_data %>%
  pivot_longer(-country, names_to = "year", values_to = "fertility",
               names_transform = list(year=as.numeric))

new_tidy_data %>% ggplot(aes(year, fertility, color = country)) +
  geom_point()



