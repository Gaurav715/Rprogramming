getwd() # where are your directory currently
setwd("F:\\Udemy\\Rprogram\\Section6\\P2-Section6-Homework-Data") 
movies<-read.csv("Section6-Homework-Data.csv")
head(movies)
colnames(movies)
colnames(movies) <-c("DOW","Director","Genre","MTitle","RD","Studio",
             "AdjustedGross","Budget","Gross","IMDBRating",
            "MovieLensRating","Overseas","Overseas_percentage","Profit",
            "Profit_percentage","Runtime","US","Gross_percent_US")
head(movies)
str(movies)

filt <- ((movies$Genre == "action" )| (movies$Genre == "adventure") | (movies$Genre == "animation")|
         (movies$Genre == "comedy")  | (movies$Genre == "drama"))
filt
movies <- movies[filt,]
movies

filt2<- movies$Studio %in% c("Buena Vista Studios","WB","Fox","Universal","Sony","Paramount Pictures")
movies <-movies[filt2,]
movies




movies1<- movies[filt & filt2,]
movies1


library(ggplot2)
p <- ggplot(data=movies1, aes(x=Genre, y=Gross_percent_US))
p
p+geom_boxplot()
  q <- p+geom_jitter(aes(size=Budget,color=Studio))+
  geom_boxplot(alpha=0.5,outlier.colour = NA) 
  
#Axes and main heading   
q+xlab("Genre")+ ylab("Gross%US")+ggtitle("Domestic Gross % By Genre")+
theme(axis.title.x = element_text(color=" Dark Green",size=10),
      axis.title.y = element_text(color="Red",size=20),
      axis.text.x= element_text(size=20),
      axis.text.y= element_text(size = 20),
      legend.title = element_text(size=10),
      legend.text = element_text(size=10),
      plot.title = element_text(colour="DarkBlue",
                                size=20,
                                family ="courier"))
q$labels$size <- "Budget $M"
q
