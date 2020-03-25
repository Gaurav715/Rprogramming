x<-c("a","b","c","d","e")
x

Games
# calling particular columns and rows
Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2008","2009")]
Games[1,5,drop=F]
Games[1,,drop=F]


myplot<-function(data,rows){
  d<-data[rows,,drop=FALSE]
  matplot(t(d),type = "b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset = 0.001,legend = Players[rows] ,col=c(1:4,6),pch=15:18,horiz = F)
}

myplot(Salary,1:5)

