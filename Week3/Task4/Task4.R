library(dplyr)
library(tidyverse)

iris_data <- iris

head(iris_data)
tail(iris_data)
str(iris_data)

SepalArr <- arrange(iris_data, Sepal.Length)
head(SepalArr, n = 10)

testdat <- select(iris_data, Species, Petal.Width)
head(testdat)

species_mean <- iris_data %>%
  group_by(Species) %>%
  summarise(
    SepalWidthMean = mean(Sepal.Width), SpealLengthMean = mean(Sepal.Length),
    PetalWidthMean = mean(Petal.Width), PetalLengthMean = mean(Petal.Length))
species_mean

iris_min <- filter(iris_data, Sepal.Width <= 3, Petal.Width != 2.5)
head(iris_min)

iris_size <- iris_data %>%
  mutate(Sepal.Size =
           case_when(
             Sepal.Length < 5 ~ "small",
             Sepal.Length >= 5 & Sepal.Length < 6.5 ~ "medium",
             Sepal.Length >= 6.5 ~ "large"))

iris_size

iris_rank <- arrange(iris_data, desc(Petal.Length))
iris_rank                     
