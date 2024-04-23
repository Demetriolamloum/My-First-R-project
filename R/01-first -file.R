

library(readr)
library(lubridate)
library(forcats)
library(tidyverse)

ebola <- read_csv("C:/Users/Demetrio/OneDrive - Università Commerciale Luigi Bocconi/Desktop/Chiavetta/PHD doc/Corsi PhD Berna/Corsi 2024/Course in R/ebola.csv")
# load library
library(ggplot2)

ebolaplot <- ggplot(data = ebola, mapping = aes(x = Date, y = Cum_conf_death)) + geom_point()
ebolaplot

# filter data frame ebola: 
# only keep confirmed cases in Liberia, Sierra Leone, and United Kingdom
# before the "2015-03-31"
# filter data_ebola: cumulative number of confirmed cases in Guinea, 
# Liberia and Sierra Leone before 31 March 2015 
data_ebola_cum_cases <- ebola %>% 
  select(date = Date, country = Country, cum_conf_cases = Cum_conf_cases) %>% 
  filter(date <= ymd("2015-03-31") & 
           (country == "Guinea" | country ==  "Liberia" | country == "Sierra Leone"))
print(data_ebola_cum_cases) 
plot_ebola_cum_cases_V1<- ggplot(data = data_ebola_cum_cases, mapping = aes(x = date, y = cum_conf_cases)) + geom_point()
plot_ebola_cum_cases_V1

data_ebola_cum_cases_V1 <- ebola %>%  select(date = Date, cum_conf_cases = Cum_conf_cases) 
plot_ebola_cum_cases_V1 <- ggplot(data = data_ebola_cum_cases, mapping = aes(x = date, y = cum_conf_cases)) + geom_point()
plot_ebola_cum_cases_V1
plot_ebola_cum_cases_V2 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_line()

plot_ebola_cum_cases_V2
plot_ebola_cum_cases_V3<- ggplot(data = data_ebola_cum_cases, 
                                  mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_col()
plot_ebola_cum_cases_V3
plot_ebola_cum_cases_V1 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_point(alpha = 0.7, colour = "Yellow", fill = "Brown", 
             shape = 21, size = 1.5, stroke = 5.5)
plot_ebola_cum_cases_V1
