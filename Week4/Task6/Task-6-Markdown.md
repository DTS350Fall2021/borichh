---
title: "Task 6"
author: "Haleigh Borich"
date: "9/21/2021"
output:
    html_document:
      theme: united
      keep_md: True
      code_folding: hide
---
Load Library

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
library(ggrepel)
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
Create Data

```r
iris
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1            5.1         3.5          1.4         0.2     setosa
## 2            4.9         3.0          1.4         0.2     setosa
## 3            4.7         3.2          1.3         0.2     setosa
## 4            4.6         3.1          1.5         0.2     setosa
## 5            5.0         3.6          1.4         0.2     setosa
## 6            5.4         3.9          1.7         0.4     setosa
## 7            4.6         3.4          1.4         0.3     setosa
## 8            5.0         3.4          1.5         0.2     setosa
## 9            4.4         2.9          1.4         0.2     setosa
## 10           4.9         3.1          1.5         0.1     setosa
## 11           5.4         3.7          1.5         0.2     setosa
## 12           4.8         3.4          1.6         0.2     setosa
## 13           4.8         3.0          1.4         0.1     setosa
## 14           4.3         3.0          1.1         0.1     setosa
## 15           5.8         4.0          1.2         0.2     setosa
## 16           5.7         4.4          1.5         0.4     setosa
## 17           5.4         3.9          1.3         0.4     setosa
## 18           5.1         3.5          1.4         0.3     setosa
## 19           5.7         3.8          1.7         0.3     setosa
## 20           5.1         3.8          1.5         0.3     setosa
## 21           5.4         3.4          1.7         0.2     setosa
## 22           5.1         3.7          1.5         0.4     setosa
## 23           4.6         3.6          1.0         0.2     setosa
## 24           5.1         3.3          1.7         0.5     setosa
## 25           4.8         3.4          1.9         0.2     setosa
## 26           5.0         3.0          1.6         0.2     setosa
## 27           5.0         3.4          1.6         0.4     setosa
## 28           5.2         3.5          1.5         0.2     setosa
## 29           5.2         3.4          1.4         0.2     setosa
## 30           4.7         3.2          1.6         0.2     setosa
## 31           4.8         3.1          1.6         0.2     setosa
## 32           5.4         3.4          1.5         0.4     setosa
## 33           5.2         4.1          1.5         0.1     setosa
## 34           5.5         4.2          1.4         0.2     setosa
## 35           4.9         3.1          1.5         0.2     setosa
## 36           5.0         3.2          1.2         0.2     setosa
## 37           5.5         3.5          1.3         0.2     setosa
## 38           4.9         3.6          1.4         0.1     setosa
## 39           4.4         3.0          1.3         0.2     setosa
## 40           5.1         3.4          1.5         0.2     setosa
## 41           5.0         3.5          1.3         0.3     setosa
## 42           4.5         2.3          1.3         0.3     setosa
## 43           4.4         3.2          1.3         0.2     setosa
## 44           5.0         3.5          1.6         0.6     setosa
## 45           5.1         3.8          1.9         0.4     setosa
## 46           4.8         3.0          1.4         0.3     setosa
## 47           5.1         3.8          1.6         0.2     setosa
## 48           4.6         3.2          1.4         0.2     setosa
## 49           5.3         3.7          1.5         0.2     setosa
## 50           5.0         3.3          1.4         0.2     setosa
## 51           7.0         3.2          4.7         1.4 versicolor
## 52           6.4         3.2          4.5         1.5 versicolor
## 53           6.9         3.1          4.9         1.5 versicolor
## 54           5.5         2.3          4.0         1.3 versicolor
## 55           6.5         2.8          4.6         1.5 versicolor
## 56           5.7         2.8          4.5         1.3 versicolor
## 57           6.3         3.3          4.7         1.6 versicolor
## 58           4.9         2.4          3.3         1.0 versicolor
## 59           6.6         2.9          4.6         1.3 versicolor
## 60           5.2         2.7          3.9         1.4 versicolor
## 61           5.0         2.0          3.5         1.0 versicolor
## 62           5.9         3.0          4.2         1.5 versicolor
## 63           6.0         2.2          4.0         1.0 versicolor
## 64           6.1         2.9          4.7         1.4 versicolor
## 65           5.6         2.9          3.6         1.3 versicolor
## 66           6.7         3.1          4.4         1.4 versicolor
## 67           5.6         3.0          4.5         1.5 versicolor
## 68           5.8         2.7          4.1         1.0 versicolor
## 69           6.2         2.2          4.5         1.5 versicolor
## 70           5.6         2.5          3.9         1.1 versicolor
## 71           5.9         3.2          4.8         1.8 versicolor
## 72           6.1         2.8          4.0         1.3 versicolor
## 73           6.3         2.5          4.9         1.5 versicolor
## 74           6.1         2.8          4.7         1.2 versicolor
## 75           6.4         2.9          4.3         1.3 versicolor
## 76           6.6         3.0          4.4         1.4 versicolor
## 77           6.8         2.8          4.8         1.4 versicolor
## 78           6.7         3.0          5.0         1.7 versicolor
## 79           6.0         2.9          4.5         1.5 versicolor
## 80           5.7         2.6          3.5         1.0 versicolor
## 81           5.5         2.4          3.8         1.1 versicolor
## 82           5.5         2.4          3.7         1.0 versicolor
## 83           5.8         2.7          3.9         1.2 versicolor
## 84           6.0         2.7          5.1         1.6 versicolor
## 85           5.4         3.0          4.5         1.5 versicolor
## 86           6.0         3.4          4.5         1.6 versicolor
## 87           6.7         3.1          4.7         1.5 versicolor
## 88           6.3         2.3          4.4         1.3 versicolor
## 89           5.6         3.0          4.1         1.3 versicolor
## 90           5.5         2.5          4.0         1.3 versicolor
## 91           5.5         2.6          4.4         1.2 versicolor
## 92           6.1         3.0          4.6         1.4 versicolor
## 93           5.8         2.6          4.0         1.2 versicolor
## 94           5.0         2.3          3.3         1.0 versicolor
## 95           5.6         2.7          4.2         1.3 versicolor
## 96           5.7         3.0          4.2         1.2 versicolor
## 97           5.7         2.9          4.2         1.3 versicolor
## 98           6.2         2.9          4.3         1.3 versicolor
## 99           5.1         2.5          3.0         1.1 versicolor
## 100          5.7         2.8          4.1         1.3 versicolor
## 101          6.3         3.3          6.0         2.5  virginica
## 102          5.8         2.7          5.1         1.9  virginica
## 103          7.1         3.0          5.9         2.1  virginica
## 104          6.3         2.9          5.6         1.8  virginica
## 105          6.5         3.0          5.8         2.2  virginica
## 106          7.6         3.0          6.6         2.1  virginica
## 107          4.9         2.5          4.5         1.7  virginica
## 108          7.3         2.9          6.3         1.8  virginica
## 109          6.7         2.5          5.8         1.8  virginica
## 110          7.2         3.6          6.1         2.5  virginica
## 111          6.5         3.2          5.1         2.0  virginica
## 112          6.4         2.7          5.3         1.9  virginica
## 113          6.8         3.0          5.5         2.1  virginica
## 114          5.7         2.5          5.0         2.0  virginica
## 115          5.8         2.8          5.1         2.4  virginica
## 116          6.4         3.2          5.3         2.3  virginica
## 117          6.5         3.0          5.5         1.8  virginica
## 118          7.7         3.8          6.7         2.2  virginica
## 119          7.7         2.6          6.9         2.3  virginica
## 120          6.0         2.2          5.0         1.5  virginica
## 121          6.9         3.2          5.7         2.3  virginica
## 122          5.6         2.8          4.9         2.0  virginica
## 123          7.7         2.8          6.7         2.0  virginica
## 124          6.3         2.7          4.9         1.8  virginica
## 125          6.7         3.3          5.7         2.1  virginica
## 126          7.2         3.2          6.0         1.8  virginica
## 127          6.2         2.8          4.8         1.8  virginica
## 128          6.1         3.0          4.9         1.8  virginica
## 129          6.4         2.8          5.6         2.1  virginica
## 130          7.2         3.0          5.8         1.6  virginica
## 131          7.4         2.8          6.1         1.9  virginica
## 132          7.9         3.8          6.4         2.0  virginica
## 133          6.4         2.8          5.6         2.2  virginica
## 134          6.3         2.8          5.1         1.5  virginica
## 135          6.1         2.6          5.6         1.4  virginica
## 136          7.7         3.0          6.1         2.3  virginica
## 137          6.3         3.4          5.6         2.4  virginica
## 138          6.4         3.1          5.5         1.8  virginica
## 139          6.0         3.0          4.8         1.8  virginica
## 140          6.9         3.1          5.4         2.1  virginica
## 141          6.7         3.1          5.6         2.4  virginica
## 142          6.9         3.1          5.1         2.3  virginica
## 143          5.8         2.7          5.1         1.9  virginica
## 144          6.8         3.2          5.9         2.3  virginica
## 145          6.7         3.3          5.7         2.5  virginica
## 146          6.7         3.0          5.2         2.3  virginica
## 147          6.3         2.5          5.0         1.9  virginica
## 148          6.5         3.0          5.2         2.0  virginica
## 149          6.2         3.4          5.4         2.3  virginica
## 150          5.9         3.0          5.1         1.8  virginica
```

