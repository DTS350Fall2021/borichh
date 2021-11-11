---
title: "Task 19"
author: "Haleigh Borich"
date: "11/10/2021"
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
library(readxl)
library(downloader)
```


```r
bob <- tempfile()
download("https://www.bls.gov/cps/womens-earnings-tables-2020.xlsx", bob, mode = "wb")
Data1 <- read_xlsx(bob, skip = 3)
```

```
## New names:
## * `` -> ...1
## * `Number\r\nof\r\nworkers\r\n(in\r\nthousands)` -> `Number\r\nof\r\nworkers\r\n(in\r\nthousands)...2`
## * `Median\r\nweekly\r\nearnings` -> `Median\r\nweekly\r\nearnings...3`
## * `Standard\r\nerror\r\nof\r\nmedian` -> `Standard\r\nerror\r\nof\r\nmedian...4`
## * `Number\r\nof\r\nworkers\r\n(in\r\nthousands)` -> `Number\r\nof\r\nworkers\r\n(in\r\nthousands)...5`
## * ...
```

```r
head(Data1)
```

```
## # A tibble: 6 x 11
##   ...1  `Number\r\nof\r… `Median\r\nweek… `Standard\r\ner… `Number\r\nof\r…
##   <chr>            <dbl>            <dbl>            <dbl>            <dbl>
## 1 <NA>                NA               NA               NA               NA
## 2 Age                 NA               NA               NA               NA
## 3 Tota…           110387              984                2            49476
## 4 16 t…             9364              606                3             4172
## 5 16 t…             1336              497                5              536
## 6 20 t…             8027              624                4             3636
## # … with 6 more variables: `Median\r\nweekly\r\nearnings...6` <dbl>,
## #   `Standard\r\nerror\r\nof\r\nmedian...7` <dbl>,
## #   `Number\r\nof\r\nworkers\r\n(in\r\nthousands)...8` <dbl>,
## #   `Median\r\nweekly\r\nearnings...9` <dbl>,
## #   `Standard\r\nerror\r\nof\r\nmedian...10` <dbl>, ...11 <dbl>
```

```r
str(Data1)
```

```
## tibble [46 × 11] (S3: tbl_df/tbl/data.frame)
##  $ ...1                                            : chr [1:46] NA "Age" "Total, 16 years and older" "16 to 24 years" ...
##  $ Number
## of
## workers
## (in
## thousands)...2: num [1:46] NA NA 110387 9364 1336 ...
##  $ Median
## weekly
## earnings...3                : num [1:46] NA NA 984 606 497 ...
##  $ Standard
## error
## of
## median...4           : num [1:46] NA NA 2 3 5 4 3 4 6 6 ...
##  $ Number
## of
## workers
## (in
## thousands)...5: num [1:46] NA NA 49476 4172 536 ...
##  $ Median
## weekly
## earnings...6                : num [1:46] NA NA 891 589 464 606 929 852 978 977 ...
##  $ Standard
## error
## of
## median...7           : num [1:46] NA NA 3 4 11 4 3 6 7 7 ...
##  $ Number
## of
## workers
## (in
## thousands)...8: num [1:46] NA NA 60911 5191 800 ...
##  $ Median
## weekly
## earnings...9                : num [1:46] NA NA 1082 622 513 ...
##  $ Standard
## error
## of
## median...10          : num [1:46] NA NA 5 4 6 5 3 6 9 9 ...
##  $ ...11                                           : num [1:46] NA NA 82.3 94.7 90.4 93.5 81.2 89.5 81.2 77.5 ...
```


```r
view(Data1)
```


```r
colnames(Data1)[1] <- "Age"
colnames(Data1)[2] <- "TotalNumberofWorkers"
colnames(Data1)[3] <- "TotalMedianWeeklyEarnings"
colnames(Data1)[4] <- "TotalStandardErrorofMedian"
colnames(Data1)[5] <- "WomensNumberofWorkers"
colnames(Data1)[6] <- "WomensMedianWeeklyEarnings"
colnames(Data1)[7] <- "WomensStandardErrorofMedian"
colnames(Data1)[8] <- "MensNumberofWorkers"
colnames(Data1)[9] <- "MensMedianWeeklyEarnings"
colnames(Data1)[10] <- "MensStandardErrorofMedian"
colnames(Data1)[11] <- "WomensEarningsAsPercentageOfMens"
```


```r
view(Data1)
```


```r
AgeData <- Data1 %>%
  slice(3:12)

view(AgeData)
```


```r
ggplot(AgeData, aes(x = Age, y = WomensMedianWeeklyEarnings)) +
  geom_col(fill = "black") +
  labs(x = "Age Groups",
       y = " ", 
       title = "Median for Women's Weekly Earnings") +
  theme_bw()
```

![](Task-19_files/figure-html/unnamed-chunk-7-1.png)<!-- -->


```r
ggplot(AgeData, aes(x = Age, y = MensMedianWeeklyEarnings)) +
  geom_col(fill = "black") +
  labs(x = "Age Groups",
       y = " ", 
       title = "Median for Men's Weekly Earnings") +
  theme_bw()
```

![](Task-19_files/figure-html/unnamed-chunk-8-1.png)<!-- -->
From these graphs comparing Men's and Women's weekly average of salary for age group, we can see that Men clearly have a higher weekly average than women do. While the trend line may be the same, we can see that on the Y Axis the Men's grouping has a higher overall average. 

From this graph, I was am to form a new question that will further my exploration of the data. If we were to separate the men and womens categories further into race and education, will we see the same results?

In order to answer these new questions, I will need to look specifucally at the race data and the education data. I would even like to go further and compare gender as well. 

I do not beleive there are any limitations from the data itself, the only limitation I can foresee occuring is that I do not have an adequate experience with tidying data just yet and may not be able to follow through with the data exploration without help. 

```r
RaceData <- Data1 %>%
  slice(15:18)

view(RaceData)
```


```r
MaritalData <- Data1 %>%
  slice(21:26)

view(MaritalData)
```


```r
EducationData <- Data1 %>%
  slice(34:38)

view(EducationData)
```

