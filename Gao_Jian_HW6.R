##title: "Assigenment 6"
##output: html_document
##---
## Jian Gao
## Group C
##Prof G - Like you HW5 file, I could not run this
##Prof G - script because you kept the mark-up header
##Prof G - and the ```{r} mark-ups in the file. These
##Prof G - should only be included in the .rmd file.
library('ggplot2')
library('gridExtra')
library('grid')

##Prof G - Why is this package required?
library('pracma')
data<-data.frame(diamonds)
## the require packages and dataframe we use 

##Question 2
```{r}
plot<-ggplot(data,aes(x=carat,y=price,color=clarity))+geom_point()
plot<-plot+ggtitle('Diamonds-Weight to Price by Color')
plot
## Create a simple scatter plot of Weight ('catat') and Price using color as a facet.
```

##Question 3
```{r}
plot1<-ggplot(data,aes(x=log(carat),y=log(price),color=color))+geom_point()
plot1<-plot1+ggtitle('Diamonds-Weight to Price (Linear)')
plot1
## Using natural log to transform columns to teh dataframe and replot.
```

##Question 4
```{r}
detrend<-lm(log(price)~log(carat),data=data)
data$lprice2<-resid(detrend)
plot2<-ggplot(data,aes(x=log(carat),y=lprice2,color=color))+geom_point()+
      xlab('Weight')+ylab('Price Residuals')+ggtitle('Diamonds - Weight to Price by Color')
plot2
## Remove the linear trend and model with a linear regression model
## Then the residuals should be randomly distributed
## The resulting plot visually indicate there is possibly some heteroscedasticity to manage.
```

##Question 5
```{r}
set.seed(123)
# Create the main plot
detrend<-lm(log(price)~log(carat),data=data)
data$lprice2<-resid(detrend)
plot2<-ggplot(data,aes(x=log(carat),y=lprice2,color=color))+geom_point()+
       xlab('Weight')+ylab('Price Residuals')+ggtitle('Diamonds - Weight to Price by Color')

#create the inset plot
hist1<-ggplot(data,aes(x=price, fill=color)) +
    geom_histogram(aes(y=..density..)) +
    theme(legend.position="none") +
    theme(axis.title.x=element_blank(), axis.title.y=element_blank())
hist2<-ggplot(data,aes(x=carat, fill=color)) + 
    geom_histogram(aes(y =..density..)) +
    theme(legend.position = "none") +
    theme(axis.title.x=element_blank(), axis.title.y=element_blank())

grid.newpage() ## create new blank graph
print(plot2)
print(hist2,vp=viewport(0.77, 0.84, 0.35, 0.25))
print(hist1,vp=viewport(0.215, 0.2, 0.35, 0.25))
## Use the grid package to create the following overlay of three plots using viewports.
## The histogram on the bottom left is a density histogram of the price
## The histogram on the upper right is a density histogram of carat 
```

## Question 6
```{r}

##Prof G - Good initiative. Rather than flipping the
##Prof G - coordinates of hist1, you should have rotated
##Prof G - the subplot 90 degrees counter-clockwise
empty <- ggplot()
empty <- empty + geom_point(aes(1,1), colour="white")
empty <- empty + theme(axis.ticks=element_blank(), 
                       panel.background=element_blank(), 
                       axis.text.x=element_blank(), 
                       axis.text.y=element_blank(),           
                       axis.title.x=element_blank(), 
                       axis.title.y=element_blank(),
                       panel.grid=element_blank())
plot2<-plot2+theme(legend.position='top')+theme(plot.title=element_text(size=20,colour='blue'))
hist1<-hist1+labs(x=NULL,y=NULL,title=NULL)
hist2<-hist2+labs(x=NULL,y=NULL,title=NULL)
grid.arrange(arrangeGrob(hist1+coord_flip(),plot2,ncol=2,widths=c(1,3)),
             arrangeGrob(empty,hist2,ncol=2,widths=c(1,3)),heights=c(3,1))
## optional for me! Just for practice advance exercise 
## Using grid package to create the following overlaid plot using viewports.
## The rotated histogram on the left is a density histogram of the price
## The histogram on the bottom is a density histogram of carat.
```