```r
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

```r
tail(iris)
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
## 145          6.7         3.3          5.7         2.5 virginica
## 146          6.7         3.0          5.2         2.3 virginica
## 147          6.3         2.5          5.0         1.9 virginica
## 148          6.5         3.0          5.2         2.0 virginica
## 149          6.2         3.4          5.4         2.3 virginica
## 150          5.9         3.0          5.1         1.8 virginica
```

```r
view(iris)
str(iris)
```

```
## 'data.frame':	150 obs. of  5 variables:
##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```
Create a Dataset with only Petal Width

```r
WidthData <- iris %>%
  group_by(Species) %>%
  filter(row_number(desc(Petal.Width)) == 1)
WidthData
```

```
## # A tibble: 3 x 5
## # Groups:   Species [3]
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species   
##          <dbl>       <dbl>        <dbl>       <dbl> <fct>     
## 1          5           3.5          1.6         0.6 setosa    
## 2          5.9         3.2          4.8         1.8 versicolor
## 3          6.3         3.3          6           2.5 virginica
```
Create a Dataset with only Petal Length

```r
LengthData <- iris %>%
  group_by(Species) %>%
  filter(row_number(desc(Petal.Length)) == 1)
```
Create a Vizualisation

```r
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
```

![](Task-6-Markdown_files/figure-html/unnamed-chunk-5-1.png)<!-- -->
Import New Data

