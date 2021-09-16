---
title: "Task 5 Markdown"
author: "Haleigh Borich"
date: "9/9/2021"
output:
  html_document:
      code_folding: "hide"
      keep_md: true
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
library(downloader)
library(readxl)
```


```r
SoloData <- read.csv("solo-artist-followers.csv")
head(SoloData)
```

```
##                name   band followers band_followers follower_difference
## 1       Daron Jones    112     1.28k           783k               −782k
## 2              Slim    112     2.14k           783k               −781k
## 3          Q Parker    112     3.51k           783k               −780k
## 4         JC Chasez *NSYNC     30.8k          1.44M              −1.41M
## 5       Joey Fatone *NSYNC     1.13k          1.44M              −1.44M
## 6 Justin Timberlake *NSYNC     10.3M          1.44M               8.90M
```

```r
tail(SoloData)
```

```
##             name         band followers band_followers follower_difference
## 134        Yubin Wonder Girls      131k           400k               −269k
## 135 Aubrey O'Day  Danity Kane     17.5k           453k               −435k
## 136 Dawn Richard  Danity Kane     72.9k           453k               −380k
## 137  Shannon Bex  Danity Kane       204           453k               −453k
## 138     D. Woods  Danity Kane       867           453k               −452k
## 139  Pamela Long        Total       142           340k               −340k
```

```r
view(SoloData)
str(SoloData)
```

```
## 'data.frame':	139 obs. of  5 variables:
##  $ name               : chr  "Daron Jones" "Slim" "Q Parker" "JC Chasez" ...
##  $ band               : chr  "112" "112" "112" "*NSYNC" ...
##  $ followers          : chr  "1.28k" "2.14k" "3.51k" "30.8k" ...
##  $ band_followers     : chr  "783k" "783k" "783k" "1.44M" ...
##  $ follower_difference: chr  "−782k" "−781k" "−780k" "−1.41M" ...
```
It looks as though the data did trasnfer over correctly

```r
BillboardData <- read.csv("billboard-hits.csv")
head(BillboardData)
```

```
##     name band                     title  peak_date peak_rank
## 1 *NSYNC               It's Gonna Be Me 2000-07-28         1
## 2 *NSYNC              Music Of My Heart 1999-10-15         2
## 3 *NSYNC                    Bye Bye Bye 2000-04-14         4
## 4 *NSYNC             This I Promise You 2000-12-01         5
## 5 *NSYNC                     Girlfriend 2002-04-05         5
## 6 *NSYNC      A Little More Time On You 1999-02-26         8
```

```r
tail(BillboardData)
```

```
##       name   band                     title  peak_date peak_rank
## 451 Xscape                 Who Can I Run To 1995-11-17         8
## 452 Xscape                 My Little Secret 1998-10-23         9
## 453 Xscape                    Feels So Good 1995-07-21        32
## 454 Xscape                  Love On My Mind 1994-06-03        46
## 455 Xscape        Do You Want To/Can't Hang 1996-03-15        50
## 456  Kandi Xscape       Don't Think I'm Not 2000-10-06        24
```

```r
view(BillboardData)
str(BillboardData)
```

```
## 'data.frame':	456 obs. of  5 variables:
##  $ name     : chr  "*NSYNC" "*NSYNC" "*NSYNC" "*NSYNC" ...
##  $ band     : chr  "" "" "" "" ...
##  $ title    : chr  "It's Gonna Be Me" "Music Of My Heart" "Bye Bye Bye" "This I Promise You" ...
##  $ peak_date: chr  "2000-07-28" "1999-10-15" "2000-04-14" "2000-12-01" ...
##  $ peak_rank: int  1 2 4 5 5 8 11 13 19 59 ...
```
It looks as though the data did not trasnfer over correctly. 

```r
BillboardData <- read_csv(
  ("billboard-hits.csv"),
  col_types = cols(
    peak_date = col_date()
  )
)

