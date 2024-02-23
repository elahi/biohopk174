# Load tidyverse
library(tidyverse)
library(openintro)
library(infer)

## Getting started
global_monitor <- tibble(
  scientist_work = c(rep("Benefits", 80000), rep("Doesn't benefit", 20000)))

ggplot(global_monitor, aes(x = scientist_work)) +
  geom_bar() +
  labs(x = "", y = "",
       title = "Do you believe that the work scientists do benefit people like you?") +
  coord_flip() 

global_monitor %>%
  count(scientist_work) %>%
  mutate(p = n /sum(n))

## The unknown sampling distribution
samp1 <- global_monitor %>%
  sample_n(50)

samp1 %>%
  count(scientist_work) %>%
  mutate(p_hat = n /sum(n))

samp1_p_hat <- samp1 %>% 
  count(scientist_work) %>% 
  mutate(p_hat = n /sum(n)) %>% 
  filter(scientist_work == "Doesn't benefit") %>% 
  pull(p_hat) %>% 
  round(2)

sample_props50 <- global_monitor %>%
  rep_sample_n(size = 50, reps = 15000, replace = TRUE) %>%
  count(scientist_work) %>%
  mutate(p_hat = n /sum(n)) %>%
  filter(scientist_work == "Doesn't benefit")

ggplot(data = sample_props50, aes(x = p_hat)) +
  geom_histogram(binwidth = 0.02, fill = "gray", color = "black") +
  labs(x = "p_hat (Doesn't benefit)",
       title = "Sampling distribution of p_hat",
       subtitle = "Sample size = 50, Number of samples = 15000")

## Sampling distributions
global_monitor %>%
  sample_n(size = 50, replace = TRUE) %>%
  count(scientist_work) %>%
  mutate(p_hat = n /sum(n)) %>%
  filter(scientist_work == "Doesn't benefit")


## Sample size and the sampling distribution
ggplot(data = sample_props50, aes(x = p_hat)) +
  geom_histogram(binwidth = 0.02)

## More practice

## Q7
global_monitor %>%
  sample_n(size = 15, replace = TRUE) %>%
  count(scientist_work) %>%
  mutate(p_hat = n /sum(n)) 

## Q8
sample_props15 <- global_monitor %>%
  rep_sample_n(size = 15, reps = 2000, replace = TRUE) %>%
  count(scientist_work) %>%
  mutate(p_hat = n /sum(n)) %>%
  filter(scientist_work == "Benefits") %>%
  ungroup()

sample_props15

ggplot(data = sample_props15, aes(x = p_hat)) +
  geom_histogram(binwidth = 0.02) 

mean(sample_props15$p_hat)
sd(sample_props15$p_hat)

## Q9
sample_props150 <- global_monitor %>%
  rep_sample_n(size = 150, reps = 2000, replace = TRUE) %>%
  count(scientist_work) %>%
  mutate(p_hat = n /sum(n)) %>%
  filter(scientist_work == "Benefits") %>%
  ungroup()

ggplot(data = sample_props150, aes(x = p_hat)) +
  geom_histogram(binwidth = 0.05) 

mean(sample_props150$p_hat)
sd(sample_props150$p_hat)

## Q10
# 