```r
ScrabbleData <- read_csv("scrabble_games.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   gameid = col_double(),
##   tourneyid = col_double(),
##   tie = col_logical(),
##   winnerid = col_double(),
##   winnername = col_character(),
##   winnerscore = col_double(),
##   winneroldrating = col_double(),
##   winnernewrating = col_double(),
##   winnerpos = col_double(),
##   loserid = col_double(),
##   losername = col_character(),
##   loserscore = col_double(),
##   loseroldrating = col_double(),
##   losernewrating = col_double(),
##   loserpos = col_double(),
##   round = col_double(),
##   division = col_double(),
##   date = col_date(format = ""),
##   lexicon = col_logical()
## )
```
Look at Data

```r
head(ScrabbleData)
```

```
## # A tibble: 6 x 19
##   gameid tourneyid tie   winnerid winnername winnerscore winneroldrating
##    <dbl>     <dbl> <lgl>    <dbl> <chr>            <dbl>           <dbl>
## 1      1         1 FALSE      268 Harriette…           0            1568
## 2      2         1 FALSE      268 Harriette…           0            1568
## 3      3         1 FALSE      268 Harriette…           0            1568
## 4      4         1 FALSE      268 Harriette…           0            1568
## 5      5         1 FALSE      268 Harriette…           0            1568
## 6      6         1 FALSE      268 Harriette…           0            1568
## # … with 12 more variables: winnernewrating <dbl>, winnerpos <dbl>,
## #   loserid <dbl>, losername <chr>, loserscore <dbl>, loseroldrating <dbl>,
## #   losernewrating <dbl>, loserpos <dbl>, round <dbl>, division <dbl>,
## #   date <date>, lexicon <lgl>
```

```r
tail(ScrabbleData)
```

```
## # A tibble: 6 x 19
##   gameid tourneyid tie   winnerid winnername winnerscore winneroldrating
##    <dbl>     <dbl> <lgl>    <dbl> <chr>            <dbl>           <dbl>
## 1 1.82e6      3021 FALSE     7523 Annette P…           0            1142
## 2 1.82e6      3021 FALSE    15830 Ella Bart…           0               0
## 3 1.82e6      3021 FALSE     1859 Claire Ul…           0             730
## 4 1.82e6      3021 FALSE     2750 Poppy Tho…           0               0
## 5 1.82e6      3021 FALSE     2750 Poppy Tho…           0               0
## 6 1.82e6      3021 FALSE     2750 Poppy Tho…           0               0
## # … with 12 more variables: winnernewrating <dbl>, winnerpos <dbl>,
## #   loserid <dbl>, losername <chr>, loserscore <dbl>, loseroldrating <dbl>,
## #   losernewrating <dbl>, loserpos <dbl>, round <dbl>, division <dbl>,
## #   date <date>, lexicon <lgl>
```

