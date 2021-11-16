---
title: "Case Study 11"
author: "Haleigh Borich"
date: "11/15/2021"
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
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
```

```
## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
## ✓ tibble  3.1.6     ✓ dplyr   1.0.7
## ✓ tidyr   1.1.4     ✓ stringr 1.4.0
## ✓ readr   2.1.0     ✓ forcats 0.5.1
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(USAboundaries)
library(sf)
```

```
## Linking to GEOS 3.8.1, GDAL 3.2.1, PROJ 7.2.1
```

```r
library(ggrepel)
library(lwgeom)
```

```
## Linking to liblwgeom 3.0.0beta1 r16016, GEOS 3.8.1, PROJ 7.2.1
```

```r
library(maps)
```

```
## 
## Attaching package: 'maps'
```

```
## The following object is masked from 'package:purrr':
## 
##     map
```

```r
library(downloader)
```


```r
data <- tempfile()
download("https://raw.githubusercontent.com/WJC-Data-Science/DTS350/master/permits.csv", data, mode = "wb")
permits <- read_csv(data)
```

```
## New names:
## * `` -> ...1
```

```
## Rows: 327422 Columns: 8
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (3): StateAbbr, countyname, variable
## dbl (5): ...1, state, county, year, value
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```


```r
view(permits)
view(state_codes)
```


```r
clean_codes <- state_codes %>%
  mutate(state = as.integer(state_code))
```



```r
total <- merge(permits, clean_codes, by = "state") %>%
  group_by(state_name, year) %>%
  summarise(across(value, sum))
```

```
## `summarise()` has grouped output by 'state_name'. You can override using the `.groups` argument.
```


```r
ggplot(data = total, aes(x = year, y = value/1000, color = state_name)) +
    geom_point() +
    geom_line() +
    geom_vline(xintercept = 2008, linetype = 'dotted') +
    labs(x = '', y = 'Number of Permits (per 1000)', title = 'Permits per State') +
    theme_bw()
```

![](Case-Study-11_files/figure-html/unnamed-chunk-6-1.png)<!-- -->


```r
total %>%
  filter(state_name == 'Missouri') %>%
  ggplot(aes(x = year, y = value/1000)) +
    geom_point() +
    geom_line() +
    geom_vline(xintercept = 2008, linetype = 'dotted') +
    labs(x = '', y = 'Number of Permits(per 1000)', title = 'Permits in Missouri') +
    theme_bw() +
    theme(legend.position = 'none')
```

![](Case-Study-11_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

