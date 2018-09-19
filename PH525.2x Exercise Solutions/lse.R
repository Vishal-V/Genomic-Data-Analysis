library(UsingR)
x = father.son$fheight
y = father.son$sheight
n = length(y)

N =  50
B = 10000

set.seed(1)


#val <- replicate(B, {
  index = sample(n,N)
  sampledat = father.son[index,]
  x = sampledat$fheight
  y = sampledat$sheight
  lm(y~x)$coef[2]
#})

fit = lm(y ~ x)

r <- (y-fit$fitted.values)^2
sigma2 <- sum(r)/48

X <- cbind(1,x)
mat <- solve(crossprod(X))
sqrt(sigma2 * diag(mat))

