k = 2
d = 1


sigma = lapply(rep.int(1, k), function(x) diag(x, nrow = d))
w = rep.int(1, k)
w = w / sum(w)


## my method
n = 10e5 # default value
N = 200

deltas = c(0.1, 100)


my_integral = matrix(NA, N, 2)
other_integral = my_integral
num_integral = numeric(2)
for (j in 1:length(deltas)){
  delta = deltas[j]
  mu = matrix(runif(k * d, min = 0, max = delta), nrow = k)
  mu0 = 0*mu
for (i in 1:N){
set.seed(18+i)
samples = rmixn(n = n,mu = mu,sigma = sigma, w = w)
f = dmixn(X = samples,mu = mu,sigma = sigma, w = w)
#h = f**2
integral.val = mean(f) #= mean(h/f)h/f = f
my_integral[i,j] = integral.val



samples = rmixt(n = n,mu = mu0,sigma = sigma,df = 1,w = w)
h = dmixn(X = samples,mu = mu,sigma = sigma,w = w)**2 
f = dmixt(X = samples,mu = mu0,sigma = sigma,df = 1,w = w)
integral.val2 = mean(h/f)
other_integral[i,j] = integral.val2
print(i)
}
  integrand <- function(x) {dmixn(X = matrix(x),mu = mu,sigma = sigma, w = w)**2}
  num_integral[j] = integrate(integrand, -10, 110, subdivisions=10000L)$value
  data1 <- data.frame(h = my_integral[,j], B = other_integral[,j])
  boxplot(data1, names=c("f = fitted p_10", "f = t distribution"), cex=0.8)
}




pdf(file="impsamp1.pdf", width= 8, height=4)
par(mfrow=c(1,2))
data1 <- data.frame(h = my_integral[,1], B = other_integral[,1])
title = paste('delta=', deltas[1])
boxplot(data1, main = title, names=c("f = fitted p", "f = t distribution") , cex=0.8)
abline(h = num_integral[1],col = "Red")

data1 <- data.frame(h = my_integral[,2], B = other_integral[,2])
title = paste('delta=', deltas[2])
boxplot(data1, main = title, names=c("f = fitted p", "f = t distribution"), cex=0.8)
abline(h = num_integral[2],col = "Red")
dev.off()





