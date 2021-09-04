library(tidyverse)

# Load in tidyverse which includes the package "ggplot2"

?iris

# For this Task, we will be using the Iris data from Edgar Anderson

# Start by finding the dimensions and the structure of the data frame

dim(iris) # From this we can see that this data frame has 150 rows and 5 columns
str(iris) 

# It is also helpful to have a quick view of the data frame, to do this we use head & tail

head(iris)
tail(iris)

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species))
# From this graphic, which species of iris' has the largest overall flower 
# It is hard to tell due to the inconsistency of the flower's length and width but I believe the species
# Virginica has the largest overall flower width and length

ggplot(data = iris) +
  geom_point(mapping = aes(x = Petal.Width, y = Petal.Length, color = Species, shape = Species)) +
  facet_wrap( ~ Species ) +
  theme(legend.position = "none")
# Is there a correlation between Petal Width and Petal Length?
# It looks as though there is a correlation. The shorter the Width, the shorter the Length is. 


ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point(mapping = aes(color = Species, shape = Species)) +
  geom_smooth()
# What is the purpose of adding a smooth line into the graph?
# The line helps the viewer understand the pattern in the data.

ggplot(data = iris, mapping = aes(x = Sepal.Length, fill = Species)) +
  geom_bar(color = "black", stat = "bin", bins = 19) +
  geom_vline(xintercept = mean(iris[["Sepal.Length"]]), linetype = "twodash")
# What is the purpose of having a count in each bin?
# Because of the count, we are able to understand where the data lies better.
# We can see that Setosa is by far the shortest out of the Iris Species
