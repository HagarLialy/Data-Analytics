
#condition

grade1 <- as.numeric(readline(prompt= "enter first grade: "))
grade2 <- as.numeric(readline(prompt= "enter second grade: "))
grade3 <- as.numeric(readline(prompt= "enter third grade: "))
ave= (grade1+grade2+grade3)/3

if(ave>95){
  print("Grade is A+")
} else if (ave>90) {
  print("Grade is A")
} else if (ave>80) {
  print("Grade is B") 
} else if (ave>70) {
  print("grade is C")
} else {
  print("fail")
}

a <- c(5,7,8,9)
ifelse(a%%2==0, "even", "odd")

students <- data.frame (
  names <- c("hagar","sandy"),
  grade <- c(90,85)
)

if (students$grade[1] > 90) {
hagar_category <- "High"
} else if (students$grade[1]> 80) {
hagar_category <- "medium"
} else {
hagar_category <- "low"
}

if (students$grade[2] > 90) {
sandy_category <- "High"
} else if (students$grade[2]> 80) {
sandy_category <- "medium"
} else {
sandy_category <- "low"
}

students$category <- c(hagar_category, sandy_category)

#switch

#to return value from a list 
switch(2,"red", "blue", "yellow")

#for 

for(i in 1:5){
  print(i)
}

info <- list(names="hagar", age= "15")
for (items in names (info)){
  cat(items, ":", info[[items]], "\n")
}

for(i in 1:3) {
  for(j in 1:3) {
product <- i*j
cat(i, "*", j, "=", product, "\n")
  }
}

matrix= matrix(c(1,5,6,2,7,6,4,3,7),3)
print(matrix)
diag(matrix)

for (i in 1:2){
  print(matrix[(i+1):3, i])
}

for (i in 1:2) {
  print(matrix[i, 1:(i-3)])
}

i <- 3
while (i<10)
  {print(i)
  i =i+1
}


for (i in 1:10){
  if (i%%2==0 & i%%3==0) break
  print(i)
}

for (i in 1:25){
  if (i%%3!=0) next
  print(i)
}

check <- function(x){
  if (x>0) {
  return("positive")
  }
  else if (x<0) {
  return("negative")
  }
  else {
  return("zero")
  }
}
check(5)
check(-5)

# calculatorrrrrrr
calculator <- function(x,y,a){
  if (a=="+") {
  return(x+y)
  }
  else if (a=="/"){
  return(x/y)
  }
  else if (a=="^"){
  return(x^y)
  }
  else {
  return("invalid: error message")
  }
}

calculator(5,4, "-")


