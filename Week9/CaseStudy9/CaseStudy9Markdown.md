---
title: "CaseStudy9Markdown"
author: "Haleigh Borich"
date: "11/3/2021"
output: 
  html_document:
    theme: united
    keep_md: True
    code_folding: 'hide'
---

```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
## ✓ tibble  3.0.5     ✓ dplyr   1.0.3
## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
## ✓ readr   1.4.0     ✓ forcats 0.5.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(lubridate)
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following objects are masked from 'package:base':
## 
##     date, intersect, setdiff, union
```

```r
library(downloader)
```


```r
bob1 <- tempfile()
download("https://github.com/WJC-Data-Science/DTS350/raw/master/sales.csv", bob1, mode = "wb")
SaleData <- read_csv(bob1)
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   Name = col_character(),
##   Type = col_character(),
##   Time = col_datetime(format = ""),
##   Amount = col_double()
## )
```


```r
SalesData <- with_tz(SaleData, tzone = "US/Mountain")
```


```r
HourlyData <- SalesData %>%
  mutate(hourly = ceiling_date(Time, "hour")) %>%
  mutate(daily = ceiling_date(Time, "day")) %>%
  mutate(Hour = hour(hourly)) %>%
  group_by(Name, Hour) %>%
  summarise(across(Amount, sum))
```

```
## `summarise()` has grouped output by 'Name'. You can override using the `.groups` argument.
```


```r
ggplot(HourlyData, aes(x = Hour, y = Amount, color = Name)) +
  geom_point() +
  geom_line() +
  facet_wrap(~ Name, nrow = 2) +
  labs(x = "Hours throughout the Day",
       y = "Amount of Sales a Day",
       title = "Creating Recomended Hours of Operations") +
  theme_bw()
```

![](CaseStudy9Markdown_files/figure-html/unnamed-chunk-5-1.png)<!-- -->


```r
DailyData <- SalesData %>%
  mutate(daily = ceiling_date(Time, "day")) %>%
  mutate(Daily = wday(daily)) %>%
  group_by(Name, Daily) %>%
  summarise(across(Amount, sum))
```

```
## `summarise()` has grouped output by 'Name'. You can override using the `.groups` argument.
```


```r
ggplot(DailyData, aes(x = Daily, y = Amount, color = Name)) +
   geom_point() +
   geom_line() +
   facet_wrap(~ Name, nrow = 2) +
  labs(x = "Days of the Week",
       y = "Amount of Sales total",
       tital = "Daily Gross Revenue ") +
   theme_bw()
```

![](CaseStudy9Markdown_files/figure-html/unnamed-chunk-7-1.png)<!-- -->


```r
WeeklyData <- SalesData %>%
   mutate(weekly = ceiling_date(Time, "week")) %>%
   mutate(Weekly = week(weekly)) %>%
   group_by(Name, Weekly) %>%
   summarise(across(Amount, sum))
```

```
## `summarise()` has grouped output by 'Name'. You can override using the `.groups` argument.
```


```r
ggplot(WeeklyData, aes(x = Weekly, y = Amount, color = Name)) +
   geom_point() +
   geom_line() +
   facet_wrap(~ Name, nrow = 2) +
  labs(x = "The Weeks in the 3 Month Period",
       y = "Amount of Total Sales",
       title = "Weekly Gross Profit") +
   theme_bw()
```

![](CaseStudy9Markdown_files/figure-html/unnamed-chunk-9-1.png)<!-- -->


```r
MonthlyData <- SalesData %>%
   mutate(monthly = ceiling_date(Time, "month")) %>%
   mutate(Monthly = month(monthly)) %>%
   group_by(Name, Monthly) %>%
   summarise(across(Amount, sum))
```

```
## `summarise()` has grouped output by 'Name'. You can override using the `.groups` argument.
```


```r
ggplot(MonthlyData, aes(x = Monthly, y = Amount, color = Name)) +
   geom_point() +
   geom_line() +
   facet_wrap(~ Name, nrow = 2) +
  labs(x = "May through August Sales",
       y = "Total Amount of Sales",
       tite = "Gross Revenue for 3 Months ") +
   theme_bw()
```

![](CaseStudy9Markdown_files/figure-html/unnamed-chunk-11-1.png)<!-- -->


```r
TotalData <- SalesData %>%
  group_by(Name) %>%
  summarise(across(Amount, sum))
```


```r
ggplot(TotalData, aes(x = Name, y = Amount, fill = Name)) +
  geom_col() +
  labs(x = "Company Names",
       y = "Total Amount of Sales",
       title = "Comparison between the 6 Companies") +
  theme_bw()
```

![](CaseStudy9Markdown_files/figure-html/unnamed-chunk-13-1.png)<!-- -->

