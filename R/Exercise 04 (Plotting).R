# charts & visualization 


plot(c(2,3), c(7,5))

x <- seq(-pi, pi, 0.1)
par(mfrow=c(1,2))
plot(x,sin(x), col="blue",type = "l", main = "my plot", xlab = "x axis", ylab = "y lab")
lines(x,cos(x), col="red")
legend("topleft", c("sin(x)", "cos(x)"), fill=c("blue", "red"))


x <- seq(-pi, pi, 0.1)
par(mfrow=c(1,2))
plot(x,sin(x), col="blue",type = "l", main = "my plot", xlab = "x axis", ylab = "y lab")
plot(x,cos(x), col="red", type= "l")

#scatter 
x <- c(8,10,12,14,16,18)
y <- c(2,4,6,8,10,12)
plot(x,y)

#bar plot
barplot(c(30,24), names.arg = c("males", "females"), col= c("red", "blue"))

barplot(c(30,24), names.arg = c("males", "females"), col= c("red", "blue"), horiz = TRUE)

ages <- c(8,10,12,14,16,18)
table(ages)
barplot(table(ages))

barplot(ages, beside=TRUE, col = c("red", "blue"))
hist(ages, )