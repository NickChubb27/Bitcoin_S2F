# import data
sfDat <- read.csv('sf.csv')

#remove first 11 blank columns
sfDat <- sfDat[11:nrow(sfDat), ]

#before first halving
#sfDat <- sfDat[20:48, ]
#plan to use this ^ as a training segment later

#change market value to numeric
sfDat$market.value <- as.numeric(gsub('\\$|,', '', sfDat$market.value))

#first model is both non ln values
mod1 <- lm(market.value ~ SF, data = sfDat) # change to use only training data
summary(mod1)
plot(mod1)

#Does the plot
plot(sfDat$SF, sfDat$market.value)
#Adds the line
abline(lm(sfDat$market.value ~ sfDat$SF), col="red")
#shows r^2
legend("bottomright", bty="n", legend=paste("R2 is", format(summary(mod1)$adj.r.squared, digits=4)))


#second model is ln of market value and SF
mod2 <- lm(ln.value. ~ SF, data = sfDat) # change to use only training data
summary(mod2)
plot(mod2)

#Does the plot
plot(sfDat$SF, sfDat$ln.value.)
#Adds the line
abline(lm(sfDat$ln.value.~sfDat$SF), col="red")


#third model is both ln values (MOST ACCURATE)
mod2 <- lm(ln.value. ~ ln.SF., data = sfDat) # change to use only training data
summary(mod2)
plot(mod2)

#Does the plot
plot(sfDat$ln.SF., sfDat$ln.value.)
#Adds the line
abline(lm(sfDat$ln.value.~sfDat$ln.SF.), col="red")
#shows r^2
legend("bottomright", bty="n", legend=paste("R2 is", format(summary(mod2)$adj.r.squared, digits=4)))