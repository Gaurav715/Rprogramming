#matrix
?matrix
my_data<-1:20
my_data


a<-matrix(my_data,4,5)
a
a[2,3]

b<-matrix(my_data,4,5,byrow = TRUE)
b
b[2,5]


#rbind

r1<-c(1,2,3)
r2<-c(2,3,4)
r3<-c(5,8,9)

C<-rbind(r1,r2,r3)
C


#cbind
c1<-1:7
c2<- -1:-5
D<-cbind(c1,c2)
D