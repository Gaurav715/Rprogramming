# Type of variable
x<-4
typeof(x)

y<-2.5
typeof(y)

g<-"Gaurav"
typeof(g)

t<- TRUE
typeof(t)


#operations on variable
A <- 10
B <- 5

c<-A+B
c

var1 <- 2.5
var2 <-4
result <- var1/var2
answer <- sqrt(var2)


greeting <-"Hello"
name<- "Gaurav"

mesage<- paste(greeting,name)
mesage

#Logical variable and operator
4<5
10>100
10==11

Outcome<- 4>5

result1 <- !FALSE

Outcome | result1 
Outcome & result1
isTRUE(result1)


#while Loop

while(TRUE)
{
  print("Hello")
}


a <-1
while(a<50){
  print(a)
  a=a+1
}


#for loop
for(i in 1:5){
  print("Hello R!")
}

#if statement 


rm(answer)
x<- rnorm(1)
if(x>1){
  answer <-"Greater then 1"
  }else if(x>= -1){
          answer <- "Between -1 and 1 "
        }else
        {
          answer <- "Less than -1"
        }
