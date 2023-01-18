#  This is from github
print("Hello From Github")

#### "CONTROL STRUCTURES IN R"

## if and else structure
x <- 4
y <- 0
if(x > 3) {
  y <- 10
} else{
  y <- 0
}


y <-  if(x > 3) {
  10
} else {
  0
} 

## for loop takes an iterator variable

for(i in 1:10) {
  print(i)
}

x <- c("a","b","c","d")

for(i in 1:4) {
  print(x[i])
} ## this loop and next three loop have same behavior

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])

## Nested for loop

x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  } 
}

## While loop it results in infinite loop if not written properly

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

## while loop more than one condition

z <- 5
while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1) {
    z <- z + 1
  } else {
    z <- z - 1
  }
} 

### "FUNCTIONS IN R"

f <- function(a, b = 1, c = 2, d = NULL) {
  
}

##LAZY EVALUATION(function)

f <- function(a,b) 
{
  a^2
}
f(2)

f <- function(a, b) {
  print(a)
  print(b)
}

f(45)
f(45,65)


 ### "VECTORIZED OPERATIONS"

x <- 1:3; y <- 6:8
x + y
x > 2
x >= 2
y == 8
x * y
x / y

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x * y # element wise multiplication
x / y

x %*% y  # true matrix multiplication

### "DATES AND TIMES IN R"

as.Date("1970-01-01")
as.POSIXct("1970-01-01")
as.POSIXlt("1970-01-01")

x <- Sys.time()
x
p <- as.POSIXlt(x)
p
names(unclass(p))
p$sec
p$mon
p$wday

datestring <- c("january 10, 2012 10:40:20", "December 9, 2011 10:35:30")
x <- strptime(datestring, "%B %d, %Y %H:%M:%S") # strptime function
x
class(x)

x <- as.Date("2012-01-02")
y <- strptime("9 jan 2011 11:34:30", "%d %b %Y %H:%M:%S" )
x - y
class(x)
class(y)
x <- as.POSIXlt(x)
x - y

### "LOOP FUNCTIONS"

## lapply
x <- list(a= 1:4, b = rnorm(10), c = rnorm(20 , 1), d = rnorm(100 , 5))
lapply(x, mean)
x <- 1:4
lapply(x, runif)

lapply(x, runif, min= 0, max= 10)

## sapply
x <- list(a= 1:4, b = rnorm(10), c = rnorm(20 , 1), d = rnorm(100 , 5))
sapply(x, mean)

## apply
x <- matrix(rnorm(200),20,10)
apply(x,2,mean)
apply(x,1,sum)
apply(x,1, quantile, probs= c(0.25, 0.75))

## tapply

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)
f
tapply(x,f,mean)
tapply(x,f,mean, simplify=FALSE)
tapply(x,f,range)

### "DATA SPLIT"

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)
split(x,f)
lapply(split(x,f),mean)

## splitting a "airquality" data frame
library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[ "Ozone", "Solar.R", "Wind"]))
sapply(s, function(x) colMeans(x[ "Ozone", "Solar.R", "Wind"]))
sapply(s, function(x) colMeans(x[ "Ozone", "Solar.R", "Wind"],na.rm=TRUE))

    ### This is almost all about codes used for data science in R"
