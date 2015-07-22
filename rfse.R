
# load data source
dat <- dget("/home/chris/Projects/RandomForestsSpaceExploration/patchesHartley2.rdat")

str(dat)

# print greyscale image
image(dat[[100]]$gray)

# print renomalised image
image(dat[[100]]$median)

# extract target variable Y 
Y <- sapply(dat, function(x) x$Y)
Y <- as.factor(Y)

table(Y)

# create feature matrix
X <- matrix(nrow=length(dat),
            ncol=length(as.vector(dat[[1]]$gray)))

for (i in 1:length(dat)){
  X[i,] <- as.vector(dat[[i]]$gray)
}

str(X)

# learn a RF model
library(randomForest)
rf <- randomForest(x=X, y=Y, ntree=200, do.trace=T)

rf

# plot convergence of out-of-bag error
plot(rf)

importance(rf)
barplot

# plot ROC curve
library(Epi)
ROC(form=Y~X,plot="ROC")

# add new features to design set
X2 <- matrix(nrow=length(dat), ncol=length(as.vector(dat[[1]]$gray))+length(as.vector(dat[[1]]$median)))

for (i in 1:length(dat)){
  X2[i,] <- c(as.vector(dat[[i]]$gray), as.vector(dat[[i]]$median))
}

rf2 <-randomForest(x=X2, y=Y)
rf2 #  6.65%


X3 <- matrix(nrow=length(dat), ncol=length(as.vector(dat[[1]]$gray))+length(as.vector(dat[[1]]$rect)))

for (i in 1:length(dat)){
  X3[i,] <- c(as.vector(dat[[i]]$gray), as.vector(dat[[i]]$rect))
}

rf3<-randomForest(x=X3, y=Y)
rf3  # 6.56%





