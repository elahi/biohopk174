# Load tidyverse
library(tidyverse)

d <- data.frame(x = c(70, 97, 60, 86, 89, 115, 99, 77, 108, 73))
d

# Get sample size and mean
d <- d %>%
  mutate(n = n(), 
         mean = mean(x))

d

# Get deviation
d <- d %>% 
  mutate(deviation = x - mean)

d

# What if you sum all the deviations?
sum(d$deviation)

# Get squared deviation
d <- d %>% 
  mutate(dev_sq = deviation^2)

d

## Sum of squares (squared deviations)
sum(d$dev_sq)

# Calculate sample variance and sd
d <- d %>% 
  mutate(ss = round(sum(dev_sq), 1), 
         x_var = round(ss / (n - 1)), 
         x_sd = round(sqrt(x_var), 1))

d

mean(d$x); var(d$x); sd(d$x)

## Simulate data
set.seed(101)
dat <- rnorm(n = 1000, mean = 80, sd = 30)
dat <- round(dat)

## Calculate mean, sd, and create vectors of 1 and 2 sds away from the mean
mu <- mean(dat)
s <- sd(dat)
s1 <- c(mu + s, mu - s)
s2 <- c(mu + 2*s, mu - 2*s)

## Plot histogram and vertical lines
hist(dat, breaks = 30, 
     xlab = "Mussel size (mm)", main = "Histogram", 
     col = "gray", border = "white")
abline(v = mu, col = "black", lwd = 2)
abline(v = s1, col = "red", lwd = 1.5)
abline(v = s2, col = "red", lwd = 1.5, lty = 2)

