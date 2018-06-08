data <- read.csv("mice_pheno.csv")
data <- na.omit(data)
library(dplyr)
library(rafalib)
controlpop <- filter(data,Diet=="chow") %>% select(Bodyweight) %>% unlist
mean <- mean(controlpop)
sd <- sd(controlpop)
set.seed(1)
generate <- function(N,mean,sd){
  sample1 <- rnorm(N,mean,sd)
  sqrt(5)*mean(sample1)/sd(sample1)
  
}
generate(5,mean,sd)

