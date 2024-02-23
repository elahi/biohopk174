# Load tidyverse
library(tidyverse)

# Make an R project: biohopk174, with appropriate folder structure and files

# Load data
d <- read_csv("data/mussel_data_2022.csv")

d

str(d)

glimpse(d)

summary(d)

# Summarise data
mean(d$length_mm)
sd(d$length_mm)
median(d$length_mm)

d %>% 
  summarise(mean = mean(length_mm), 
            sd = sd(length_mm), 
            median = median(length_mm))

# Summarise by group
d %>% 
  group_by(name) %>% 
  summarise(mean = mean(length_mm), 
            sd = sd(length_mm), 
            median = median(length_mm))

# Histogram
d %>% 
  ggplot(aes(x = length_mm)) + 
  geom_histogram(binwidth = 10) # change the bin width, see what happens!

# Boxplot
d %>% 
  ggplot(aes(y = length_mm)) + 
  geom_boxplot()

# Boxplot by group
d %>% 
  ggplot(aes(name, length_mm)) + 
  geom_boxplot()

# Scatterplot
d %>% 
  ggplot(aes(length_mm, width_mm)) + 
  geom_point()

# Scatterplot, by group
d %>% 
  ggplot(aes(length_mm, width_mm, color = name)) + 
  geom_point() 

