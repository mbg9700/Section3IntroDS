# Intro to Data Science - Section 3.1 Data Wrangling Exercise 2
# Submitted by Maya Bhat-Gregerson

library(dplyr)
library(tidyr)

setwd("/Users/mayab/Springboard_IntroToDS/Section3")
titanic_original <- read.csv("titanic_original.csv")
View(titanic_original)

# STEP 1 - CLEAN UP 'EMBARK' - RECODE MISSING VALUES TO 'S'
titanic_original$embarked[titanic_original$embarked==""] <- "S"

# STEP 2 - CLEAN UP 'AGE' - REPLACE MISSING WITH MEAN OF AGE
titanic_original$age[is.na(titanic_original$age)] <- mean(titanic_original$age, na.rm = TRUE)

#STEP 3 - LIFEBOAT - REPLACE MISSING VALUES IN 'BOAT' VARIABLE WITH "NA"
titanic_original$boat <- na_if(titanic_original$boat, "")

#STEP 4 - CABIN - CREATE NEW VARIABLE TO MARK IF PASSENGER HAD CABIN NUMBER
titanic_original <- titanic_original %>% 
  mutate(has_cabin_number = ifelse(cabin!="", 1, 0 ))

write.csv(titanic_original, "titanic_clean.csv")
