library(MASS)
library(ggplot2)
library(grid)
library(gridExtra)
library(mixtools)
library(mclust)
library(sigclust)
library(mixtools)

source("Unconditional_Simple_Test.R")
# source("Mardia_Kurtosis.R")
# source("Zhou_NN_Test.R")
# source("MTest_v1.R")

mvrunif <- function(n, mu, Sigma){
  sample = matrix(runif(n, min =0, max = Sigma), nrow = n, ncol = length(mu))
  
  for(j in 1:(length(mu)-1)){
    
    angle = runif(n, min =0, max = 2*pi)
    sample[,j] = sample[,j]*sin(angle)
    for(i in (j+1):length(mu)){
      sample[,i] = sample[,i]*cos(angle)
    } 
    sample[,j] = mu[j] + sample[,j]
  }
  return(sample)
}

generate_data <- function(d, n, k, prob = rep((1/k), k), centers = matrix(0, nrow = k, ncol = d), 
                          variability = diag(1, nrow = d), distr = "Normal"){
  
  which.comp = sample(1:k,prob=prob,size=n,replace=TRUE)
  if(distr == "Normal"){
    data <- t(sapply(which.comp, function(i){mvrnorm(n=1,mu=centers[i,],Sigma=variability)}))
  }
  if(distr == "Uniform"){
    data <- t(sapply(which.comp, function(i){mvrunif(n=1,mu=centers[i,],Sigma=variability)}))
  }
  return(data)
}

which.cluster <- function(test.x, model2, diagonal = F){
  
  if(ncol(test.x)<5){
    pred.test = predict(model2, newdata = test.x, what = "cdens")
  }else{
    class2pred12 = sapply(c(1:nrow(test.x)), function(i){
      return( logdensitynormal(test.x[i,],t(model2$parameters$mean[,1]), 
                               model2$parameters$variance$sigma[,,1], diagonal))
    })
    class2pred12 = class2pred12 + log(model2$parameters$pro[1])
    
    class2pred22 = sapply(c(1:nrow(test.x)), function(i){
      return( logdensitynormal(test.x[i,],t(model2$parameters$mean[,2]), 
                               model2$parameters$variance$sigma[,,2], diagonal))
    })
    class2pred22 = class2pred22 + log(model2$parameters$pro[2])
    pred.test = cbind(class2pred12,class2pred22)
  }
  cluster.indx = sapply(1:nrow(pred.test), function(i){which.max(pred.test[i,])})
  return(cluster.indx)
}


one.step.split <- function(train.x, test.x, model2, diagonal = F){
  #model2 = densityMclust(data = train.x, G = 2, model = "EEE")
  mu_1split = t(model2$parameters$mean)
  train.class.S1 = model2$classification
  test.class.S1 = which.cluster(test.x, model2, diagonal)
  train.x1.S1 = train.x[which(train.class.S1 == 1),]
  ntrain.x1.S1 = length(which(train.class.S1 == 1))
  test.x1.S1 = test.x[which(test.class.S1 == 1),]
  ntest.x1.S1 = length(which(test.class.S1 == 1))
  train.x2.S1 = train.x[which(train.class.S1 != 1),]
  ntrain.x2.S1 = length(which(train.class.S1 != 1))
  test.x2.S1 = test.x[which(test.class.S1 != 1),]
  ntest.x2.S1 = length(which(test.class.S1 != 1))
  
  return(list(train.x1 = train.x1.S1, test.x1 = test.x1.S1, train.x2 = train.x2.S1,
              test.x2 = test.x2.S1, ntrain.x1 = ntrain.x1.S1, ntest.x1 = ntest.x1.S1,
              ntrain.x2 = ntrain.x2.S1,
              ntest.x2 = ntest.x2.S1))
}

