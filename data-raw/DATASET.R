## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(here)
library(readr)
library(tsibble)
lkrer <- read_csv("data-raw/data.csv")
View(lkrer)
lkrer$Date <- as.Date(lkrer$Date)
colnames(lkrer) <- c("Currency",
                     "Date",
                     "Exchnge.Rate")
lkrer <- as_tsibble(lkrer,
                    index=Date,
                    key=Currency)
usethis::use_data(lkrer, overwrite = TRUE)
