data <- read.csv("femaleControlsPopulation.csv")
set.seed(1)
length(weight)
weight <- data$Bodyweight
popmean <- mean(weight)
n <- 10000
null <- vector("numeric",n)
for (i in 1:n) {
  null[i] = mean(sample(weight, 50))
}
num <- 1000
nulled <- vector("numeric", num)
for (i in 1:n) {
  nulled[i] = mean(sample(weight, 5))
}

mean(null <= 25)-mean(null <= 23)
hist(null)
pnorm(25, 23.9,0.43*2)-pnorm(23,23.9,0.43*2)
mean(null - popmean)
