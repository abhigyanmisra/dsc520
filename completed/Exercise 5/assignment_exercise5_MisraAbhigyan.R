# Assignment: ASSIGNMENT Exercise 5
# Name: Misra, Abhigyan
# Date: 2020-09-14

## Check your current working directory using `getwd()`
getwd()

## List the contents of the working directory with the `dir()` function
dir()

## If the current directory does not contain the `data` directory, set the
## working directory to project root folder (the folder should contain the `data` directory
## Use `setwd()` if needed
setwd("C:/git-bellevue/dsc520-fork")

## Read the file `data/acs-14-1yr-s0201.csv` to `community_df`
## Display summary statistics using the `summary()` function
community_df <- read.csv(file='data/acs-14-1yr-s0201.csv', header = TRUE, stringsAsFactors = TRUE)

str(community_df) 
nrow(community_df)
ncol(community_df)

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Create a histogram of the `HSDegree` variable using `geom_histogram()`
nOfBins <- 16
ggplot(community_df, aes(HSDegree))  + xlim(c(60,100)) +  geom_histogram(bins = nOfBins) + ggtitle('County with HSDegree') + xlab('% Age of Population with HSDegree') + ylab('Number of Counties')

## Normal Curve
ggplot(community_df, aes(HSDegree)) + xlim(c(60,100)) + geom_histogram(aes(y = ..density..), bins=nOfBins, colour = "blue") + stat_function(fun = dnorm, args = list(mean = mean(community_df$HSDegree), sd = sd(community_df$HSDegree))) + ggtitle('Normal Curve with %Age of Population with HSDegree in counties') + xlab('% Age of Population with HSDegree')

## Normal Distribution - to check Mean and Median
summary(community_df)

## Histogram with Normal Curve(Changing Density Scale to Number of Counties)
n_obs = sum(!is.na(community_df$HSDegree))
ggplot(community_df, aes(HSDegree)) + xlim(c(60,100)) + geom_histogram(bins = nOfBins)+ ggtitle('County with HSDegree') + xlab('% Age of Population with HSDegree') + ylab('Number of Counties') + stat_function(fun = function(x) dnorm(x, mean = mean(community_df$HSDegree), sd = sd(community_df$HSDegree)) * (40/nOfBins) * n_obs)

## Density Plot
ggplot(community_df, aes(HSDegree)) + geom_density(aes(HSDegree), colour="blue") + xlim(c(60,100)) + ggtitle('County with HSDegree') + xlab('% Age of Population with HSDegree') + ylab('Density of Counties')


## Probability Plot / QQ Plot & qqplot line
ggplot(community_df, aes(sample = HSDegree)) + geom_qq(col='blue') + geom_qq_line(col='red') + ggtitle("Probability - QQ Plot for HSDegree")


## stat.desc() Function
library(pastecs)
stat.desc(cbind(community_df$HSDegree), basic = FALSE, norm = TRUE)

