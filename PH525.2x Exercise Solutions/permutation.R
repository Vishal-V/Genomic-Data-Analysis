library(dplyr)
babies <- read.table("babies.txt", header = TRUE)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

N=10
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke,N)
smokers <- sample(bwt.smoke,N)
obs <- median(smokers) - median(nonsmokers)
dat <- c(smokers,nonsmokers)

null <- replicate(1000, {
  shuffle <- sample(dat)
  nonsmokers1 <- shuffle[1:N]
  smokers1 <- shuffle[(N+1):(2*N)]
  median(smokers1) - median(nonsmokers1)
})

sum(abs(null) >= abs(obs))/length(null)