#select the File manually (MethodNo-1)

stats <-read.csv(file.choose())
stats


#method-2
getwd() # where are your directory currently
setwd("F:\\Udemy\\Rprogram\\Section5")  #setup the directory
rm(stats)
stats<- read.csv("P2-Demographic-Data.csv")
stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
str(stats)
summary(stats)

#how to access the R 

stats$Internet.users
stats$Internet.users[3]
levels(stats$Income.Group)


#basicOperations

stats[1:10,]
stats[3:10,]
stats[c(3,100),]

stats[1,]
stats[,1,drop=F]


stats$Birth.rate+stats$Internet.users
stats$mycal<-stats$Birth.rate+stats$Internet.users
stats


#how to Revome the column 
stats$mycal<-NULL


#filter 
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]


stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group=="Low income",]
stats[stats$Country.Name=="Malta",]

library(ggplot2)
qplot(data=stats, x=Internet.users)
qplot(data=stats,x= Income.Group, y= Birth.rate)
qplot(data=stats,x= Income.Group, y= Birth.rate ,size=I(10),colour=I("BLUE"))
qplot(data=stats,x= Income.Group, y= Birth.rate,geom = "boxplot")      


qplot(data=stats ,x=Internet.users ,y= Birth.rate,
      size=I(4),color=I("Red"))

qplot(data=stats ,x=Internet.users ,y= Birth.rate,
      size=I(5),color=Income.Group)



#====================================================
#      Creating Data Frame
#====================================================
mydf<- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)

colnames(mydf) <-c("Country","Code","Regions")
rm(mydf)

mydf<- data.frame(Country=Countries_2012_Dataset,
                  Code=Codes_2012_Dataset,
                  Regions=Regions_2012_Dataset)


#=======================================================================
#MergingDataFrame
#=======================================================================

head(stats)
head(mydf)

merg<-merge(stats,mydf,by.x = "Country.Code",by.y = "Code")
head(merg)
merg$Country<-NULL

qplot(data=merg ,x=Internet.users ,y= Birth.rate,
      size=I(4),color=Regions)

#shapes
qplot(data=merg ,x=Internet.users ,y= Birth.rate,
      size=I(4),color=Regions,shape=I(17))

#transparency
qplot(data=merg ,x=Internet.users ,y= Birth.rate,
      size=I(4),color=Regions,shape=I(19),alpha=I(0.6))

#titles
qplot(data=merg ,x=Internet.users ,y= Birth.rate,
      size=I(4),color=Regions,shape=I(19),alpha=I(0.6),
      main = "BirthRate vs Internet Users")

