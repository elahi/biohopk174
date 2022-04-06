library(tidyverse)
library(openintro)

glimpse(fastfood)

mcdonalds <- fastfood %>%
  filter(restaurant == "Mcdonalds")
dairy_queen <- fastfood %>%
  filter(restaurant == "Dairy Queen")

fastfood %>% 
  ggplot(aes(x = cal_fat)) + 
  geom_histogram() +
  facet_wrap(~ restaurant)

dqmean <- mean(dairy_queen$cal_fat)
dqsd   <- sd(dairy_queen$cal_fat)

ggplot(data = dairy_queen, aes(x = cal_fat)) +
  geom_histogram(aes(y = ..density..)) +
  stat_function(fun = dnorm, args = c(mean = dqmean, sd = dqsd), col = "red")

ggplot(data = dairy_queen, aes(sample = cal_fat)) + 
  stat_qq() + 
  stat_qq_line()

sim_norm <- rnorm(n = nrow(dairy_queen), mean = dqmean, sd = dqsd)

ggplot(mapping = aes(sample = sim_norm)) + 
  stat_qq() + 
  stat_qq_line()


qqnormsim(sample = cal_fat, data = dairy_queen) + 
  stat_qq_line()

qqnormsim(sample = cal_fat, data = mcdonalds) + 
  stat_qq_line()

qqnorm(mcdonalds$cal_fat)
qqline(mcdonalds$cal_fat)


1 - pnorm(q = 600, mean = dqmean, sd = dqsd)

dairy_queen %>% 
  filter(cal_fat > 600) %>%
  summarise(percent = n() / nrow(dairy_queen))

fastfood %>% 
  ggplot(aes(x = sodium)) + 
  geom_histogram() +
  facet_wrap(~ restaurant)

##### Class mussel data ####

# Load data
d <- read_csv("data/mussel_data_2022.csv")
d

ggplot(data = d, aes(sample = length_mm)) + 
  stat_qq() + 
  stat_qq_line()

mu <- mean(d$length_mm)
s <- sd(d$length_mm)

ggplot(data = d, aes(x = length_mm)) +
  geom_histogram(aes(y = ..density..)) +
  stat_function(fun = dnorm, args = c(mean = mu, sd = s), col = "red")

qqnormsim(sample = length_mm, data = d) + 
  stat_qq_line()

## Probability of observing mussels larger than 50mm
# Theoretical
1 - pnorm(q = 50, mean = mu, sd = s)

# Empirical
d %>% 
  filter(length_mm > 50) %>%
  summarise(prob = n() / nrow(d))

## Q 4.1a
pnorm(q = -1.35, mean = 0, sd = 1)

## Q 4.1b
1 - pnorm(q = 1.48, mean = 0, sd = 1)

## Q 4.1c
