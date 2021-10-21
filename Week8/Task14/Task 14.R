library(tidyverse)
library(readr)

RandomLetters <- read_lines("https://github.com/WJC-Data-Science/DTS350/raw/master/randomletters.txt")
RandomLetter_Num <- read_lines("https://raw.githubusercontent.com/WJC-Data-Science/DTS350/master/randomletters_wnumbers.txt")

RandomLetter_Num

newlist <- c(str_sub(RandomLetters, start = 1, end = 1))
for (i in seq(0, str_length(RandomLetters)/1700)) {
  newlist <- str_c(newlist, str_sub(RandomLetters, start = i*1700, end = i*1700))
}
newlist  

hidden <- unlist(str_extract_all(RandomLetter_Num, ("(\\d)+")))
decoded <- c()

for (i in seq(1,length(hidden))) {
  decoded <- append(decoded,letters[as.integer(hidden[i])])
}
decoded <- paste(decoded,collapse = " ")
decoded

str_extract_all(RandomLetters, "(.)(.)(.)(.)\\4\\3\\2\\1")

count <- c("0")

No_Spaces_Periods <- RandomLetters %>%
  str_remove_all(" ") %>%
  str_remove_all("\\.")

vowels <- unlist(str_extract_all(No_Spaces_Periods,"([aeiou])+"))

for (i in seq(1,length(vowels))) {
  if (str_length(vowels[i]) > str_length(count[length(count)])) {
    count <- vowels[i]
  }
}
count


