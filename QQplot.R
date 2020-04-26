
######## Load data and packages

library(ggpubr)
# Remove all variables from the R environment to create a fresh start
rm(list=ls())

# Set the working folder -- FILL IN THE LINE BELOW
setwd("C:\\SUTD\\Term 5\\40.012 Manufacturing and Service Operations\\2D project")

# Import data 
mydata <- read.csv(file="Product_2039.csv", head=TRUE)

#Remove outlier
x <- mydata
lq <- quantile(x$Demand,probs = 0.25)
uq <- quantile(x$Demand,probs = 0.75)
steps <- 1.5*(uq-lq)
eliminated <- subset(x,x$Demand > (lq-steps) & x$Demand < (uq + steps))

#Plot QQ graph
#qqplot(mydata$phi_inv,mydata$Demand)
#qqline(mydata$Demand)
ggqqplot(eliminated$Demand, title="QQplot of Product A Demand")

#Summary for R^2 & RSME
fit <- lm(mydata$Demand ~ mydata$phi_inv)
summary(fit)

#GOF tests
goftest::ad.test(x$Demand)
EnvStats::gofTest(x$Demand,distribution ="norm")

# Correlation coefficient
r = cor(mydata$phi_inv,mydata$Demand)
rsqu = r^2
r
rsqu

# Mean square error
mse <- mean(residuals(fit)^2)
mse

#Root mean square error
rmse <- sqrt(mse)
rmse

#Histograms
demand_hist <- hist(mydata$Demand,breaks=50,col='blue')
