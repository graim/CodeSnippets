## Create a fake data frame
x <- LETTERS[1:15]
y <- letters[1:15]
dat <- expand.grid(X=x,Y=y)
dat$Z <- runif(length(x)*length(y), 0, 1)

## Rotate x-axis labels
library(ggplot2)
ggplot(dat, aes(X, Y, fill= Z)) + geom_tile() + 
  scale_fill_gradient(low="white", high="steelblue") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

## Multiple color gradient (fill/color)
ggplot(dat, aes(X, Y, fill= Z)) + geom_tile() + 
  scale_fill_gradientn(colors=c("grey90","white","maroon"))

## Increase all font sizes in the plot
ggplot(dat, aes(X, Y, fill= Z)) + geom_tile() + theme(text = element_text(size = 20))


## Remove A-Z from all strings (A-Z or some pattern to replace)
dat.names <- paste0(sample(1:20, 10), sample(LETTERS, 10)) # sample output:  [1] "7M"  "16P" "12J" "8V"  "14L" "19D" "15E" "6Z"  "18B" "13Q"
stringr::str_replace(dat.names, '[A-Z]', '') # results:  [1] "7"  "16" "12" "8"  "14" "19" "15" "6"  "18" "13"

## Order a data frame by multiple columns
## From: https://stackoverflow.com/questions/1296646/how-to-sort-a-dataframe-by-multiple-columns
dd <- data.frame(b = factor(c("Hi", "Med", "Hi", "Low"), 
      levels = c("Low", "Med", "Hi"), ordered = TRUE),
      x = c("A", "D", "A", "C"), y = c(8, 3, 9, 9),
      z = c(1, 1, 1, 2))
dd <- dd[with(dd, order(-z, b)), ]


