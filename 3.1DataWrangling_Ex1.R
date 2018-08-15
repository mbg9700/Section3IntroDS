# Section 3.1 - Data Wrangling Exercise 1
# Maya Bhat-Gregerson

library(dplyr)
library(tidyr)

setwd("/Users/mayab/Springboard_IntroToDS/Section3")
refine_original <- read.csv("refine_original.csv")


#STEP 1- CLEAN UP BRAND NAMES
refine_original <- refine_original %>% 
  mutate(company = tolower(company)) %>% 
  arrange(company) 

refine_original$company <- as.character(refine_original$company)

refine_original$company[1:7] <- "akzo"
refine_original$company[8:16] <- "philips"
refine_original$company[17:20] <- "unilever"
refine_original$company <- as.factor(refine_original$company)

refine_original<- refine_original %>%
  #STEP 2-SEPARATE PRODUCT CODE AND NUMBER
  separate(Product.code...number, c("product_code", "product_number"), sep = "-") %>%
  #STEP 3-ADD PRODUCT CATEGORIES
  mutate(product_category = ifelse (test = (product_code == "p"), 
                                    yes = "Smartphone", 
                                    no = ifelse(test = (product_code == "v"),
                                                yes = "TV",
                                                no = ifelse(test = (product_code=="x"),
                                                            yes = "Laptop",
                                                            no = ifelse(test = (product_code=="q"),
                                                                        yes = "Tablet",
                                                                        no = NA))))) %>%
  #STEP 4-ADD FULL ADDRESS FOR GEOCODING
  unite("full_address", "address", "city", "country", sep = ",") %>%
  #STEP 5-CREATE DUMMY VARIABLES FOR COMPANY AND CATEGORY
  mutate(company_akzo = ifelse(company=="akzo", 1, 0)) %>% 
  mutate(company_philips = ifelse (company=="philips", 1, 0)) %>% 
  mutate(company_van_houten = ifelse(company=="van houten", 1, 0)) %>% 
  mutate(company_unilever = ifelse(company=="unilever", 1, 0)) %>% 
  mutate(product_smartphone = ifelse(product_code=="p", 1, 0)) %>% 
  mutate(product_tv = ifelse(product_code=="v", 1, 0)) %>% 
  mutate(product_laptop = ifelse(product_code=="x", 1, 0)) %>% 
  mutate(product_table = ifelse(product_code=="q", 1, 0))

write.csv(refine_original, "refine_clean.csv") 
  
 
                                   
                                   
                                   
                                   
                        



