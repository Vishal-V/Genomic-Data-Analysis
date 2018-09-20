library(dplyr)
library(UsingR)
data("father.son", package = "UsingR")
x = father.son$sheight
y = round(father.son$fheight,0)

son71 <- filter(father.son ,y == 71) %>% select(sheight) %>% unlist
mean(son71)

X = matrix(c(3,4,-5,1,2,2,2,-1,1,-1,5,-5,5,0,0,1),4,4, byrow = TRUE)
Y = matrix(c(10,5,7,4),4,1)
solve(X)%*%Y

a <- matrix(1:12, nrow=4)
b <- matrix(1:15, nrow=3)
c <- a%*%b
c[3,2]

d <- a[3,] * b[,2]
sum(d)
