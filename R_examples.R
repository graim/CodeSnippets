## Create a fake data frame
x <- LETTERS[1:15]
y <- letters[1:15]
dat <- expand.grid(X=x,Y=y)
dat$Z <- runif(length(x)*length(y), 0, 1)


## Rotate x-axis labels
library(ggplot2)
ggplot(dat, aes(X, Y, fill= Z)) + 
  geom_tile() + scale_fill_gradient(low="white", high="steelblue") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
