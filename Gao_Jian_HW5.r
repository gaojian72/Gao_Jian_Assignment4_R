# ---
# title: "Assigenment 5"
# output: html_document
# ---

library('ggplot2')
library('dplyr')
data<-data.frame(diamonds)
# the library we need to use and the data set diamonds

##Question 1
```{r}
str(data)
# attributes(data)
ncol(data)
# print the console all methods and attributes
# associates with a dataframe
# determine the number of columns in a dataframe
```

##Question 2
```{r}
nrow(data)
# determine how many rows are in a dataframe
```

##Question 3
```{r}
colnames(data)
# extract the column names from a dataframe and
# print the names of the columns to the console
```

##Question 4
```{r}
lapply(data,class)
# determine the type of each column
# print the type of each column 
```

##Question 5
```{r}
data1<-data[,sapply(data,is.numeric)]
colMeans(data1)
# calculate the mean of every numeric column
# label the output with the name of the column
```

##Question 6```{r}
data2<-data[,sapply(data,is.factor)]

##Prof G - Not quite. Your code below results in 
##Prof G - the frequency of
##Prof G - each unique combination of the three
##Prof G - factor variables combined. Here's example
##Prof G - code to generate a frequency table.
table(data2[1]) ##Prof G's example

rename(count(data2,cut,color,clarity),Freq=n)
# create a frequency table for every factor column
# label the output with the name of the column
```

##Question 7 
```{r}
##Prof G - What data were you trying to use?
##Prof G - Here's an example with mtcars
data("mtcars")
mtcars$nas <- c(1,2,NA,4)*8
data <- mtcars

##Prof G - This works correctly
sapply(data,function(x) sum(is.na(x)))

##Prof G - This does not work because the code
##Prof G - specifies a specific column in a dataframe
##Prof G - that is not created in this script file.
sum(data$catch.rate %in% NA)/nrow(data)
# determine the number of rows containing NA in each column
# determine the percentage of rows containing NA in any column
```

##Quewtion 8
```{r}
pearson.coe <- function(x){
  # This function can accept any dataframe as a parameter
  # and return a dataframe that contains each pair of column names
  # in the first colum n in a single string seperated by a -, and their
  # corresponding Pearson correlation coefficient in the second column
  x=x[sapply(x,is.numeric)]
  # select numeric columns
  d=colnames(x)
  pair.names=c()
  pair.coe=c()
  for (i in 1:(length(d)-1)){
    # from the first column to the second to last column
    for (j in (i+1):length(d)){
    # from the second column to the last column
      pair.names=c(pair.names,paste(d[i],d[j],sep='-'))
      # name1-name2
      pair.coe=c(pair.coe,cor(x[i],x[j],method='pearson'))
      # calculate the coefficient
    }
  }
  return(data.frame(pair.names,pair.coe))
}

#Example
data <- diamonds
pearson.coe(data)
```