```r
str(ScrabbleData)
```

```
## tibble [1,542,642 × 19] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ gameid         : num [1:1542642] 1 2 3 4 5 6 7 8 9 10 ...
##  $ tourneyid      : num [1:1542642] 1 1 1 1 1 1 1 1 1 1 ...
##  $ tie            : logi [1:1542642] FALSE FALSE FALSE FALSE FALSE FALSE ...
##  $ winnerid       : num [1:1542642] 268 268 268 268 268 268 268 268 429 429 ...
##  $ winnername     : chr [1:1542642] "Harriette Lakernick" "Harriette Lakernick" "Harriette Lakernick" "Harriette Lakernick" ...
##  $ winnerscore    : num [1:1542642] 0 0 0 0 0 0 0 0 0 0 ...
##  $ winneroldrating: num [1:1542642] 1568 1568 1568 1568 1568 ...
##  $ winnernewrating: num [1:1542642] 1684 1684 1684 1684 1684 ...
##  $ winnerpos      : num [1:1542642] 1 1 1 1 1 1 1 1 3 3 ...
##  $ loserid        : num [1:1542642] 429 435 441 456 1334 ...
##  $ losername      : chr [1:1542642] "Patricia Barrett" "Chris Cree" "Caesar Jaramillo" "Mike Chitwood" ...
##  $ loserscore     : num [1:1542642] 0 0 0 0 0 0 0 0 0 0 ...
##  $ loseroldrating : num [1:1542642] 1915 1840 1622 1612 1537 ...
##  $ losernewrating : num [1:1542642] 1872 1798 1606 1600 1590 ...
##  $ loserpos       : num [1:1542642] 3 6 10 9 4 8 7 2 9 4 ...
##  $ round          : num [1:1542642] 1 2 3 4 6 8 9 10 3 5 ...
##  $ division       : num [1:1542642] 1 1 1 1 1 1 1 1 1 1 ...
##  $ date           : Date[1:1542642], format: "1998-12-06" "1998-12-06" ...
##  $ lexicon        : logi [1:1542642] FALSE FALSE FALSE FALSE FALSE FALSE ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   gameid = col_double(),
##   ..   tourneyid = col_double(),
##   ..   tie = col_logical(),
##   ..   winnerid = col_double(),
##   ..   winnername = col_character(),
##   ..   winnerscore = col_double(),
##   ..   winneroldrating = col_double(),
##   ..   winnernewrating = col_double(),
##   ..   winnerpos = col_double(),
##   ..   loserid = col_double(),
##   ..   losername = col_character(),
##   ..   loserscore = col_double(),
##   ..   loseroldrating = col_double(),
##   ..   losernewrating = col_double(),
##   ..   loserpos = col_double(),
##   ..   round = col_double(),
##   ..   division = col_double(),
##   ..   date = col_date(format = ""),
##   ..   lexicon = col_logical()
##   .. )
```
Filter Data

```r
ScrabbleAll <- ScrabbleData %>%
  select(date, winnerscore, loserscore) %>%
  pivot_longer(c("winnerscore", "loserscore"), names_to = "win-loss",
               values_to = "score") %>%
  filter(score > 0) %>%
  mutate(year = year(date),
         week = week(date))
head(ScrabbleAll)
```

```
## # A tibble: 6 x 5
##   date       `win-loss`  score  year  week
##   <date>     <chr>       <dbl> <dbl> <dbl>
## 1 1999-01-15 winnerscore   521  1999     3
## 2 1999-01-15 loserscore    237  1999     3
## 3 1999-01-15 winnerscore   488  1999     3
## 4 1999-01-15 loserscore    262  1999     3
## 5 1999-01-15 winnerscore   465  1999     3
## 6 1999-01-15 loserscore    330  1999     3
```
Find Weekly Averages

```r
weeklyscore1 <- ScrabbleAll %>%
  group_by(year, week) %>%
  summarize(avgscore = mean(score), Date = min(date))
```

