library(tidyverse)

urlfile <- "https://github.com/WJC-Data-Science/DTS350/raw/master/coral.csv"
coraldata <- read_csv(url(urlfile))


head(coraldata)
tail(coraldata)
summary(coraldata)
view(coraldata)

maintheme <- theme(legend.title = element_blank(), legend.justification = c(0, 1),
                   legend.key.width = unit(1, "lines"),
                   plot.margin = unit(c(1, 5, 0.5, 0.5), "lines"),
                   axis.title.x = element_blank(),
                   axis.title.y = element_blank(),
                   plot.caption = element_text(hjust = 0, color = "gray50"),
                   plot.title = element_text(size = 16, margin = margin(t = 1)),
                   plot.subtitle = element_text(size = 10),
                   axis.ticks.x = element_line(color = "black"),
                   axis.ticks.y = element_line(color = "white"),
                   axis.text.x = element_text(margin = margin(t = 0)),
                   axis.text.y = element_text(margin = margin(r = 0)),
                   panel.background = element_rect(fill = "white"),
                   panel.grid.major.y = element_line(color = "gray", linetype = "dashed"),
                   axis.text = element_text(color = "black"))

austdata <- filter(coraldata, Entity=="Australasia")

ggplot(data = austdata, aes(x = Year, y = Value, fill = Event)) +
  geom_col() +
  scale_fill_manual(values = c("#6797C5", "#C14242"), labels = c("Moderate (<30%)",
                                                                 "Severe (>30%)")) +
  scale_x_continuous(breaks = seq(1980, 2016, 3), expand = c(0, 0.1)) +
  scale_y_continuous(breaks = seq(0, 25, 5), expand = c(0,0)) +
  labs(title = "Number of coral bleaching events, Australasia",
       subtitle = "The number of moderate (up to 30% of corals affedcted) and severe bleaching events (more than 30% corals) measured at 100
       fixed global locations. Bleaching occurs when stressful conditions cause corals to expel their algal symbionts",
       caption = "Source: Hughes, T.P., et al. (2018). Spatial and temporal patterns of mass bleaching of corals in the Anthropocene. Science. 
       OurWorldInData.org/biodiversity · CC BY") +
  maintheme

iomedata <- filter(coraldata, Entity=="Indian Ocean/Middle East")

ggplot(data = iomedata, aes(x = Year, y = Value, fill = Event)) +
  geom_col() +
  scale_fill_manual(values = c("#6797C5", "#C14242"), labels = c("Moderate (<30%)",
                                                                 "Severe (>30%)")) +
  scale_x_continuous(breaks = seq(1980, 2016, 3), expand = c(0, 0.1)) +
  scale_y_continuous(breaks = seq(0, 20, 5), expand = c(0,0)) +
  labs(title = "Number of coral bleaching events, Indian Ocean/Middle East",
       subtitle = "The number of moderate (up to 30% of corals affedcted) and severe bleaching events (more than 30% corals) measured at 100
       fixed global locations. Bleaching occurs when stressful conditions cause corals to expel their algal symbionts",
       caption = "Source: Hughes, T.P., et al. (2018). Spatial and temporal patterns of mass bleaching of corals in the Anthropocene. Science. 
       OurWorldInData.org/biodiversity · CC BY") +
  maintheme

pacdata <- filter(coraldata, Entity=="Pacific")

ggplot(data = pacdata, aes(x = Year, y = Value, fill = Event)) +
  geom_col() +
  scale_fill_manual(values = c("#6797C5", "#C14242"), labels = c("Moderate (<30%)",
                                                                 "Severe (>30%)")) +
  scale_x_continuous(breaks = seq(1980, 2016, 3), expand = c(0, 0.1)) +
  scale_y_continuous(breaks = seq(0, 12, 2), expand = c(0,0)) +
  labs(title = "Number of coral bleaching events, Pacific",
       subtitle = "The number of moderate (up to 30% of corals affedcted) and severe bleaching events (more than 30% corals) measured at 100
       fixed global locations. Bleaching occurs when stressful conditions cause corals to expel their algal symbionts",
       caption = "Source: Hughes, T.P., et al. (2018). Spatial and temporal patterns of mass bleaching of corals in the Anthropocene. Science. 
       OurWorldInData.org/biodiversity · CC BY") +
  maintheme

westdata <- filter(coraldata, Entity=="West Atlantic")

ggplot(data = westdata, aes(x = Year, y = Value, fill = Event)) +
  geom_col() +
  scale_fill_manual(values = c("#6797C5", "#C14242"), labels = c("Moderate (<30%)",
                                                                 "Severe (>30%)")) +
  scale_x_continuous(breaks = seq(1980, 2016, 3), expand = c(0, 0.1)) +
  scale_y_continuous(breaks = seq(0, 20, 5), expand = c(0,0)) +
  labs(title = "Number of coral bleaching events, West Atlantic",
       subtitle = "The number of moderate (up to 30% of corals affedcted) and severe bleaching events (more than 30% corals) measured at 100
       fixed global locations. Bleaching occurs when stressful conditions cause corals to expel their algal symbionts",
       caption = "Source: Hughes, T.P., et al. (2018). Spatial and temporal patterns of mass bleaching of corals in the Anthropocene. Science. 
       OurWorldInData.org/biodiversity · CC BY") +
  maintheme

worlddata <- filter(coraldata, Entity=="World")

ggplot(data = worlddata, aes(x = Year, y = Value, fill = Event)) +
  geom_col() +
  scale_fill_manual(values = c("#6797C5", "#C14242"), labels = c("Moderate (<30%)",
                                                                 "Severe (>30%)")) +
  scale_x_continuous(breaks = seq(1980, 2016, 3), expand = c(0, 0.1)) +
  scale_y_continuous(breaks = seq(0, 70, 10), expand = c(0,0)) +
  labs(title = "Number of coral bleaching events, World",
       subtitle = "The number of moderate (up to 30% of corals affedcted) and severe bleaching events (more than 30% corals) measured at 100
       fixed global locations. Bleaching occurs when stressful conditions cause corals to expel their algal symbionts",
       caption = "Source: Hughes, T.P., et al. (2018). Spatial and temporal patterns of mass bleaching of corals in the Anthropocene. Science. 
       OurWorldInData.org/biodiversity · CC BY") +
  maintheme

# From these graphs, there is no evidence to suggest that coral bleaching is becoming more frequent. Since we have plotted the data from 
# 1980 through the year 2016, we can see that after a spike of coral bleaching, there is a decrease of coral bleaching within the 
# following three years. However, in all five graphs the year 1998 was the largest spike for each region. Because of this, 
# we have reason to believe that the year 1998 is an outlier that can skew the results of the data. When that year is taken out
# the year 2016 becomes prevalent and changes my answer on coral bleaching. When focusing on the normal data, excluding any
# seen outliers, it is clear that coral bleaching is becoming more frequent in each region. 

newdata <- filter(worlddata, Year != "1998")

ggplot(data = newdata, aes(x = Year, y = Value, fill = Event)) +
  geom_col() +
  scale_fill_manual(values = c("#6797C5", "#C14242"), labels = c("Moderate (<30%)",
                                                                 "Severe (>30%)")) +
  scale_x_continuous(breaks = seq(1980, 2016, 3), expand = c(0, 0.1)) +
  scale_y_continuous(breaks = seq(0, 70, 10), expand = c(0,0)) +
  labs(title = "Number of coral bleaching events, World without 1998",
       subtitle = "The number of moderate (up to 30% of corals affedcted) and severe bleaching events (more than 30% corals) measured at 100
       fixed global locations. Bleaching occurs when stressful conditions cause corals to expel their algal symbionts",
       caption = "Source: Hughes, T.P., et al. (2018). Spatial and temporal patterns of mass bleaching of corals in the Anthropocene. Science. 
       OurWorldInData.org/biodiversity · CC BY") +
  maintheme

# I decided to test out my theory that the year 1998 is an outlier with a new visualization. I filtered out the year 1998
# in order to prohibit it from skewing my answer. I only did it on the World data since that has the most prevalence.
# I am able to conclude that there is an increase in coral bleaching it is becoming more severe as the years go on.
