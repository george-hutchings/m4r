## Install a package manager and packages
if (!require("pacman"))
  install.packages("pacman")
pacman::p_load(mclust, Rfast, pracma, mvnfast)
# top down hierarchical clustering
source("main_topdown_hierarchical.R")


# function to integrate the model p squared
integrate.psquared <- function(model, n = 10e5) {
  sigma = lapply(seq.int(model$G), function(x)
    model$parameters$variance$sigma[, , x])
  mu = t(model$parameters$mean)
  samples = rmixn(
    n = n,
    mu = mu,
    sigma = sigma,
    w = model$parameters$pro
  )
  integra.val = mean(dmixn(
    X = samples,
    mu = mu,
    sigma = sigma,
    w = model$parameters$pro
  ))
  return(integra.val)
}




# function to calculate matrix of the logged density of D2 data points, where
# the density is fitted to a gaussian mixture model with 'G=1,2,..., K'
# gaussians, fitted to D1. The output matrix, A, is of the form Aij =
# log(f_p_j(X_i)), ie data point i, fitted with j gaussians
logXi_dCalc <-
  function(D1,
           D2,
           K = floor(sqrt(nrow(D2))),
           verbose = F) {
    logXis_pjs = matrix(0, nrow = nrow(D2), ncol = K)
    df = numeric(K)
    pjSquared = numeric(K)
    for (j in 1:K) {
      p_hat = Mclust(
        data = D1,
        G = j,
        modelnames = c("VVV"),
        verbose = verbose
      )
      logpj_hatXi = dens(
        modelName = p_hat$modelName,
        data = D2,
        logarithm = TRUE,
        parameters = p_hat$parameters,
      )
      logXis_pjs[, j] = logpj_hatXi
      df[j] = p_hat$df
      pjSquared[j] = integrate.psquared(p_hat)
    }
    return(list(
      logXis_pjs = logXis_pjs,
      df = df,
      pjSquared = pjSquared
    ))
  }

# determines whether to reject the null hypothesis (either by the median (sign)
# method or by the mean method). it returns the p value and a logical variable
# of rejection or not
reject.Ri <- function(Ri, alpha = 0.05, method = "median") {
  if (method == "median") {
    pvalMedian = pbinom(sum(Ri > 0),
                        length(Ri),
                        prob = 0.5,
                        lower.tail = FALSE)
    pval = pvalMedian
  }
  else if (method == "mean") {
    GammaHat = mean(Ri)
    TauHat = sd(Ri)
    testStatistic = GammaHat * sqrt(length(Ri)) / TauHat
    pvalMean = pnorm(testStatistic, lower.tail = FALSE)
    pval = pvalMean
  }
  reject = pval < alpha
  return(list(reject = reject, pval = pval))
}


# sequential method to estimate number of clusters using mean
estimate.clusters.mean <-
  function(D1,
           D2,
           logXis_pjs,
           alpha = 0.05) {
    K = ncol(logXis_pjs)
    # calculate the mean for each model's logXi
    meanLogXi = colmeans(logXis_pjs)
    for (j in 1:(K - 1)) {
      newAlpha = alpha / (K - j)
      
      # the index (larger than j) of the meanLogXi that is the largest, this
      # will provide the largest Gamma Hat, ie the test statistic most likely to
      # be rejected Ri which will be rejected, that is if this passes the
      # 'reject' test then all other models will. NB. this is only the case for
      # the mean test. To use the median test we need  a slight modification
      # (instead of using mean we select the index which maximises the sum of
      #   values >0)
      idxmax = which.max(meanLogXi[-(1:j)]) + j
      
      # calculating corresponding Ri and performing hypothesis test
      Ri = logXis_pjs[, idxmax] - logXis_pjs[, j]
      rej_pval  = reject.Ri(Ri, alpha = newAlpha, method = "mean")
      
      
      if (!rej_pval$reject) {
        return(j)
      }
    }
    return(K)
  }

# sequential method to estimate number of clusters using median
estimate.clusters.median <-
  function(D1,
           D2,
           logXis_pjs,
           alpha = 0.05) {
    K = ncol(logXis_pjs)
    for (j in 1:(K - 1)) {
      newAlpha = alpha / (K - j)
      
      if (j != K - 1) {
        foo = colsums(logXis_pjs[, -(1:j)] >  logXis_pjs[, j])
        idxmax = which.max(foo) + j
      } else{
        idxmax = K
      }
      # calculating corresponding Ri and performing hypothesis test
      Ri = logXis_pjs[, idxmax] - logXis_pjs[, j]
      rej_pval  = reject.Ri(Ri, alpha = newAlpha, method = "median")
      
      
      if (!rej_pval$reject) {
        return(j)
      }
      
    }
    return(K)
  }





