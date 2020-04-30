# import data
sfDat <- read.csv('sf.csv')

#before first halving
sfPreHalvingDat <- sfDat[11:48, ]
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
#plot(mod1)

#Does the plot
plot(sfDat$SF, sfDat$market.value)
#Adds the line
abline(lm(sfDat$market.value ~ sfDat$SF), col="red")
#shows r^2
legend("bottomright", bty="n", legend=paste("R2 is", format(summary(mod1)$adj.r.squared, digits=4)))


#second model is ln of market value and SF
mod2 <- lm(ln.value. ~ SF, data = sfDat) # change to use only training data
summary(mod2)
#plot(mod2)

#Does the plot
plot(sfDat$SF, sfDat$ln.value.)
#Adds the line
abline(lm(sfDat$ln.value.~sfDat$SF), col="red")


#third model is both ln values (MOST ACCURATE)
mod3 <- lm(ln.value. ~ ln.SF., data = sfDat) # change to use only training data
summary(mod3)
plot(mod3)

#Does the plot
plot(sfDat$ln.SF., sfDat$ln.value.)
#Adds the line
abline(lm(sfDat$ln.value.~sfDat$ln.SF.), col="red") #All Data
abline(14.05, 3.9, col="green") #Pre 1st halving Line
abline(14.04, 3.76, col="blue") #Pre Halving + Post 1st Halving (not post 2nd halving)
abline(16.168, 2.728, col="pink") #Post first halving to today --- this is kinda worthless tbh, only .7 r2

#prehalving model
preHalvingMod <- lm(ln.value. ~ ln.SF., data = sfPreHalvingDat) # change to use only training data
summary(preHalvingMod)

pred1 <- predict(preHalvingMod, newdata = sfDat)
summary(pred1)

#rmse <- sqrt(sum((pred1 - sfDat$ln.value.)^2)/length(sfDat$ln.value.))
#Cc(RMSE = rmse, R2=summary(preHalvingMod)$r.squared)

#shows r^2
legend("bottomright", bty="n", legend=paste("R2 is", format(summary(mod3)$adj.r.squared, digits=4)))
