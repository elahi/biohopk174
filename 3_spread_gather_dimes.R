# Load tidyverse
library(tidyverse)

# Load data (you should fill in missing values in excel, prior to loading data)
d <- read_csv("data/dimes_hms_upc_raw.csv") 
d # Note that there is a true NA for height_rel_m! Have to be careful with this. 
str(d)
glimpse(d)

d_long <- d %>% 
  gather(key = "taxon", value = "count", ANSO:Tar)

# Sort data so that we examine all the taxa for each quadrat sequentially
d_long <- d_long %>% 
  arrange(quad_m)

View(d_long)

# Sort data again, this time to ensure that transects are not mixed up
d_long <- d_long %>% 
  arrange(location, transect_ht, quad_m)
