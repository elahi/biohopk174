library(tidyverse)

dat <- read.csv("https://raw.githubusercontent.com/elahi/xdp/master/data/class_data_mussels.csv")

x <- dat$size_mm

xbar <- mean(x)
s <- sd(x)

sd_u <- xbar + s
sd_l <- xbar - s

ggplot(data = dat, 
       mapping = aes(x = "a", y = size_mm)) +
  geom_jitter(width = 0.05, alpha = 0.5, color = "#ff0b55")

dat %>%
  ggplot(aes("a", size_mm)) +
  geom_jitter(width = 0.05, alpha = 0.5, color = "#085f63") +
  geom_boxplot(aes("b", size_mm), fill = "#ffd98e", color = "#d65a31") +
  geom_point(aes(x = "c", y = xbar), color = "#616f39") +
  geom_errorbar(aes(x = "c", ymin = sd_l, ymax = sd_u),
                width = 0.1, size = 0.25, color = "#616f39") +
  labs(x = "", y = "Size (mm)") +
  ggtitle("Displaying uncertainty")

?geom_errorbar

ggsave(file = "figs/displaying_uncertainty.png", 
       height = 4, width = 7, units = "in")


