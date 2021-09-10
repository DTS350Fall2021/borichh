library(tidyverse)
install.packages("gapminder")
library(gapminder)

view(gapminder)

WealthLife <-  filter(gapminder, country != "Kuwait")
view(WealthLife)

ggplot(data = WealthLife) +
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap, color = continent, size = pop)) +
  facet_wrap(~ year, nrow = 1) +
  scale_y_continuous(trans = "sqrt") +
  theme_bw()

weightedavg <- weighted.mean(WealthLife, gdpPercap)

ggplot(data = WealthLife) +
  geom_point(mapping = aes(x = year, y = gdpPercap, color = continent)) +
  facet_wrap(~ continent, nrow = 1)
