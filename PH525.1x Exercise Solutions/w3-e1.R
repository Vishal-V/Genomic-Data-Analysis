babies <- read.table("babies.txt", header=TRUE)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist
library(rafalib)
mean(bwt.nonsmoke) - mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)
set.seed(1)
dat.ns <- sample(bwt.nonsmoke, 5)
dat.s <- sample(bwt.smoke, 5)
t.test(dat.ns, dat.s)
Q <- qt(1-0.05/2, df=48)
Q

qt(0.995, df=48)*sqrt( sd( dat.ns)^2/25 + sd( dat.s)^2/25 )








tval <- t$statistic
rtail <- 1-pnorm(tval)
ltail <- pnorm(-tval)
rtail+ltail
length(babies$bwt)
popmean <- mean(dat.s)-mean(dat.ns)
se <- sqrt((var(dat.s)/len)+(var(dat.ns)/len))
z <- abs(popmean/se)
3*se
