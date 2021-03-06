#attach faithful data set
data(faithful)
plot(faithful, pch="+")

#run mclust on faithful data
require(mclust)
faithfulMclust<-Mclust(faithful, G=2)
summary(faithfulMclust, parameters=TRUE)
plot(faithfulMclust)

#create 3 segment data set
require(MASS)
sigma <- matrix(c(1.0,.6,.6,1.0),2,2)
mean1<-c(-1,-1)
mean2<-c(0,0)
mean3<-c(1,1)
set.seed(3202014)
mydata1<-mvrnorm(n=100, mean1, sigma)
mydata2<-mvrnorm(n=100, mean2, sigma)
mydata3<-mvrnorm(n=100, mean3, sigma)
mydata<-rbind(mydata1,mydata2,mydata3)
colnames(mydata)<-c("Desired Level of Quality",
                    "Willingness to Pay")
plot(mydata, pch="+")

#run Mclust with 3 segments
mydataClust<-Mclust(mydata, G=3)
summary(mydataClust, parameters=TRUE)
plot(mydataClust)

#let Mclust decide on number of segments
mydataClust<-Mclust(mydata)
summary(mydataClust, parameters=TRUE)
