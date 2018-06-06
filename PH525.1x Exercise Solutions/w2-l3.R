library(dplyr)
library(rafalib)
data <- read.csv("femaleMiceWeights.csv")
set.seed(1)
n <- 30
p <- 0.5
q <- 1-p
prob <- vector("numeric", 10000)
for(i in 1:10000){
  x <- sample(1:6, n, replace=TRUE)
  prob[i] <- mean(x == 6)
}
z <- vector("numeric", 10000)
for(i in 1:10000){
  z[i] <- abs((mean(prob[i])-p)/sqrt(p*q/n)) 
}
qqnorm(z)
qqline(z)

X <- filter(data, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(data, Diet=="hf") %>% select(Bodyweight) %>% unlist
se <- sqrt((var(Y)/12)+(var(X)/12))
tstat <- (mean(Y)-mean(X))/se
rtail <- 1-pnorm(abs(tstat))
ltail <- pnorm(-abs(tstat))
pval <- rtail + ltail
t.test(Y,X)
1-(2/sd(X))
