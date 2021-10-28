---
title: "Task 15"
author: "Haleigh Borich"
date: "10/21/2021"
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
library(downloader)
library(readr)
```



```r
bob <- tempfile()
download("https://raw.githubusercontent.com/WJC-Data-Science/DTS350/master/bible.csv", bob, mode = "wb")
Data1 <- read_csv(bob)
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   volume_id = col_double(),
##   book_id = col_double(),
##   chapter_id = col_double(),
##   verse_id = col_double(),
##   volume_title = col_character(),
##   book_title = col_character(),
##   volume_long_title = col_character(),
##   book_long_title = col_character(),
##   volume_subtitle = col_logical(),
##   book_subtitle = col_logical(),
##   volume_short_title = col_character(),
##   book_short_title = col_character(),
##   chapter_number = col_double(),
##   verse_number = col_double(),
##   scripture_text = col_character(),
##   verse_title = col_character(),
##   verse_short_title = col_character()
## )
```

```r
head(Data1)
```

```
## # A tibble: 6 x 17
##   volume_id book_id chapter_id verse_id volume_title book_title volume_long_tit…
##       <dbl>   <dbl>      <dbl>    <dbl> <chr>        <chr>      <chr>           
## 1         1       1          1        1 Old Testame… Genesis    The Old Testame…
## 2         1       1          1        2 Old Testame… Genesis    The Old Testame…
## 3         1       1          1        3 Old Testame… Genesis    The Old Testame…
## 4         1       1          1        4 Old Testame… Genesis    The Old Testame…
## 5         1       1          1        5 Old Testame… Genesis    The Old Testame…
## 6         1       1          1        6 Old Testame… Genesis    The Old Testame…
## # … with 10 more variables: book_long_title <chr>, volume_subtitle <lgl>,
## #   book_subtitle <lgl>, volume_short_title <chr>, book_short_title <chr>,
## #   chapter_number <dbl>, verse_number <dbl>, scripture_text <chr>,
## #   verse_title <chr>, verse_short_title <chr>
```

```r
str(Data1)
```

```
## tibble [31,102 × 17] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ volume_id         : num [1:31102] 1 1 1 1 1 1 1 1 1 1 ...
##  $ book_id           : num [1:31102] 1 1 1 1 1 1 1 1 1 1 ...
##  $ chapter_id        : num [1:31102] 1 1 1 1 1 1 1 1 1 1 ...
##  $ verse_id          : num [1:31102] 1 2 3 4 5 6 7 8 9 10 ...
##  $ volume_title      : chr [1:31102] "Old Testament" "Old Testament" "Old Testament" "Old Testament" ...
##  $ book_title        : chr [1:31102] "Genesis" "Genesis" "Genesis" "Genesis" ...
##  $ volume_long_title : chr [1:31102] "The Old Testament" "The Old Testament" "The Old Testament" "The Old Testament" ...
##  $ book_long_title   : chr [1:31102] "The First Book of Moses called Genesis" "The First Book of Moses called Genesis" "The First Book of Moses called Genesis" "The First Book of Moses called Genesis" ...
##  $ volume_subtitle   : logi [1:31102] NA NA NA NA NA NA ...
##  $ book_subtitle     : logi [1:31102] NA NA NA NA NA NA ...
##  $ volume_short_title: chr [1:31102] "OT" "OT" "OT" "OT" ...
##  $ book_short_title  : chr [1:31102] "Gen." "Gen." "Gen." "Gen." ...
##  $ chapter_number    : num [1:31102] 1 1 1 1 1 1 1 1 1 1 ...
##  $ verse_number      : num [1:31102] 1 2 3 4 5 6 7 8 9 10 ...
##  $ scripture_text    : chr [1:31102] "IN the beginning God created the heaven and the earth." "And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God mov"| __truncated__ "And God said, Let there be light: and there was light." "And God saw the light, that it was good: and God divided the light from the darkness." ...
##  $ verse_title       : chr [1:31102] "Genesis 1:1" "Genesis 1:2" "Genesis 1:3" "Genesis 1:4" ...
##  $ verse_short_title : chr [1:31102] "Gen. 1:1" "Gen. 1:2" "Gen. 1:3" "Gen. 1:4" ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   volume_id = col_double(),
##   ..   book_id = col_double(),
##   ..   chapter_id = col_double(),
##   ..   verse_id = col_double(),
##   ..   volume_title = col_character(),
##   ..   book_title = col_character(),
##   ..   volume_long_title = col_character(),
##   ..   book_long_title = col_character(),
##   ..   volume_subtitle = col_logical(),
##   ..   book_subtitle = col_logical(),
##   ..   volume_short_title = col_character(),
##   ..   book_short_title = col_character(),
##   ..   chapter_number = col_double(),
##   ..   verse_number = col_double(),
##   ..   scripture_text = col_character(),
##   ..   verse_title = col_character(),
##   ..   verse_short_title = col_character()
##   .. )
```


```r
OldTest <- Data1 %>%
  filter(volume_long_title == "The Old Testament") %>%
  select(scripture_text)
