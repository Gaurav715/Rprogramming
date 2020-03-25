#name_Vector

charlie<-1:5
charlie

#names
names(charlie)<-c("a","b","c","d","e")
charlie

charlie["e"]

#Remove Name
names(charlie) <- NULL


#===========================================
#naming the matrix

temp.vect<-rep(c("a","b","zZ"),each=3)
temp.vect
d<-matrix(temp.vect,3,3)
d

#name the rows and column 

rownames(d) <-c("How","You","are?")
d

colnames(d) <-c("I","am","9")
d

d["How","am"] <-0
d
