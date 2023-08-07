library(tidyverse)
library(pdftools)
library(stringr)
options(digits = 3)    # report 3 significant digits

fn <- system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf", package="dslabs")
#system2("open", args = fn)

# Question 1
txt <- pdf_text(fn)
class(txt)
length(txt)

# Question 2
x <- txt[9] %>% str_split('\n')
x

# Question 3
class(x)
length(x)


# Question 4
s <- x[[1]]
class(s)
s

# Question 5
s <- str_trim(s)
print(s[1])


# Question 6
header_index <- s %>% str_which('2015')
header_index[1]

# Question 7
tmp <- str_split(s[header_index], pattern="\\s+", simplify=TRUE)
month <- tmp[1]
header <- tmp[1,2:5]
month

header[3]

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
s <- str_split_fixed(s, "\\s+", n = 6)[,1:5]
s

s <- str_remove_all(s, "[^\\d\\s]")
s

# Question 12
tab <- s %>% as_tibble() %>%
  set_names(c("day", header)) %>%
  mutate_all(as.numeric)
mean(tab$"2015")

mean(tab$"2016")

mean(tab$"2017"[1:19])

mean(tab$"2017"[20:30])

# Question 13
tab <- tab %>% gather(year, deaths, -day) %>%
  mutate(deaths = as.numeric(deaths))
tab

# Question 14
tab %>% filter(year != "2018") %>%
  ggplot(aes(day, deaths, color = year)) +
  geom_line() + 
  geom_vline(xintercept = 20) +
  geom_point()