getwd() # where are your directory currently
setwd("F:\\Udemy\\Rprogram\\Section6") 
movies<-read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies)
colnames(movies)<- c("Film","Genre","CriticsRating","AudienceRating","BudgetinMillion","Year")
str(movies)
summary(movies)
movies$Year<-factor(movies$Year)


#aesthetic

library(ggplot2)
ggplot(movies,aes(x=CriticsRating,y=AudienceRating))

#add geometry
ggplot(movies,aes(x=CriticsRating,y=AudienceRating)) +
  geom_point()

#add colour
ggplot(movies,aes(x=CriticsRating,y=AudienceRating,
                  colour=Genre)) +
  geom_point

#add size
ggplot(movies,aes(x=CriticsRating,y=AudienceRating,
                  colour=Genre,size=BudgetinMillion)) +
  geom_point()


#plotting with the layer 
p<- ggplot(movies,aes(x=CriticsRating,y=AudienceRating,
                  colour=Genre,size=BudgetinMillion)) 

#points
p+ geom_point()
  
#line
p+ geom_line()


#point and line
p+geom_line()+geom_point()




#overidding Aesthetic
q<- ggplot(movies,aes(x=CriticsRating,y=AudienceRating,
                      colour=Genre,size=BudgetinMillion)) 


#example1
q+geom_point(aes(size=CriticsRating))

#example2
q+geom_point(aes(colour=BudgetinMillion))


q+geom_point(aes(x=BudgetinMillion)) + xlab("$BudgetinMillion$")

p+geom_line(size=1)+geom_point()


# setting and mapping 

r<- ggplot(data=movies,aes(x=CriticsRating,y=AudienceRating))
r+geom_point()


#colors using mapping
r+geom_point(aes(color=Genre))
#colors using setting
r+geom_point(colors="DarkGreen")

#mapping
r+geom_point(aes(size=BudgetinMillion))
#setting
r+geom_point(size=10)


#histogram and Geometry

s <- ggplot(data=movies ,aes(x=BudgetinMillion))
s+geom_histogram(binwidth = 10)

#add colors
s+geom_histogram(binwidth = 10,aes(fill=Genre))

#add border
s+geom_histogram(binwidth = 10,aes(fill=Genre),color="black")


#sometime we need density map

s+geom_density(aes(fill=Genre))
s+geom_density(aes(fill=Genre),position = "stack")


#starting layers tips
t<- ggplot(data=movies,aes(x=AudienceRating))
t+ geom_histogram(binwidth = 10,fill="White",colour ="BLUE")

t<- ggplot(data=movies,aes(x=CriticsRating))
t+ geom_histogram(binwidth = 10,fill="White",colour ="BLUE")

#statiscal layer 

u<- ggplot(data=movies,aes(x=CriticsRating,y=AudienceRating,color=Genre))
u+geom_point() + geom_smooth(fill=NA)

#boxplot

u<-ggplot(data=movies,aes(x=Genre ,y= AudienceRating,color=Genre))
u+geom_boxplot()
u+geom_boxplot(size=1.2) + geom_point()

u+geom_boxplot(size=1.2) +geom_jitter()

#for more good visualization
u+geom_jitter()+ geom_boxplot(size=1.2,alpha=0.5)


#box plot for critics rating 
u<-ggplot(data=movies,aes(x=Genre ,y= CriticsRating,color=Genre))
u+geom_boxplot()
u+geom_boxplot(size=1.2) + geom_point()

u+geom_boxplot(size=1.2) +geom_jitter()

#for more good visualization
u+geom_jitter()+ geom_boxplot(size=1.2,alpha=0.5)


#using facets


v<-ggplot(data=movies,aes(x=BudgetinMillion))
v+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black") +
  facet_grid(Genre~.,scales = "Free")

#box plot with facets
x<- ggplot(data=movies,aes(x=CriticsRating,y=AudienceRating,color=Genre))
x+geom_point(size=3)+facet_grid(Genre~.)
x+geom_point(size=3)+facet_grid(.~Year)
x+geom_point(size=3)+facet_grid(Genre~Year)+geom_smooth()

x+geom_point(aes(size=BudgetinMillion))+facet_grid(Genre~Year)+geom_smooth()





#coordinates
#zoom
#limit

t<-ggplot(data=movies,aes(x=CriticsRating,y=AudienceRating,color=Genre))
t+geom_point()+xlim(50,100)+ylim(50,100)


#wont work good always for example

l<- ggplot(data=movies,aes(x=BudgetinMillion))
l+geom_histogram(binwidth = 10,aes(fill=Genre),
                 color="Black")+
  coord_cartesian(ylim=c(0,50))

x+geom_point(aes(size=BudgetinMillion))+facet_grid(Genre~Year)+geom_smooth()+
  coord_cartesian(ylim=c(0,100))


#theme

o<-ggplot(data=movies,aes(x=BudgetinMillion))
h<- o+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")
h
#axes label
h+xlab("Money")+
  ylab("Number of Movie")
#label formatting
h+
  xlab("Money")+
  ylab("Number of Movie")+
  theme(axis.title.x = element_text(color=" Dark Green",size=30),
        axis.title.y = element_text(color="Red",size=20),
        axis.text.x= element_text(size=20),
        axis.text.y= element_text(size = 20))



#legend formatting
h+
  xlab("Money")+
  ylab("Number of Movie")+
  theme(axis.title.x = element_text(color=" Dark Green",size=30),
        axis.title.y = element_text(color="Red",size=20),
        axis.text.x= element_text(size=20),
        axis.text.y= element_text(size = 20),
        legend.title = element_text(size=30),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1))


#Title
h+
  xlab("Money")+
  ylab("Number of Movie")+
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(color=" Dark Green",size=30),
        axis.title.y = element_text(color="Red",size=20),
        axis.text.x= element_text(size=20),
        axis.text.y= element_text(size = 20),
        legend.title = element_text(size=30),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour="DarkBlue",
                                  size=40,
                                  family ="courier"))

        