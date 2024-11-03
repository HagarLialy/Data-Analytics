
# Filtering & some applications on array 

#create array x
x <- c(4,7,8,10,12,18)

#find the size of x
length(x)

#detect the fifth element 
x[5]

#add array x to array y 
y <- c(x,8,13,18)
print(y)

#print values except value 6
x[-6]

# replace value number 2 with squared one 
x[2]=x[2]^2

#print the first, third, fifth 

x[c(1,5,9)]

#replace 2nd vale with 3
x[2]=3

#replace first 3 values of array y with 7
y[1:3]= 7
print(y)

#find reverse of array y 
rev(y)

#replace values greater than 8 with 7
y[y>8]=4

#print the last 9 values 
y[(length(y)-8):length(y)]

#add 1 to even elements 
y[y%%2==0]<-y[y%%2==0]+1

#replace odd elements with 2
y[y%%2!=0 & y<7] = 2

#find mean, median & sd for y
sum(y)
median(y)
mean(y)
sd(y)
sum(abs(y-mean(y)))/length(y)

# generate array rp consisting of elements 5 5 5 4 4 3 3 3 3 3 3 2 2 2 2 2 1 1 1 
rp <- c(rep(1,3), rep(5,3), rep(4,2), rep(3,6))
print(rp)

# Subset function in array & condition 

#display elements > 5 and multiple of 4
subset(x,x>5 & x%%4==0)

#Matrices 

# create matrix
a= matrix(c(3,4,5,6,7,8),4,3)

#apply function mean on matrix on all rows 
apply(a, 1, mean)

#apply function on specific rows & columns 

#print elements of 3rd rows 
a[3,]

#print elements of 2nd column 
a[,2]

#replace elements of first raw to 7, 9, 10
a[1,]<-c(7,9,10)

#add new column 
y<-cbind(a,c(1,3,7.5))

#add new row 
y<-rbind(a,c(5,7,8))

#apply mean to the second raw
mean(y[2,])
apply(y, 2, mean)

# lists & data frame

#create list
list1 <- list("a"=2.5, "b" = TRUE, "c" = "ahmed")

#accessing list element 

list1$a
list1[1]
list1["a"]

