# import data
sfDat <- read.csv('sf_movingavg.csv')

#remove first 11 blank columns
sfDat <- sfDat[11:nrow(sfDat), ]


#change market value to numeric
sfDat$market.value <- as.numeric(gsub('\\$|,', '', sfDat$market.value))


#this model uses ln(value) and ln(S2F)
mod3 <- lm(ln.value. ~ ln.SFW., data = sfDat) # change to use only training data
summary(mod3)
plot(mod3)

#plot sf
plot(sfDat$Date, sfDat$ln.SF., xlab="Time", ylab="LN(S2F) (1m Avg)", main="S2F (1m avg)")
plot(sfDat$Date, sfDat$ln.SFW., xlab="Time", ylab="LN(S2F) (12m Avg)", main="S2F (12m avg)")

#Does the plot
plot(sfDat$ln.SF., sfDat$ln.value., xlab="LN(S2F) (1m Avg)", ylab="S2F (1m avg)") # 1m avg
plot(sfDat$ln.SFW., sfDat$ln.value., xlab="LN(S2F) (12m Avg)", ylab="S2F (12m avg)") # 12m avg

#Add the line
abline(lm(sfDat$ln.value.~sfDat$ln.SFW.), col="red") #All Data


#shows r^2
legend("bottomright", bty="n", legend=paste("R2 is", format(summary(mod3)$adj.r.squared, digits=2)))