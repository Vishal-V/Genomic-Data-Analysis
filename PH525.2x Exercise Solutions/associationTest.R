load("skew.RData")
dim(dat)
par(mfrow=c(1,1))
for(i in 1:9){
  x <- dat[,i]
  qqnorm(x)
  qqline(x)
}