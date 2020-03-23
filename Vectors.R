myfirstVector <- c(3,45,56,732)
myfirstVector
is.numeric(myfirstVector)
is.integer(myfirstVector)
is.double(myfirstVector)


v2<-c(2L,34L,33L)
v2
is.numeric(v2)
is.double(v2)
is.integer(v2)

v3<-c("Gaurav" ," Sourabh" ,7)
v3
is.character(v3)


seq(1,15,2) # like 1:15

rep(5,15)
d<-rep(3,2)
d


l<-c("a","b","c","d")
l[1]
l[-1]
l[2:3]
l[c(1,2,3)]

a<-c(1,2,3,6,7)
b<-c(2,3,4)
a+b
a-b
a>b
a<b
a/b
a*b




x<-rnorm(5)
x
for (i in x){
  print(i)
}




n<-100
a<-rnorm(n)
b<-rnorm(n)
a*b