```
## `summarise()` has grouped output by 'year'. You can override using the `.groups` argument.
```

```r
head(weeklyscore1)
```

```
## # A tibble: 6 x 4
## # Groups:   year [2]
##    year  week avgscore Date      
##   <dbl> <dbl>    <dbl> <date>    
## 1  1976    49     367. 1976-12-05
## 2  1977     5     324  1977-02-01
## 3  1977     9     317. 1977-02-27
## 4  1977    10     414. 1977-03-05
## 5  1977    13     371. 1977-03-26
## 6  1977    19     354. 1977-05-07
```

```r
str(weeklyscore1)
```

```
## tibble [1,153 × 4] (S3: grouped_df/tbl_df/tbl/data.frame)
##  $ year    : num [1:1153] 1976 1977 1977 1977 1977 ...
##  $ week    : num [1:1153] 49 5 9 10 13 19 20 21 31 39 ...
##  $ avgscore: num [1:1153] 367 324 317 414 371 ...
##  $ Date    : Date[1:1153], format: "1976-12-05" "1977-02-01" ...
##  - attr(*, "groups")= tibble [42 × 2] (S3: tbl_df/tbl/data.frame)
##   ..$ year : num [1:42] 1976 1977 1978 1979 1980 ...
##   ..$ .rows: list<int> [1:42] 
##   .. ..$ : int 1
##   .. ..$ : int [1:10] 2 3 4 5 6 7 8 9 10 11
##   .. ..$ : int [1:5] 12 13 14 15 16
##   .. ..$ : int [1:11] 17 18 19 20 21 22 23 24 25 26 ...
##   .. ..$ : int [1:11] 28 29 30 31 32 33 34 35 36 37 ...
##   .. ..$ : int [1:11] 39 40 41 42 43 44 45 46 47 48 ...
##   .. ..$ : int [1:10] 50 51 52 53 54 55 56 57 58 59
##   .. ..$ : int [1:12] 60 61 62 63 64 65 66 67 68 69 ...
##   .. ..$ : int [1:8] 72 73 74 75 76 77 78 79
##   .. ..$ : int [1:16] 80 81 82 83 84 85 86 87 88 89 ...
##   .. ..$ : int [1:17] 96 97 98 99 100 101 102 103 104 105 ...
##   .. ..$ : int [1:24] 113 114 115 116 117 118 119 120 121 122 ...
##   .. ..$ : int [1:24] 137 138 139 140 141 142 143 144 145 146 ...
##   .. ..$ : int [1:25] 161 162 163 164 165 166 167 168 169 170 ...
##   .. ..$ : int [1:17] 186 187 188 189 190 191 192 193 194 195 ...
##   .. ..$ : int [1:15] 203 204 205 206 207 208 209 210 211 212 ...
##   .. ..$ : int [1:14] 218 219 220 221 222 223 224 225 226 227 ...
##   .. ..$ : int [1:10] 232 233 234 235 236 237 238 239 240 241
##   .. ..$ : int [1:11] 242 243 244 245 246 247 248 249 250 251 ...
##   .. ..$ : int [1:16] 253 254 255 256 257 258 259 260 261 262 ...
##   .. ..$ : int [1:17] 269 270 271 272 273 274 275 276 277 278 ...
##   .. ..$ : int [1:19] 286 287 288 289 290 291 292 293 294 295 ...
##   .. ..$ : int [1:20] 305 306 307 308 309 310 311 312 313 314 ...
##   .. ..$ : int [1:22] 325 326 327 328 329 330 331 332 333 334 ...
##   .. ..$ : int [1:26] 347 348 349 350 351 352 353 354 355 356 ...
##   .. ..$ : int [1:29] 373 374 375 376 377 378 379 380 381 382 ...
##   .. ..$ : int [1:38] 402 403 404 405 406 407 408 409 410 411 ...
##   .. ..$ : int [1:43] 440 441 442 443 444 445 446 447 448 449 ...
##   .. ..$ : int [1:41] 483 484 485 486 487 488 489 490 491 492 ...
##   .. ..$ : int [1:46] 524 525 526 527 528 529 530 531 532 533 ...
##   .. ..$ : int [1:51] 570 571 572 573 574 575 576 577 578 579 ...
##   .. ..$ : int [1:51] 621 622 623 624 625 626 627 628 629 630 ...
##   .. ..$ : int [1:51] 672 673 674 675 676 677 678 679 680 681 ...
##   .. ..$ : int [1:53] 723 724 725 726 727 728 729 730 731 732 ...
##   .. ..$ : int [1:53] 776 777 778 779 780 781 782 783 784 785 ...
##   .. ..$ : int [1:53] 829 830 831 832 833 834 835 836 837 838 ...
##   .. ..$ : int [1:53] 882 883 884 885 886 887 888 889 890 891 ...
##   .. ..$ : int [1:52] 935 936 937 938 939 940 941 942 943 944 ...
##   .. ..$ : int [1:53] 987 988 989 990 991 992 993 994 995 996 ...
##   .. ..$ : int [1:52] 1040 1041 1042 1043 1044 1045 1046 1047 1048 1049 ...
##   .. ..$ : int [1:52] 1092 1093 1094 1095 1096 1097 1098 1099 1100 1101 ...
##   .. ..$ : int [1:10] 1144 1145 1146 1147 1148 1149 1150 1151 1152 1153
##   .. ..@ ptype: int(0) 
##   ..- attr(*, ".drop")= logi TRUE
```
Seperate into Two Datasets