head(OldTest)
```

```
## # A tibble: 6 x 1
##   scripture_text                                                                
##   <chr>                                                                         
## 1 IN the beginning God created the heaven and the earth.                        
## 2 And the earth was without form, and void; and darkness was upon the face of t…
## 3 And God said, Let there be light: and there was light.                        
## 4 And God saw the light, that it was good: and God divided the light from the d…
## 5 And God called the light Day, and the darkness he called Night. And the eveni…
## 6 And God said, Let there be a firmament in the midst of the waters, and let it…
```

```r
NewTest <- Data1 %>%
  filter(volume_long_title == "The New Testament") %>%
  select(scripture_text)
head(NewTest)
```

```
## # A tibble: 6 x 1
##   scripture_text                                                                
##   <chr>                                                                         
## 1 THE book of the generation of Jesus Christ, the son of David, the son of Abra…
## 2 Abraham begat Isaac; and Isaac begat Jacob; and Jacob begat Judas and his bre…
## 3 And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom …
## 4 And Aram begat Aminadab; and Aminadab begat Naasson; and Naasson begat Salmon;
## 5 And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat …
## 6 And Jesse begat David the king; and David the king begat Solomon of her that …
```


```r
verse_length <- function(df) {
  vlength <- vector("integer", 0)
  for(row in df) {
    vlength <- append(vlength, str_length(row))
  }
  vlength
}
```


```r
mean(verse_length(OldTest))
```

```
## [1] 136.7845
```

```r
mean(verse_length(NewTest))
```

```
## [1] 118.3265
```


```r
str_length(str_extract_all(OldTest, "(?i)lord"))
```

```
## Warning in stri_extract_all_regex(string, pattern, simplify = simplify, :
## argument is not an atomic vector; coercing
```

```
## Warning in stri_length(string): argument is not an atomic vector; coercing
```

```
## [1] 58300
```

```r
str_length(str_extract_all(NewTest, "(?i)lord"))
```

```
## Warning in stri_extract_all_regex(string, pattern, simplify = simplify, :
## argument is not an atomic vector; coercing

## Warning in stri_extract_all_regex(string, pattern, simplify = simplify, :
## argument is not an atomic vector; coercing
```

```
## [1] 5900
```


```r
as.data.frame(verse_length(NewTest)) %>%
  ggplot(aes(x = verse_length(NewTest))) +
  geom_histogram(color = "black", fill = "grey") +
  theme_bw() +
  labs(x = "Verse Length in New Testament",
       y = "Count of words",
       title = "Word Count Distribution by Verse in New Testament")
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Task15_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

The average ver length in the Old Testament compared to the New Testament is fairly similar. The Old Testament has a larger average with 136 words in each verse while the New Testament has an average of 118 words in each verse. While looking at how often the word LORD is used in the Old Testament and New Testament, we get very different answers. The Old Testament was 58,300 mentions of LORD while The New Testament has 5,900 mentions of the LORD. As you can see, the New Testament does not have nearly as many mentions of the LORD. I believe this is because throughout the New Testament, there were other names instead of LORD used to describe Christ.

In the histogram I made, you can see that the verses that are around the length of 120 - 130 words per verse happen the most in the New Testament. Verses that have less than 50 words and over 200 words don't occur frequently. Majority of the verses fall in the 70 through the 170 mark.
