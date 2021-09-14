library(tidyverse)
install.packages("gapminder")
library(gapminder)
library(dplyr)
library(ggplot2)

view(gapminder)

WealthLife <-  filter(gapminder, country != "Kuwait")
view(WealthLife)

ggplot(data = WealthLife) +
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap, color = continent, size = pop)) +
  facet_wrap(~ year, nrow = 1) +
  scale_y_continuous(trans = "sqrt") +
  xlab("Life Expectancy") + ylab("GDP Per Capita") +
  theme_bw()

WeightedAvg <- WealthLife %>%
  group_by(year, continent) %>%
  summarise(average = weighted.mean(gdpPercap), population = pop/10000)
WeightedAvg

ggplot(data = WealthLife, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(data = WealthLife, mapping = aes(color = continent)) +
  geom_line(data = WealthLife, mapping = aes(color = continent, group = country)) +
  geom_point(data = WeightedAvg, aes(x = year, y = average, size = population)) +
  geom_line(data = WeightedAvg, aes(x = year, y = average)) +
  facet_wrap(~ continent, nrow = 1) +
  xlab("Year") + ylab("GDP Per Capita") +
  scale_size_continuous(name = "Population (100k)", breaks = c(10000, 20000, 30000)) +
  theme_bw()