```r
before <- ScrabbleAll %>%
  group_by(year, week) %>%
  filter(date > as.Date("2006-03-01")) %>%
  summarize(avgscore = mean(score), Date = min(date))
```

```
## `summarise()` has grouped output by 'year'. You can override using the `.groups` argument.
```

```r
head(before)
```

```
## # A tibble: 6 x 4
## # Groups:   year [1]
##    year  week avgscore Date      
##   <dbl> <dbl>    <dbl> <date>    
## 1  2006     9     383. 2006-03-04
## 2  2006    10     385. 2006-03-05
## 3  2006    11     397. 2006-03-17
## 4  2006    12     383  2006-03-19
## 5  2006    13     361. 2006-03-26
## 6  2006    14     365. 2006-04-02
```

```r
after <- ScrabbleAll %>%
  group_by(year, week) %>%
  filter(date < as.Date("2006-03-01")) %>%
  summarize(avgscore = mean(score), Date = min(date))
```

```
## `summarise()` has grouped output by 'year'. You can override using the `.groups` argument.
```

```r
head(after)
```

```
## # A tibble: 6 x 4
## # Groups:   year [2]
##    year  week avgscore Date      
##   <dbl> <dbl>    <dbl> <date>    
## 1  1976    49     367. 1976-12-05
## 2  1977     5     324  1977-02-01
## 3  1977     9     317. 1977-02-27
## 4  1977    10     414. 1977-03-05
## 5  1977    13     371. 1977-03-26
## 6  1977    19     354. 1977-05-07
```
Create Vizualisation

```r
scrabblegraph <- ggplot(data = weeklyscore1, mapping = aes(x = Date, y = avgscore)) +
  geom_point() +
  geom_smooth(data = before, method = lm, color = "blue") +
  geom_point() +
  geom_smooth(data = after, method = lm, color = "orange") +
  geom_vline(xintercept = as.Date("2006-03-01") , linetype = "dotted") +
  coord_cartesian(ylim = c(355,405), expand = FALSE) +
  scale_x_date(date_breaks = "3 months",
               limits = as.Date(c('1/6/2005', '1/9/2006'), format = "%d/%m/%Y"),
               date_labels = "%b-%Y") +
  annotate("text", x = as.Date("2005-12-05"), y = 380, label = "Trend Before", color = "orange", size = 3) +
  annotate("text", x = as.Date("2006-07-05"), y = 380, label = "Trend After", color = "blue", size = 3) +
  annotate("text", x = as.Date("2006-03-01"), y = 390, label = "Dictionary Updated", color = "black", size = 3) +
  labs(x = " ",
       y = "Average Score",
       title = "Scrabble score in the age of 'QI' and 'ZA'",
       subtitle = "Weekly average scores before and after the addition of around 11,000 words
to the Scrabble dictionary",
       caption = "Source: FiveThirtyEight") +
  theme_bw()
scrabblegraph
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```
## Warning: Removed 550 rows containing non-finite values (stat_smooth).
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```
## Warning: Removed 542 rows containing non-finite values (stat_smooth).
```

```
## Warning: Removed 1092 rows containing missing values (geom_point).

## Warning: Removed 1092 rows containing missing values (geom_point).
```

![](Task-6-Markdown_files/figure-html/unnamed-chunk-11-1.png)<!-- -->

