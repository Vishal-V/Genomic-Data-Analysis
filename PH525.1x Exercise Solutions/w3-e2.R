babies <- read.table("babies.txt", header = TRUE)
library(dplyr)
library(rafalib)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist
N <- 90
B <- 10000
alpha <- 0.01
reject <- function(N, alpha=0.01){
  dat.s <- sample(bwt.smoke, N)
  dat.ns <- sample(bwt.nonsmoke, N)
  pval <- t.test(dat.s, dat.ns)$p.value  
  pval < alpha
}
val <- vector("logical",B)
for (i in 1:B) {
  val[i] <- reject(N)
}
mean(val)
