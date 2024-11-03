
# define variable 
x <- 3 
5 -> y

#define many variables 
var.1 = c(0,1,2,3)
var.2 = c("pyhton", "R")
var.3 = c(TRUE, 1)
assign ("c", 11)

#print variables 
print(var.1)
cat ("var.1 is ", var.1, "\n")

# get work space directory 
getwd()

# list all variables 
ls()

#determine type of variable 
typeof(var.1)
class(var.1)

length(var.1)
seq(1,15,2)
rep(1:6, each=2)

name = readline(prompt = "enter your name: ")
age = as.numeric(readline(prompt = "enter your age: "))

radius = as.numeric(readline(prompt = "enter the radius "))
area = (radius^2)*3.14
circu = 2*3.14*radius
print(area)
print(circu)



