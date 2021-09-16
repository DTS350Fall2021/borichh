library(tidyverse)
install.packages("ggrepel")
library(ggrepel)

iris
head(iris)
tail(iris)
view(iris)

ggplot(data = iris, mapping = aes(x = Sepal.Width, y = Sepal.Length, color = Species, shape = Species)) +
  geom_point()

ggplot(data = iris, mapping = aes(x = Sepal.Width,
                                  y = Sepal.Length,
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "We can predict Setodas's sepal length from its width",
       subtitle = "Versicolor and Virginica are not predictable",
       caption = "Source: iris",
       shape = "Species of Iris",
       color = "Species of Iris")

# When you change the shape and the color of the legend, it makes it one legend instead of two

best_flower <- iris %>%
  group_by(Species) %>%
  filter(row_number(desc(Sepal.Width)) == 1)
head(best_flower)

ggplot(data = iris, mapping = aes(x = Sepal.Width,
                                  y = Sepal.Length)) +
  geom_point(aes(color = Species, shape = Species)) +
  geom_point(size = 3, shape = 1, color = "black", data = best_flower) +
  ggrepel::geom_label_repel(aes(color = Species, label = Species), data = best_flower) +
  geom_text(aes(color = Species, label = Species), data = best_flower) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "We can predict Setodas's sepal length from its width",
       subtitle = "Versicolor and Virginica are not predictable",
       caption = "Source: iris") +
  theme(legend.position = "none")

label_data <- tibble(
  Speal.Width = 2.55,
  Sepal.Length = 4.5,
  label = "My Favorite Flower"
)

arrow_data <- data.frame(x1 = 2.5, y1 = 4.5, x2 = 2.35, y2 = 4.5)

ggplot(data = iris, mapping = aes(x = Sepal.Width, y = Sepal.Length)) +
  geom_point(aes(color = Species)) +
  geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), color = "purple", data = arrow_data, arrow = arrow(length = unit(0.1, "in"))) +
  geom_point(size = 3, shape = 1, color = "black", data = best_flower) +
  geom_text(aes(label = label), data = label_data, vjust = "center", hjust = "left") +
  ggrepel::geom_label_repel(aes(label = Species, color = Species), data = best_flower) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "We can predict Setosa's sepal length from its width",
       subtitle = "Versicolor and Virginica are not predictable",
       caption = "Source: iris") +
  theme(legend.position = "none")

ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() + scale_y_log10() +
  scale_color_manual(values = c("purple", "darkorange", "blue"))

ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species),
       size = 5) +
  geom_point() +
  scale_color_brewer(palette = "Set1") 

ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species),
       size = 5) +
  geom_point() +
  coord_cartesian(xlim = c(2,4), ylim = c(5,7), expand = FALSE) +
  scale_color_brewer(palette = "Set1") 

ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values = c(setosa = "purple", versicolor = "darkorange", virginica = "blue")) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "This is where I would put a title") +
  theme(plot.title = element_text(hjust = .5))

ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length, color = Species, shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values = c("purple", "orange", "blue")) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "This is where I would put a title",
       shape = "Species of Iris",
       color = "Species of Iris") +
  theme_bw()


averages <- iris %>% group_by(Species) %>%
  mutate(avglength = mean(Sepal.Length))
averages  

p + geom_hline(data = averages, mapping = aes(yintercept = avglength), color = "red")  
