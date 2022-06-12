rm(list = ls())
## Install a package manager and packages
if (!require("pacman")){
  install.packages("pacman")}
pacman::p_load(Rfast, foreach, doParallel, mvnfast, rstudioapi, RColorBrewer)
current_path = rstudioapi::getActiveDocumentContext()$path 
setwd(dirname(current_path))



sds = c(1,2)
mus = c(-1,2)
ws = c(1,1)
ws = ws/sum(ws)
minval = min(mus)-max(sds)*3
maxval = max(mus)+max(sds)*3
x = seq(from = minval, to=maxval, length.out=1000)

colours = brewer.pal(n = 3, name = "Dark2")

d1 = dnorm(x, mean = mus[1], sd = sds[1])
d2 = dnorm(x, mean = mus[2], sd = sds[2])


pdf(file="gmm_example.pdf", width= 7, height=5)
plot(x, ws[1]*d1 + ws[2]*d2, type = 'l', lty=2, col = colours[1], xlab = "", ylab = "Density", ylim = c(0, max(d1, d2)), main="Density of mixture model with two components" )
lines(x, d1, col = colours[2])
lines (x, d2, col = colours[3],)

legend("topleft", legend=c("Mixture", "Component 1 N(-1, 1)", "Component 2 N(2,4)"),
       col=colours, lty = c(2,1,1), cex=0.8)

dev.off()






