x <- 'A'
y <- 5

is.numeric(x)

date1 <- as.Date("2020-03-05")
date2 <- "2020-03-05"
class(date1)
class(date2)

vec1 <- c(2, 3, 5, 8)
vec2 <- c(3, 3, 3, 3)
vec1 + vec2

# vector arithmetic
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
y <- c(x, 0, x)
z <- 2*x + y + 1
z
min(z)
max(z)
range(z)
prod(z)

mean_of_z <- mean(z)
sort(mean_of_z)
class((mean_of_z))

my_array <- c(1:3, NA)
result <- is.na(my_array)
result
vec3_factor <- as.factor(vec3)
class(vec3_factor)
class(vec3)
seq1 <- seq(-100, 100, by = 0.6)
seq1

vec1 <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "HUrling", "Basketball", "Tennis", "Cricket", "Lacrosse")
vec2 <- c("Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")
c(vec1, vec2) 
vec3 <- vec2[c(1,3,6)]
vec3

