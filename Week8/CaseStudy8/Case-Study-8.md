---
title: "Case Study 8"
author: "Haleigh Borich"
date: "10/26/2021"
output:  
   html_document:
    theme: united
    keep_md: True
    code_folding: 'hide'
---


```r
library(qdapRegex)
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
## x ggplot2::%+%()   masks qdapRegex::%+%()
## x dplyr::explain() masks qdapRegex::explain()
## x dplyr::filter()  masks stats::filter()
## x dplyr::lag()     masks stats::lag()
```

```r
library(downloader)
library(readr)
library(stringi)
```


```r
bob1 <- tempfile()
download("https://raw.githubusercontent.com/WJC-Data-Science/DTS350/master/bible.csv", bob1, mode = "wb")
ScriptData <- read_csv(bob1)
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
head(ScriptData)
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
bob2 <- tempfile()
download("https://raw.githubusercontent.com/WJC-Data-Science/DTS350/master/Names.csv", bob2, mode = "wb")
NameData <- read_csv(bob2)
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   X1 = col_double(),
##   name = col_character(),
##   nchar = col_double(),
##   words = col_double()
## )
```

```r
head(NameData)
```

```
## # A tibble: 6 x 4
##      X1 name                                                         nchar words
##   <dbl> <chr>                                                        <dbl> <dbl>
## 1     1 the Father of the heavens and of the earth, and all things …    75    16
## 2     2 Creator of all things from the beginning                        40     7
## 3     3 Jesus Christ, the Son of the living God                         39     8
## 4     4 the Lord Jesus Christ, their Redeemer                           37     6
## 5     5 God of Abraham, and Isaac, and Jacob                            36     7
## 6     6 Eternal Father of heaven and earth                              34     6
```


```r
OldTest <- ScriptData %>%
  filter(volume_long_title == "The Old Testament") %>%
  select(scripture_text) %>%
  str_c()
```

```
## Warning in stri_c(..., sep = sep, collapse = collapse, ignore_null = TRUE):
## argument is not an atomic vector; coercing
```


```r
NewTest <- ScriptData %>%
  filter(volume_long_title == "The New Testament") %>%
  select(scripture_text) %>%
  str_c()
```

```
## Warning in stri_c(..., sep = sep, collapse = collapse, ignore_null = TRUE):
## argument is not an atomic vector; coercing
```


```r
Savior_Name <- NameData %>%
  select(name)
head(Savior_Name) 
```

```
## # A tibble: 6 x 1
##   name                                                                       
##   <chr>                                                                      
## 1 the Father of the heavens and of the earth, and all things that in them are
## 2 Creator of all things from the beginning                                   
## 3 Jesus Christ, the Son of the living God                                    
## 4 the Lord Jesus Christ, their Redeemer                                      
## 5 God of Abraham, and Isaac, and Jacob                                       
## 6 Eternal Father of heaven and earth
```


```r
str_detect(OldTest, "abcxyz")
```

```
## [1] FALSE
```

```r
str_detect(NewTest, "abcxyz")
```

```
## [1] FALSE
```


```r
Savior_Ref <- function(df) {
  count <- vector("integer", ncol(Savior_Name))
  for (name in Savior_Name) {
    count <- count + str_length(str_extract_all(df, name))
  }
  sum(count)
}
```


```r
Savior_Ref(OldTest)
```

```
## Warning in stri_length(string): argument is not an atomic vector; coercing
```

```
## [1] 33187
```
33,187

```r
Savior_Ref(NewTest)
```

```
## Warning in stri_length(string): argument is not an atomic vector; coercing
```

```
## [1] 44280
```
44,280

```r
Between_Words <- function(df, test) {
  for (names in Savior_Name$name) {
    Replace <- str_replace_all(df, names, "abcxyz")
  }
  Split_Words <- str_split(Replace, "abcxyz")
  Split_Words_N <- str_remove_all(Split_Words, "\n")
  if (test == "mean") {
    stri_stats_latex(unlist(Split_Words_N))[[4]]/length(unlist(Split_Words))
  } else {
    stri_stats_latex(unlist(Split_Words_N)) [[4]]
  }
}
```


```r
Between_Words(OldTest, "between")
```

```
## Warning in stri_replace_all_regex(string, pattern,
## fix_replacement(replacement), : argument is not an atomic vector; coercing
```

```
## [1] 611503
```
611,503

```r
Between_Words(NewTest, "between")
```

```
## Warning in stri_replace_all_regex(string, pattern,
## fix_replacement(replacement), : argument is not an atomic vector; coercing
```

```
## [1] 180662
```
180,662

```r
Between_Words(OldTest, "mean")
```

```
## Warning in stri_replace_all_regex(string, pattern,
## fix_replacement(replacement), : argument is not an atomic vector; coercing
```

```
## [1] 3135.913
```
3,135.913

```r
Between_Words(NewTest, "mean")
```

```
## Warning in stri_replace_all_regex(string, pattern,
## fix_replacement(replacement), : argument is not an atomic vector; coercing
```

```
## [1] 12044.13
```
12,044.13

After doing extensive research, I was able to figure out that the New Testament has more references to a Savior name than the Old Testament does. The New Testament has a total of 44,280 references throughout the book while the Old Testament has a total of 33,187 mentioned of Savior references. 
Later on, I was able to find out that the Old Testament and the New Testament have varying lengths. I was able to conclude that from finding the average of length between each savior reference. The Old Testament has, on an average, 3,135 words in between each Savior reference, while the New Testament has, on an average, 12,044.13
