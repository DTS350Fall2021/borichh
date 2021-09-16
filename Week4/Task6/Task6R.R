library(tidyverse)
library(ggrepel)
library(lubridate)

iris
head(iris)
tail(iris)
view(iris)
str(iris)

WidthData <- iris %>%
  group_by(Species) %>%
  filter(row_number(desc(Petal.Width)) == 1)
WidthData


LengthData <- iris %>%
  group_by(Species) %>%
  filter(row_number(desc(Petal.Length)) == 1)
LengthData

irisplot1 <- ggplot(data = iris, mapping = aes(x = Sepal.Length,
                                               y = Sepal.Width)) +
  geom_point(mapping = aes(color = Species, shape = Species))+
  geom_point(size = 3, shape = 1, color = "black", data = WidthData) +
  geom_text(aes(color = Species, label = "Largest Petal Width"), data = WidthData, nudge_y = .01) +
  geom_point(size = 3, shape = 1, color = "black", data = LengthData) +
  geom_text(aes(color = Species, label = "Largest Petal Length"), data = LengthData, nudge_y = -.01) +
  scale_x_log10() + scale_y_log10() +
  labs(x = "Sepal Length (cm)",
       y = "sepal Width (cm)",
       title = "Different Iris Species Have Different Sepal Sizes",
       subtitle = "The Largest Petal Sizes For Each Species Do Not Correspond To The Largest Sizes") +
  theme(legend.position = "bottom")


irisplot1