str(BillboardData)
```

```
## tibble [456 × 5] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ name     : chr [1:456] "*NSYNC" "*NSYNC" "*NSYNC" "*NSYNC" ...
##  $ band     : chr [1:456] NA NA NA NA ...
##  $ title    : chr [1:456] "It's Gonna Be Me" "Music Of My Heart" "Bye Bye Bye" "This I Promise You" ...
##  $ peak_date: Date[1:456], format: "2000-07-28" "1999-10-15" ...
##  $ peak_rank: num [1:456] 1 2 4 5 5 8 11 13 19 59 ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   name = col_character(),
##   ..   band = col_character(),
##   ..   title = col_character(),
##   ..   peak_date = col_date(format = ""),
##   ..   peak_rank = col_double()
##   .. )
```
The data is now correct for the Billbaord Data


```r
SixHits <- BillboardData %>%
  group_by(name) %>%
  filter(n() > 6 & band != "")
view(SixHits)
```


```r
BandHits <- BillboardData %>%
  group_by(band) %>%
  filter(name %in% SixHits$band)
view(BandHits)
```


```r
BandHits <- rename(BandHits, name = band, band = name)
```



```r
ggplot(data = SixHits, aes(x = peak_date, y = peak_rank, color = name, group = name)) +
  geom_point() +
  geom_line() +
  geom_point(data = BandHits, color = "black") +
  geom_line(data = BandHits, color = "black", linetype = "dashed") +
  facet_wrap(~band, scales = "free") +
  theme_bw()
