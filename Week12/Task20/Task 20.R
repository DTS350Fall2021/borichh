library(tidyverse)
library(sf)
library(USAboundaries)
library(ggrepel)
library(lwgeom)
library(maps)

install.packages("USAboundariesData", repos = "https://ropensci.r-universe.dev", type = "source")

map <- sf::st_as_sf(map("state", plot = FALSE, fill = TRUE))

idaho <- us_counties(states = "ID")

cities <- us_cities()

states <- us_cities()

view(states)

top_three <- states %>%
  filter(state_name != "Alaska", 
         state_name != "Hawaii") %>%
  group_by(state_name) %>%
  arrange(desc(population)) %>%
  slice(1:3)

view(top_three)

top_one <- states %>%
  filter(state_name != "Alaska", 
         state_name != "Hawaii") %>%
  group_by(state_name) %>%
  arrange(desc(population)) %>%
  slice(1:1)

num_two <- top_three %>%
  slice(2:2)

num_three <- top_three %>%
  slice(3:3)

view(top_one)

ggplot() +
  geom_sf(data = map, fill = NA) +
  geom_sf(data = idaho, fill = NA) +
  geom_sf(data = top_three, color = "blue", aes(size = population/1000)) +
  geom_sf(data = num_two, color = "lightblue", aes(size = population/1000)) +
  geom_sf(data = num_three, color = "darkblue", aes(size = population/1000)) +
  geom_sf_label(aes(label = city), color = "darkblue", data = top_one, nudge_x = -2, nudge_y = -.4) +
  theme_bw()

ggsave("task20plot.png")


