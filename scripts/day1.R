
weight_kg <- 55
weight_kg

2.2 * weight_kg
Weight_kg


weight_lb <- 2.2 * weight_kg
weight_lb

weight_kg <- 100

weight_lb


sqrt(25)

b <- 25
a <- sqrt(b)

round(3.14159)
?round

round(3.14159, digits = 2)

weight_g <- c(50, 60, 545, 82)
weight_g

ls()

# rm(weight_g)
# rm(list = ls())

animals <- c("mouse", "rat", "dog")
animals

length(weight_g)
length(animals)

class(weight_g)
class(animals)

str(weight_g)
str(animals)

weight_g <- c(weight_g, 510)
weight_g

weight_g <- c(12, weight_g)
weight_g

### Challenge 2

## We’ve seen that atomic vectors can be of type character, 
## numeric (or double), integer, and logical. 
## But what happens if we try to mix these types in a single vector?

## What will happen in each of these examples? (hint:(use class() to check the data type)
## Why do you think it happens?
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

## How many values in combined_logical are "TRUE" as a character in the following example?
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)

## You’ve probably noticed that objects of different types get converted into a single, shared type within a vector. In R, we call converting objects from one class into another class coercion. These conversions happen according to a hierarchy, whereby some types get preferentially coerced into other types. 

## Can you draw a diagram that represents the hierarchy of how these data types are coerced?
  