```

```
## geom_path: Each group consists of only one observation. Do you need to adjust
## the group aesthetic?
```

![](Task5-Markdown_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

Part 2
Here is what we know about Race and Killings By Police
https://www.buzzfeednews.com/article/peteraldhous/race-and-police-shootings 

```r
PoliceData <- tibble(read_csv("fatal-police-shootings-data.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   id = col_double(),
##   name = col_character(),
##   date = col_date(format = ""),
##   manner_of_death = col_character(),
##   armed = col_character(),
##   age = col_double(),
##   gender = col_character(),
##   race = col_character(),
##   city = col_character(),
##   state = col_character(),
##   signs_of_mental_illness = col_logical(),
##   threat_level = col_character(),
##   flee = col_character(),
##   body_camera = col_logical(),
##   longitude = col_double(),
##   latitude = col_double(),
##   is_geocoding_exact = col_logical()
## )
```

```r
str(PoliceData)
```

```
## tibble [6,569 × 17] (S3: tbl_df/tbl/data.frame)
##  $ id                     : num [1:6569] 3 4 5 8 9 11 13 15 16 17 ...
##  $ name                   : chr [1:6569] "Tim Elliot" "Lewis Lee Lembke" "John Paul Quintero" "Matthew Hoffman" ...
##  $ date                   : Date[1:6569], format: "2015-01-02" "2015-01-02" ...
##  $ manner_of_death        : chr [1:6569] "shot" "shot" "shot and Tasered" "shot" ...
##  $ armed                  : chr [1:6569] "gun" "gun" "unarmed" "toy weapon" ...
##  $ age                    : num [1:6569] 53 47 23 32 39 18 22 35 34 47 ...
##  $ gender                 : chr [1:6569] "M" "M" "M" "M" ...
##  $ race                   : chr [1:6569] "A" "W" "H" "W" ...
##  $ city                   : chr [1:6569] "Shelton" "Aloha" "Wichita" "San Francisco" ...
##  $ state                  : chr [1:6569] "WA" "OR" "KS" "CA" ...
##  $ signs_of_mental_illness: logi [1:6569] TRUE FALSE FALSE TRUE FALSE FALSE ...
##  $ threat_level           : chr [1:6569] "attack" "attack" "other" "attack" ...
##  $ flee                   : chr [1:6569] "Not fleeing" "Not fleeing" "Not fleeing" "Not fleeing" ...
##  $ body_camera            : logi [1:6569] FALSE FALSE FALSE FALSE FALSE FALSE ...
##  $ longitude              : num [1:6569] -123.1 -122.9 -97.3 -122.4 -104.7 ...
##  $ latitude               : num [1:6569] 47.2 45.5 37.7 37.8 40.4 ...
##  $ is_geocoding_exact     : logi [1:6569] TRUE TRUE TRUE TRUE TRUE TRUE ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   id = col_double(),
##   ..   name = col_character(),
##   ..   date = col_date(format = ""),
##   ..   manner_of_death = col_character(),
##   ..   armed = col_character(),
##   ..   age = col_double(),
##   ..   gender = col_character(),
##   ..   race = col_character(),
##   ..   city = col_character(),
##   ..   state = col_character(),
##   ..   signs_of_mental_illness = col_logical(),
##   ..   threat_level = col_character(),
##   ..   flee = col_character(),
##   ..   body_camera = col_logical(),
##   ..   longitude = col_double(),
##   ..   latitude = col_double(),
##   ..   is_geocoding_exact = col_logical()
##   .. )
```
a. It looks as though all of the data transferred over correctly.
b. Some information about this dataset: It comes from Washington Post and has a compilation of information on people shot by police in the year 2015. It includes their race and whether or not they were armed. 

The Counted
https://www.theguardian.com/us-news/ng-interactive/2015/jun/01/about-the-counted 

```r
CountedData <- tibble(read_csv("the-counted-2015.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   uid = col_double(),
##   name = col_character(),
##   age = col_character(),
##   gender = col_character(),
##   raceethnicity = col_character(),
##   month = col_character(),
##   day = col_double(),
##   year = col_double(),
##   streetaddress = col_character(),
##   city = col_character(),
##   state = col_character(),
##   classification = col_character(),
##   lawenforcementagency = col_character(),
##   armed = col_character()
## )
```

```r
str(CountedData)
```

```
## tibble [1,146 × 14] (S3: tbl_df/tbl/data.frame)
##  $ uid                 : num [1:1146] 2 4 5 6 7 8 9 10 11 12 ...
##  $ name                : chr [1:1146] "Matthew Ajibade" "Lewis Lembke" "Michael Kocher Jr" "John Quintero" ...
##  $ age                 : chr [1:1146] "22" "47" "19" "23" ...
##  $ gender              : chr [1:1146] "Male" "Male" "Male" "Male" ...
##  $ raceethnicity       : chr [1:1146] "Black" "White" "White" "Hispanic/Latino" ...
##  $ month               : chr [1:1146] "January" "January" "January" "January" ...
##  $ day                 : num [1:1146] 1 2 3 3 2 4 5 5 6 6 ...
##  $ year                : num [1:1146] 2015 2015 2015 2015 2015 ...
##  $ streetaddress       : chr [1:1146] "1050 Carl Griffin Dr" "4505 SW Masters Loop" "2600 Kaumualii Hwy" "500 North Oliver Ave" ...
##  $ city                : chr [1:1146] "Savannah" "Aloha" "Kaumakani" "Wichita" ...
##  $ state               : chr [1:1146] "GA" "OR" "HI" "KS" ...
##  $ classification      : chr [1:1146] "Death in custody" "Gunshot" "Struck by vehicle" "Gunshot" ...
##  $ lawenforcementagency: chr [1:1146] "Chatham County Sheriff's Office" "Washington County Sheriff's Office" "Kauai Police Department" "Wichita Police Department" ...
##  $ armed               : chr [1:1146] "No" "Firearm" "No" "No" ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   uid = col_double(),
##   ..   name = col_character(),
##   ..   age = col_character(),
##   ..   gender = col_character(),
##   ..   raceethnicity = col_character(),
##   ..   month = col_character(),
##   ..   day = col_double(),
##   ..   year = col_double(),
##   ..   streetaddress = col_character(),
##   ..   city = col_character(),
##   ..   state = col_character(),
##   ..   classification = col_character(),
##   ..   lawenforcementagency = col_character(),
##   ..   armed = col_character()
##   .. )
```
a. It looks as though everything transferred over correctly.
b. Some information about this dataset: It comes from The Guardian and it includes information about people killed by police and other law enforcement agencies in the United States throughout the year 2015. This data is used to combat the lack of basic data in police agencies. 

National Instant Criminal Background Check System (NICS)
https://www.fbi.gov/services/cjis/nics 

```r
NICSdata <- tibble(read_csv("nics-firearm-background-checks.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   .default = col_double(),
##   month = col_character(),
##   state = col_character()
## )
## ℹ Use `spec()` for the full column specifications.
```

```r
str(NICSdata)
```

```
## tibble [15,070 × 27] (S3: tbl_df/tbl/data.frame)
##  $ month                    : chr [1:15070] "2021-08" "2021-08" "2021-08" "2021-08" ...
##  $ state                    : chr [1:15070] "Alabama" "Alaska" "Arizona" "Arkansas" ...
##  $ permit                   : num [1:15070] 26984 188 3236 3378 17798 ...
##  $ permit_recheck           : num [1:15070] 404 23 1060 566 13364 ...
##  $ handgun                  : num [1:15070] 18820 2847 18697 7146 41275 ...
##  $ long_gun                 : num [1:15070] 14786 3183 10195 6052 28433 ...
##  $ other                    : num [1:15070] 1380 275 1685 470 5995 ...
##  $ multiple                 : num [1:15070] 886 206 967 416 0 ...
##  $ admin                    : num [1:15070] 0 0 0 0 0 0 0 0 1 5 ...
##  $ prepawn_handgun          : num [1:15070] 14 0 4 12 0 0 0 0 0 9 ...
##  $ prepawn_long_gun         : num [1:15070] 11 2 2 5 3 0 0 0 0 6 ...
##  $ prepawn_other            : num [1:15070] 1 0 2 0 0 0 0 1 0 0 ...
##  $ redemption_handgun       : num [1:15070] 2022 123 966 933 353 ...
##  $ redemption_long_gun      : num [1:15070] 820 104 369 682 300 0 0 8 0 749 ...
##  $ redemption_other         : num [1:15070] 11 2 1 5 28 0 0 0 0 8 ...
##  $ returned_handgun         : num [1:15070] 35 31 150 0 1907 ...
##  $ returned_long_gun        : num [1:15070] 0 25 13 0 970 48 0 0 0 94 ...
##  $ returned_other           : num [1:15070] 0 0 1 0 82 2 0 0 42 4 ...
##  $ rentals_handgun          : num [1:15070] 0 0 0 0 0 0 0 0 0 0 ...
##  $ rentals_long_gun         : num [1:15070] 0 0 0 0 0 0 0 0 0 0 ...
##  $ private_sale_handgun     : num [1:15070] 25 7 11 9 6862 ...
##  $ private_sale_long_gun    : num [1:15070] 24 4 5 8 2978 ...
##  $ private_sale_other       : num [1:15070] 8 0 1 0 575 0 91 4 0 57 ...
##  $ return_to_seller_handgun : num [1:15070] 0 0 0 0 28 0 0 0 0 40 ...
##  $ return_to_seller_long_gun: num [1:15070] 2 0 0 1 6 0 0 0 0 34 ...
##  $ return_to_seller_other   : num [1:15070] 0 0 0 0 2 0 0 0 0 0 ...
##  $ totals                   : num [1:15070] 66233 7020 37365 19683 120959 ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   month = col_character(),
##   ..   state = col_character(),
##   ..   permit = col_double(),
##   ..   permit_recheck = col_double(),
##   ..   handgun = col_double(),
##   ..   long_gun = col_double(),
##   ..   other = col_double(),
##   ..   multiple = col_double(),
##   ..   admin = col_double(),
##   ..   prepawn_handgun = col_double(),
##   ..   prepawn_long_gun = col_double(),
##   ..   prepawn_other = col_double(),
##   ..   redemption_handgun = col_double(),
##   ..   redemption_long_gun = col_double(),
##   ..   redemption_other = col_double(),
##   ..   returned_handgun = col_double(),
##   ..   returned_long_gun = col_double(),
##   ..   returned_other = col_double(),
##   ..   rentals_handgun = col_double(),
##   ..   rentals_long_gun = col_double(),
##   ..   private_sale_handgun = col_double(),
##   ..   private_sale_long_gun = col_double(),
##   ..   private_sale_other = col_double(),
##   ..   return_to_seller_handgun = col_double(),
##   ..   return_to_seller_long_gun = col_double(),
##   ..   return_to_seller_other = col_double(),
##   ..   totals = col_double()
##   .. )
```

```r
NICSdata <- read_csv(
  "nics-firearm-background-checks.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   .default = col_double(),
##   month = col_character(),
##   state = col_character()
## )
## ℹ Use `spec()` for the full column specifications.
```

```r
  col_types = cols()
```


Injury Statistics
https://www.stats.govt.nz/large-datasets/csv-files-for-download/

```r
InjuryData <- tibble(read_csv("injury-statistics-work-related-claims-2018-csv.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   Year = col_double(),
##   Sex = col_character(),
##   `Age group (years) at date of injury` = col_character(),
##   `Geographic region where injury occurred` = col_character(),
##   `Employment status` = col_character(),
##   Occupation = col_character(),
##   `Injury/illness/disease group` = col_character(),
##   `Type of injury/illness/disease` = col_character(),
##   Industry = col_character(),
##   `Industry subgroup` = col_character(),
##   Value = col_double(),
##   Measure = col_character(),
##   Status = col_character()
## )
```

```r
str(InjuryData)
```

```
## tibble [2,945 × 13] (S3: tbl_df/tbl/data.frame)
##  $ Year                                   : num [1:2945] 2002 2003 2004 2005 2006 ...
##  $ Sex                                    : chr [1:2945] "Total" "Total" "Total" "Total" ...
##  $ Age group (years) at date of injury    : chr [1:2945] "Total" "Total" "Total" "Total" ...
##  $ Geographic region where injury occurred: chr [1:2945] "Total" "Total" "Total" "Total" ...
##  $ Employment status                      : chr [1:2945] "Total" "Total" "Total" "Total" ...
##  $ Occupation                             : chr [1:2945] "Total" "Total" "Total" "Total" ...
##  $ Injury/illness/disease group           : chr [1:2945] "Total" "Total" "Total" "Total" ...
##  $ Type of injury/illness/disease         : chr [1:2945] "Total" "Total" "Total" "Total" ...
##  $ Industry                               : chr [1:2945] "Total" "Total" "Total" "Total" ...
##  $ Industry subgroup                      : chr [1:2945] "Total" "Total" "Total" "Total" ...
##  $ Value                                  : num [1:2945] 258 258 261 262 254 ...
##  $ Measure                                : chr [1:2945] "Number of claims in thousands" "Number of claims in thousands" "Number of claims in thousands" "Number of claims in thousands" ...
##  $ Status                                 : chr [1:2945] "Final" "Final" "Final" "Final" ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   Year = col_double(),
##   ..   Sex = col_character(),
##   ..   `Age group (years) at date of injury` = col_character(),
##   ..   `Geographic region where injury occurred` = col_character(),
##   ..   `Employment status` = col_character(),
##   ..   Occupation = col_character(),
##   ..   `Injury/illness/disease group` = col_character(),
##   ..   `Type of injury/illness/disease` = col_character(),
##   ..   Industry = col_character(),
##   ..   `Industry subgroup` = col_character(),
##   ..   Value = col_double(),
##   ..   Measure = col_character(),
##   ..   Status = col_character()
##   .. )
```
a. It looks as though everything transferred over correctly.
b. Some information about this dataset: it includes information about where the injury occured, the age of the person, and what occured after the injury. 