# sequential method to estimate number of clusters using mean
estimate.clusters.meanl2 <-
  function(D1,
           D2,
           logXis_pjs = NULL,
           pjSquared = NULL,
           gj = NULL,
           alpha = 0.05) {
    if (is.null(gj)) {
      # gj = 2mean_i pj(Xi) - integral pj^2
      gj = 2 * logXis_pjs - outer(rep.int(1L, nrow(logXis_pjs)), pjSquared)
    }
    K = ncol(gj)
    mean_gj = colmeans(gj)
    for (j in 1:(K - 1)) {
      newAlpha = alpha / (K - j)
      
      # the index (larger than j) of the meanLogXi that is the largest, this
      # will provide the largest Gamma Hat, ie the test statistic most likely to
      # be rejected Ri which will be rejected, that is if this passes the
      # 'reject' test then all other models will. NB. this is only the case for
      # the mean test. To use the median test we need  a slight modification
      # (instead of using mean we select the index which maximises the sum of
      #   values >0)
      idxmax = which.max(mean_gj[-(1:j)]) + j
      
      # calculating corresponding Ri and performing hypothesis test
      Ri = gj[, idxmax] - gj[, j]
      rej_pval  = reject.Ri(Ri, alpha = newAlpha, method = "mean")
      
      
      if (!rej_pval$reject) {
        return(j)
      }
    }
    return(K)
  }


# sequential method to estimate number of clusters using median
estimate.clusters.medianl2 <-
  function(D1,
           D2,
           logXis_pjs = NULL,
           pjSquared = NULL,
           gj = NULL,
           alpha = 0.05) {
    if (is.null(gj)) {
      # gj = 2mean_i pj(Xi) - integral pj^2
      gj = 2 * logXis_pjs - outer(rep.int(1L, nrow(logXis_pjs)), pjSquared)
    }
    K = ncol(gj)
    for (j in 1:(K - 1)) {
      newAlpha = alpha / (K - j)
      
      if (j != K - 1) {
        foo = colsums(gj[, -(1:j)] >  gj[, j])
        idxmax = which.max(foo) + j
      } else{
        idxmax = K
      }
      # calculating corresponding Ri and performing hypothesis test
      Ri = gj[, idxmax] - gj[, j]
      rej_pval  = reject.Ri(Ri, alpha = newAlpha, method = "median")
      
      
      if (!rej_pval$reject) {
        return(j)
      }
      
    }
    return(K)
  }




estimate.clusters.hier <- function(D1, D2, alpha, verbose = F) {
  test.reject.list = Topdownclustering(D1, D2, alpha, verbose = verbose)$test.reject.list
  splits = sum(unlist(lapply(test.reject.list, function(i) {i$simple_median})))
  K = splits + 1L
  return(K)
}



estimate.cluster.all <- function(D1,
                                 D2,
                                 alpha = 0.05,
                                 K = floor(sqrt(nrow(D2))),
                                 verbose = F) {
  # calculate matrix of logged densities(G=1,...,K)
  logXis_pjs_df = tryCatch(logXi_dCalc(D1, D2, K, verbose = verbose), error= function(e) NULL)
  # if there is an error return -1 as predictions
  if (is.null(logXis_pjs_df)){
    meanEstimate = -1L
    medianEstimate = -1L
    meanEstimatel2 = -1L
    medianEstimatel2 = -1L
    BICEstimate = -1L
    AICEstimate = -1L
  }else{
  LogLiks = colsums(logXis_pjs_df$logXis_pjs)
  
  BICs = logXis_pjs_df$df * log(nrow(logXis_pjs_df$logXis_pjs)) - 2 * LogLiks
  BICEstimate = which.min(BICs)
  
  AICsOver2 = logXis_pjs_df$df - LogLiks
  AICEstimate = which.min(AICsOver2)
  
  medianEstimate = estimate.clusters.median(D1, D2, logXis_pjs_df$logXis_pjs, alpha)
  meanEstimate = estimate.clusters.mean(D1, D2, logXis_pjs_df$logXis_pjs, alpha)
  
  gj = 2 * logXis_pjs_df$logXis_pjs - outer(rep.int(1L, nrow(logXis_pjs_df$logXis_pjs)), logXis_pjs_df$pjSquared)
  
  medianEstimatel2 = estimate.clusters.medianl2(
    D1 = D1,
    D2 = D2,
    gj = gj,
    alpha = alpha
  )
  meanEstimatel2 = estimate.clusters.meanl2(
    D1 = D1,
    D2 = D2,
    gj = gj,
    alpha = alpha
  )
  }
  

  heirEstimateMedian = tryCatch(estimate.clusters.hier(D1, D2, alpha, verbose = verbose), error= function(e) -1L)
  #heirEstimateMedian = estimate.clusters.hier(D1, D2, alpha, verbose = verbose)
  
  return(
    list(
      meanEstimate = meanEstimate,
      medianEstimate = medianEstimate,
      meanEstimatel2 = meanEstimatel2,
      medianEstimatel2 = medianEstimatel2,
      BICEstimate = BICEstimate,
      AICEstimate = AICEstimate,
      heirEstimateMedian = heirEstimateMedian
    )
  )
}



gen.data <- function(sims = 1) {
  TotalClust = length(n_clust)
  n = sims * sum(n_clust)
  
  
  data = matrix(nrow = n, ncol = d + 1)
  startPoint = 1
  for (comp in (1:TotalClust)) {
    n1 = n_clust[comp] * sims
    data[startPoint:(startPoint + n1 - 1), ] = cbind(rep.int(1:sims, n_clust[comp]),
                                                     rmvnorm(n1,
                                                             mu = mus[comp,],
                                                             sigma = diag(rep.int(1L, d))))
    startPoint = startPoint + n1
  }
  
  return(data)
}
