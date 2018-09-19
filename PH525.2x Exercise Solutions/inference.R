g <- 9.8
n <- 25
tt <- seq(0,3.4,len=n)
d <- 56.67 + 0*tt -0.5*g*tt^2


X <- cbind(1,tt,tt^2)
beta <- solve(crossprod(X)) %*% crossprod(X,y)


set.seed(1)
val <- replicate(100000, {
  y <- d + rnorm(n,sd=1)
  X = cbind(1,tt,tt^2)
  A = solve(crossprod(X))%*%t(X)
  -2*(A%*%y)[3]
})


sqrt(mean((val-mean(val))^2))
