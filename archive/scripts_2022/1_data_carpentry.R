# Working through student questions from data carpentry

# Starting with data

# Note that I change the destination file to match my folder structure
download.file(url = "https://ndownloader.figshare.com/files/2292169",
              destfile = "data/portal_data_joined.csv")

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

surveys$sex <- factor(surveys$sex)

plot(surveys$sex)

genus_counts <- surveys %>% count(genus)

levels(surveys$sex)
nlevels(surveys$sex)

# Factors

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct]    # The recommended way.

# We want this, but extracted as a numeric vector
year_fct

levels(year_fct)
as.numeric(levels(year_fct))
as.numeric(levels(year_fct))[year_fct] 
