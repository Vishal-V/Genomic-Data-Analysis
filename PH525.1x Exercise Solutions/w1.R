library(gapminder)
data(gapminder)
names(gapminder)
x <- gapminder$lifeExp
mean(x <= 40)
year <- filter(gapminder, year==1952) %>% select(lifeExp) %>% unlist
y <- gapminder$year
plot(ecdf(x))
qs = seq(from = min(y), to=max(y), length=20)
props = sapply(qs, function(q) mean(y <= q))
plot(props)
