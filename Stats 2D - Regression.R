# Stats 2D. Based Code from Week 9/10 Lectures  =====


rm(list=ls())
setwd("C:\\Users\\night\\OneDrive\\Desktop\\Term 5\\Statistics\\Week 9")

library(readxl)
library(ggplot2)

# Stats Method for Regression  =====
mydata = as.data.frame(read_excel("Stats 2D Clean.xlsx", sheet=3))
colnames(mydata) = c("Months", "Demands")



# Check for Outliers

boxplot(mydata$Demands, outcol="red", boxlwd = 4)$out

# Eliminate Outliers
boxplot(mydata$Demands, plot=FALSE)$out
outliers <- boxplot(mydata$Demands, plot=FALSE)$out
x <- mydata
x<- x[-which(x$Demands %in% outliers),]

boxplot(x$Demands, outcol="red", boxlwd = 4)$out


 
# Plotting Graph

x_bar = mean(mydata$Months)
y_bar = mean(mydata$Demands)
s_x = sd(mydata$Months) 
s_y = sd(mydata$Demands)
s_xy = cov(mydata$Months, mydata$Demands)
beta_1_hat = s_xy / s_x^2
beta_0_hat = y_bar - x_bar*beta_1_hat
r_sq = (s_xy / (s_x*s_y))^2

# ggplot(mydata, aes(x = Months, y = Demands)) + 
#   geom_point() + 
#   geom_smooth(method = lm, se = FALSE)


ggplot(data=mydata, aes(x=Months, y=Demands)) +
  geom_point() +
  geom_abline(intercept = beta_0_hat, slope = beta_1_hat) +
  labs(y = "Order Demands", x = "Months") + geom_smooth(method="lm", formula = y ~ x)

# Calculating Residuals

mydata$fitted_values = beta_0_hat + beta_1_hat*mydata$Months #Fitted Values = Predicted Values
SSE = sum((mydata$fitted_values - mydata$Demands)^2)
MSE = SSE / (nrow(mydata)-2)    # this is also estimate for sigma^2
two_sd = 2*sqrt(MSE)    # conclusion: no outliers

mydata.lm = lm(Demands ~ Months, data=mydata)
summary(mydata.lm)
confint(mydata.lm)


Sxx = s_x^2*(nrow(mydata)-1)
s=sqrt(MSE)
# RSME Value 
# Estimate for si  gma 
s 
UBbeta1 = beta_1_hat+qt(0.975,nrow(mydata)-2)*s/sqrt(Sxx) #CI Upper Bound
LBbeta1 = beta_1_hat-qt(0.975,nrow(mydata)-2)*s/sqrt(Sxx) #CI Lower Bound

ggplot(data=mydata, aes(y=Demands, x=fitted_values)) +
  geom_point() +
  geom_smooth(method="lm", formula = y ~ x) + labs(y = "Actual Order Demands", x = "Predicted Order Demands")

# Trial Code
# mse <- mean(residuals(mydata.lm)^2)
# mse
# rss <- sum(residuals(mydata.lm)^2)
# rss
# rse <- sqrt( sum(residuals(mydata.lm)^2) / mydata.lm$df.residual ) 
# rse
# rmse(mydata$Demands, mydata$fitted_values)
# rmse


## 80% Trimmed Data Method

# train <- sample.int(nrow(mydata), 58)
# fit <- lm(Demands ~ Months, data=mydata[train, ])
# pred <- predict(fit, newdata=mydata[-train, ])
# test <- data.frame(actual=mydata$Demands[-train], pred)
# test$error <- with(test, pred-actual)
# test
# 
# ggplot(data=test, aes(y=actual, x=pred)) +
#   geom_point() +
#   geom_abline(intercept = beta_0_hat, slope = beta_1_hat)

