###########Assigenment 4###############

##Prof G - You didn't explain any of your solutions.

##Question1
#a).
seq(1:20)
#b).
n<-20
c<-(n:1)
n
#c).
c(1:20,19:1)
#d).
tmp<-c(4,6,3)
#e).
rep(tmp,10)
#f).  
rep(tmp,l=31)
#g).
rep(tmp,times=c(10,20,30))

##Question 2
x<-seq(3,6,by=0.1)
exp(x)*cos(x)

##Question 3
#a).
(0.1^seq(3,36,by=3))*(0.2^seq(1,34,by=3))
#b).
(2^seq(1,25,by=1))/(1:25)

##Question 4
#a).
i=seq(1,100,by=1)
sum(i^3+4*i^2)
#b).
i=seq(1,25,by=1)
sum(2^i/i + 3^i/i^2)

##Question 5
#a).
paste('label',1:30)
#b).
paste('fn',1:30,sep="")

##Question 6
set.seed(50)
xVec<-sample(0:999,250,replace=T)
yVec<-sample(0:999,250,replace=T)
#a).
yVec[c(2:250)]-xVec[c(1:249)]
#b).
sin(yVec[c(1:249)])/cos(xVec[c(2:250)])
#c).
xVec[c(1:248)]+2*xVec[c(2:249)]-xVec[c(3:250)]
#d).
sum(exp(-xVec[c(2:250)])/(xVec[c(1:249)]+10))

##Question 7 
set.seed(50)
xVec<-sample(0:999,250,replace=T)
yVec<-sample(0:999,250,replace=T)
#a).
y600<-yVec[yVec>600]
y600
#b).
which(yVec>600)
#c).
x600<-xVec[yVec>600]
#d).
sqrt(abs(xVec-mean(xVec)))
#e).
sum(yVec>max(yVec)-200)
#f).
sum(xVec%%2==0)
#g).
xVec[order(yVec)]
#h).
yVec[c(T,F,F)]

##Question 8
1+sum(cumprod(seq(2,38,by=2)/seq(3,39,by=2)))