Topdownclustering <- function(D1, D2, alpha = 0.05, verbose=F){
  
  
  # Defining the outputs
  model.single = list()
  model.mixture = list()
  train.list = list()
  test.list = list()
  test.reject.list = list()
  children.list = list()
  parent.node = c(0)
  which.child = 0
  parent.index = 1
  children.index = 2
  
  train.x = D1
  test.x = D2
  train.list[[parent.index]] = train.x
  test.list[[parent.index]] = test.x
  ntrain = c(nrow(train.x))
  ntest = c(nrow(test.x))
  
  while(parent.index < children.index && children.index < 21){
    
    train.x = train.list[[parent.index]]
    test.x = test.list[[parent.index]]
    model1 = densityMclust(data = train.x, G = 1, plot=F,verbose=verbose)
    error.trigger = 0
    #if(norm(mus[1,]-mus[2,], type = "2") == 0){
    #  model2 = fitting.mixture.model(data = train.x, G = 2, modelNames = "EEI",
    #                                 starting.means = rbind(mus[1,]-rep(0.1,ncol(mus)), 
    #                                                        mus[2,]+rep(0.1,ncol(mus))),
    #                                 starting.variance = diag(rep(1, ncol(data))))
    #}else{
    #  model2 = fitting.mixture.model(data = train.x, G = 2, modelNames = "EEI",
    #                                 starting.means = mus,
    #                                 starting.variance = diag(rep(1, ncol(data))))
    #}
    #model2$modelName = "EEI"
    model2 = tryCatch(densityMclust(data = train.x, G = 2, plot=F,verbose=verbose),
                   error = function(err) {
                     
                     # error handler picks up where error was generated
                     print(paste("MY_ERROR:  ",err))
                     return(NA)
                   })
    if(is.na(model2)){return(list(error.trigger = 1))}
    diagonal = F
    if(model2$modelName %in% c("EII","VII","EEI","VEI","EVI","VVI")){diagonal = T}
    Ri = Ri.compute(test.x, model1, model2, diagonal = diagonal)
    
    if(length(parent.node) == 1){
      
      log.truncation.ratio = 0
      simple.fit = KL.Test1.mixture(Ri, log.truncation.ratio, alpha/2)
      simple = simple.fit$reject
      simple_median.fit = KL.Test2.mixture.median(Ri, log.truncation.ratio, alpha/2)
      simple_median = simple_median.fit$reject
      #Mardia = asym.Kurtosis.test(rbind(train.x,test.x), alpha/2)$reject
    }else{
      
      rand1 = mvrnorm(n = 1000, mu = model1$parameters$mean[,1],
                      Sigma = model1$parameters$variance$sigma[,,1])
      idx = rbinom(n = 1000, size = 1, prob = model2$parameters$pro[1])
      rand21 = mvrnorm(n = 1000, mu = model2$parameters$mean[,1],
                       Sigma = model2$parameters$variance$sigma[,,1])
      rand22 = mvrnorm(n = 1000, mu = model2$parameters$mean[,2],
                       Sigma = model2$parameters$variance$sigma[,,2])
      rand2 = idx*rand21 + (1 - idx)*rand22
      
      child = parent.index
      idx1 = 1000
      idx2 = 1000
      while(parent.node[child]!= 0){
        parent = parent.node[child]
        model.parent = model.mixture[[parent]]
        k1 = which.child[child]
        if(idx1>1){
          diag1 = F
          if(model.parent$modelName %in% c("EII","VII","EEI","VEI","EVI","VVI")){diag1 = T}
          parent.cluster.indx1 = which.cluster(rand1, model.parent, diagonal = diag1)
          rand1 = rand1[which(parent.cluster.indx1 == k1),]
          idx1 = length(which(parent.cluster.indx1 == k1))
        }
        
        if(idx2 > 1){
          diag2 = F
          if(model.parent$modelName %in% c("EII","VII","EEI","VEI","EVI","VVI")){diag2 = T}
          parent.cluster.indx2 = which.cluster(rand2, model.parent, diagonal = diag2)
          rand2 = rand2[which(parent.cluster.indx2 == k1),]
          idx2 = length(which(parent.cluster.indx2 == k1))
        }
        child = parent
      }
      prop1 = nrow(rand1)
      prop2 = nrow(rand2)
      log.truncation.ratio = log(prop2) - log(prop1)
      
      parent = parent.node[parent.index]
      alpha.new = alpha/(2^(2*(floor(log2(parent.index)))+1))
      if(test.reject.list[[parent]]$simple == T){
        simple.fit = KL.Test1.mixture(Ri, log.truncation.ratio, alpha.new)
        simple = simple.fit$reject
      }else{
        simple.fit = NULL
        simple = FALSE
      }
      if(test.reject.list[[parent]]$simple_median == T){
        simple_median.fit = KL.Test2.mixture.median(Ri, log.truncation.ratio, alpha.new)
        simple_median = simple_median.fit$reject
      }else{
        simple_median.fit = NULL
        simple_median = FALSE
      }
      #if(test.reject.list[[parent]]$Mardia == T){
      #  Mardia = asym.Kurtosis.test(rbind(train.x,test.x), alpha.new)$reject
      #}else{
      #  Mardia = FALSE
      #}
      
    }
    
    #if(simple == T || simple_median == T || Mardia == T){
    if(simple == T || simple_median == T){
      
      Split = one.step.split(train.x, test.x, model2, diagonal = diagonal)
      if(Split$ntrain.x1 > 2 && Split$ntest.x1 > 2 &&
         Split$ntrain.x2 > 2 && Split$ntest.x2 > 2){
        
        parent.node = c(parent.node, rep(parent.index, 2))
        which.child = c(which.child, 1, 2)
        ntrain = c(ntrain, nrow(Split$train.x1), nrow(Split$train.x2))
        ntest = c(ntest, nrow(Split$test.x1), nrow(Split$test.x2))
        children.list[[parent.index]] = c(children.index, children.index + 1)
        
        train.list[[children.index]] = Split$train.x1
        test.list[[children.index]] = Split$test.x1
        children.list[[children.index]] = c(0,0)
        #test.reject.list[[children.index]] = list(simple = F, simple_median = F, 
        #                                          Mardia = F)
        test.reject.list[[children.index]] = list(simple = F, simple_median = F)
        children.index = children.index + 1
        
        train.list[[children.index]] = Split$train.x2
        test.list[[children.index]] = Split$test.x2
        children.list[[children.index]] = c(0,0)
        #test.reject.list[[children.index]] = list(simple = F, simple_median = F, 
        #                                          Mardia = F)
        test.reject.list[[children.index]] = list(simple = F, simple_median = F)
        children.index = children.index + 1
        
        #test.reject.list[[parent.index]] = list(simple = simple, simple_median = simple_median, 
        #                                        Mardia = Mardia, simple.fit = simple.fit,
        #                                        simple_median.fit = simple_median.fit)
        test.reject.list[[parent.index]] = list(simple = simple, simple_median = simple_median,
                                                simple.fit = simple.fit, 
                                                simple_median.fit = simple_median.fit)
      }
    }
    
    model.single[[parent.index]] = model1
    model.mixture[[parent.index]] = model2
    
    parent.index = parent.index + 1
  }
  return(list(model.single = model.single, model.mixture = model.mixture, 
              train.cluster = train.list, test.cluster = test.list, 
              test.reject.list = test.reject.list,
              parents = parent.node, error.trigger = 0,
              which.child = which.child,
              children.list = children.list,
              ntrain = ntrain, ntest = ntest))
}