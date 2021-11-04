library(tidyverse)
library(riem)

bob1 <- tempfile()
download("https://github.com/WJC-Data-Science/DTS350/raw/master/carwash.csv", bob1, mode = "wb")
CarWash <- read_csv(bob1)

head(CarWash)
tail(CarWash)
str(CarWash)
view(CarWash)

view(OlsonNames())

CarWash1 <- with_tz(CarWash, tzone = "US/Mountain")
view(CarWash1)

?ceiling_date

CarWash2 <- CarWash1 %>%
  mutate(hour = ceiling_date(time, "hour"))

view(CarWash2)

str(CarWash2)

?aggregate

CarWashHour <- CarWash2 %>%
  group_by(hour) %>%
  summarise(across(amount, sum))

view(CarWashHour)

temp <- riem_measures(station = "RXE",  date_start = "2016-05-13",  date_end  = "2016-07-18") %>%
  with_tz(tzone = "US/Mountain") %>%
  filter(tmpf != " ") %>%
  mutate(hour =  ceiling_date(valid, "hour")) %>%
  select(hour, tmpf)

view(temp)

view(Temp1)

chet <- merge(CarWashHour, temp, by = "hour") %>%
  arrange(hour)

view(chet)

chet %>%
  ggplot(aes(x = hour)) +
  geom_freqpoly(binwidth = 36000) +
  theme_bw() 

chet %>%
  ggplot(aes(x = hour, y = tmpf)) +
  geom_point(size = 0.01) +
  geom_line() +
  labs(x = "Days",
       y = "Temperature in Farenheit",
       title = "How Sales are affected by Weather") +
  theme_bw() 
