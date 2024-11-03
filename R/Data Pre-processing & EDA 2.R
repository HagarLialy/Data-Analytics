#upload data 
mydata <- read.csv("C:\\Users\\tiba mol\\Desktop\\Clean data\\data cleaning.csv", header = TRUE)

#info about data 
str(mydata)

#statistics about data 
summary(mydata)

#change date format
mydata$Date <- as.Date(mydata$Date, format = " '%Y/%M/%D'")
str(mydata)

#missing values 
missing_values <- sapply(mydata, function(x) sum(is.na(x)))
missing_values

#remove missing values
cleaned <- na.omit(mydata)
cleaned

#replace values with default value 
mydata[is.na(mydata)] <- 0
mydata

#replace with mean 
filled_mean <- mydata 
filled_mean <- sapply(filled_mean, function(x) ifelse(is.na(x), mean(x, na.rm = TRUE), x))
filled_mean <- as.data.frame(filled_mean)
filled_mean

#replace with median
filled_median <- mydata 
filled_median <- sapply(filled_median, function(x) ifelse(is.na(x), median(x, na.rm = TRUE), x))
filled_median <- as.data.frame(filled_median)
filled_median

#identify outliers 
boxplot(mydata$Pulse, main= "pulse", ylab= "pulse rate")
boxplot(mydata$Maxpulse, main= "max pulse", ylab= "max pulse rate")
boxplot(mydata$Calories, main= "calories", ylab= "caloriess")

Q1 <- quantile(mydata$Pulse, 0.25)
Q3 <- quantile(mydata$Pulse, 0.75)
IQR <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

outliers <- mydata[mydata$Pulse < lower_bound | mydata$Pulse > upper_bound, ]
outliers


#cap 
mydata$Duration <- ifelse(mydata$Duration < lower_bound, lower_bound, mydata$Duration)
mydata$Duration <- ifelse(mydata$Duration > upper_bound, upper_bound, mydata$Duration)
mydata










