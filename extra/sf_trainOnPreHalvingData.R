# import data
sfDat <- read.csv('sf.csv')

#before first halving, ln SF is non stationary
#sfDat <- sfDat[11:48, ]

#this removes outliers, 4 of them
#sfDat <- sfDat[c(11:17, 19:29, 33:48), ]

#all data
sfDat <- sfDat[11:nrow(sfDat), ]


#change market value to numeric
sfDat$market.value <- as.numeric(gsub('\\$|,', '', sfDat$market.value))


#third model is both ln values
mod3 <- lm(ln.value. ~ ln.SF., data = sfDat) # change to use only training data
summary(mod3)

#Does the plot
plot(sfDat$ln.SF., sfDat$ln.value.)
#Adds the line
abline(lm(sfDat$ln.value.~sfDat$ln.SF.), col="red")
abline(14.16, 3.508, col="green") #line of all data
abline(13.91, 3.8, col="blue") #line of pre halving data (without 4 outliers, one was early inserted missing data)
abline(14.05, 3.9, col="pink") #line of pre halving data

#shows r^2
legend("bottomright", bty="n", legend=paste("R2 is", format(summary(mod3)$adj.r.squared, digits=4)))
