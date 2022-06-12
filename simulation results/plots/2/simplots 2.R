rm(list = ls())
## Install a package manager and packages
if (!require("pacman")) {
  install.packages("pacman")
}
pacman::p_load(ggplot2)
######### n3even
dist = 'normal' 
kval = 3
##
x = c(95, 5, 0, 0, NA, 95, 5, 0, 0, NA, 86, 14, 0, 0, NA, 86, 14, 0, 0, NA, 42, 52, 6, 0, NA)
d = 2
delta = 1
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
)
x = c(0, 0, 100, 0, NA, 0, 0, 100, 0, NA, 0, 0, 91, 1, NA, 0, 0, 93, 1, NA, 0, 0, 94, 5, NA)
d = 2
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(23, 25, 52, 0, NA, 23, 25, 52, 0, NA, 40, 58, 2, 0, NA, 40, 58, 2, 0, NA, 0, 0, 88, 12, NA)
d = 8
delta = 1
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(0, 0, 100, 0, NA, 0, 0, 100, 0, NA, 0, 0, 100, 0, NA, 0, 0, 100, 0, NA, 0, 0, 99, 1, NA)
d = 8
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
########## t3even
kval=3
dist='t'
x = c(52, 47, 1, 0, NA, 58, 42, 0, 0, NA, 0, 80, 13, 3, NA, 1, 79, 13, 3, NA, 5, 74, 19, 1, NA)
d = 2
delta = 1
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(5,7, 37, 51, NA, 6, 8, 36, 50, NA, 0, 0, 17, 66, NA, 0, 0, 18, 66, NA, 33, 31, 16, 18, NA)
d = 2
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(21 ,28, 12, 9, NA, 21 ,28, 12, 9, NA, 1, 31, 48, 16, NA, 1, 31, 48, 16, NA, 1, 1, 78, 20, NA)
d = 8
delta = 1
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(12 ,0, 5, 8, NA, 12 ,0, 5, 8, NA, 0, 0, 0, 72, NA, 0, 0, 0, 72, NA, 6, 17, 12, 30, NA)
d = 8
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))

##uneven 
kval=3
dist='normal'
x = c(0 ,2, 65, 33, NA, 0 ,2, 64, 34, NA, 0, 4, 59, 28, NA, 0, 4, 59, 29, NA, 0, 0, 87, 13, NA)
d = 2
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))
kval=3
dist='t'
x = c(4 ,40, 11, 38, NA, 4 ,40, 13, 36, NA, 0, 20, 24, 41, NA, 0, 22, 25, 41, NA, 47, 37, 8, 6, NA)
d = 2
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))

##############
kval = 10
dist = 'normal'
x = c(100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA)
d = 2
delta = 1
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(0 ,0, 45, 33, NA, 1 ,0, 45, 32, NA, 1 ,8, 25, 24, NA, 1 ,11, 24, 21, NA, 100 ,0, 0, 0, NA)
d = 2
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA)
d = 8
delta = 1
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(4 ,0, 30, 28, NA, 4 ,0, 30, 28, NA, 1 ,5, 34, 30, NA, 1 ,5, 34, 30, NA, 100 ,0, 0, 0, NA)
d = 8
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))

############## t10even
dist = 't'
x = c(100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA)
d = 2
delta = 1
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(81 ,1, 7, 7, NA, 81 ,1, 7, 7, NA, 2 ,6, 15, 13, NA, 2 ,7, 16, 13, NA, 100 ,0, 0, 0, NA)
d = 2
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA, 100 ,0, 0, 0, NA)
d = 8
delta = 1
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
x = c(87 ,0, 0, 1, NA, 87 ,0, 0, 1, NA, 26 , 4, 10,16, NA, 26 ,7, 12, 18, NA, 100 ,0, 0, 0, NA)
d = 8
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=T
))
##uneven 10
##uneven
dist='normal'
x = c(9 ,23, 16, 19, NA, 9 ,23, 16, 19, NA, 7, 29, 23, 16, NA, 12, 25, 23, 14, NA, 100, 0,0, 0, NA)
d = 2
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))

dist='t'
x = c(87 ,3, 4, 2, NA, 87 ,3, 4, 2, NA, 16, 12, 23, 15, NA, 16, 13, 25, 11, NA, 100, 0, 0, 0, NA)
d = 2
delta = 4
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))

############# n10 rand
kval=10
dist='normal (r)'
x = c(64 ,22, 11, 3, NA, 64 ,22, 11, 3, NA, 49, 19, 17, 8, NA, 49, 20, 17, 8, NA, 97, 2, 1, 0, NA)
d = 2
delta = 20
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))
x = c(28 ,46, 26, 0, NA, 28 ,46, 26, 0, NA, 51, 20, 14, 1, NA, 57, 14, 14, 0, NA, 36, 8, 56, 0, NA)
d = 2
delta = 200
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))
############# t10 rand
kval=10
dist='t (r)'
x = c(92 ,3, 4, 1, NA, 92 ,3, 4, 1, NA, 60, 12, 10, 5, NA, 60, 12, 11, 4, NA, 100, 0, 0, 0, NA)
d = 2
delta = 20
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))
x = c(52 ,25, 17, 6, NA, 52 ,25, 17, 6, NA, 61, 20, 9, 0, NA, 61, 20, 9, 0, NA, 47, 12, 40,1, NA)
d = 2
delta = 200
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))
x = c(8 ,0, 1, 78, NA, 8 ,0, 1, 78, NA, 1, 9, 26, 56, NA, 1, 9, 27, 58, NA, 50, 33, 15,2, NA)
d = 8
delta = 20
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))
x = c(8 ,4, 55, 29, NA, 8 ,4, 55, 29, NA, 0, 2, 27, 17, NA, 0, 2, 27, 18, NA, 1, 9, 76,14, NA)
d = 8
delta = 200
for (i in 1:(length(x)/5)){
  i1 = 5*i-4
  i2 = i1+3
  x[5*i] = 100 - sum(x[i1:i2])
}
df <- rbind(df, data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 5),
  order  = rep(seq(5), 5),
  Method = rep(c("RS-mean", "RS-mean l2", "RS-median","RS-median l2", "RHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval,even=F
))





####PLOTTING
h = 2.5
kval=3
dist = 'normal'
data = subset(df, distribution==dist&k==kval&even==T)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution'))+
  facet_grid(d ~ delta, labeller = label_both)
ggsave("n3even2.pdf", plot = p, width =7 , height=2*h)

dist = 't'
data = subset(df, distribution==dist&k==kval&even==T)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution'))+
  facet_grid(d ~ delta, labeller = label_both)
ggsave("t3even2.pdf", plot = p, width =7 , height=2*h)

data = subset(df, k==kval&d==2&delta==4)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, d=',2,' delta=',4))+
  facet_grid(distribution ~ even, labeller = label_both)
ggsave("3even_uneven2.pdf", plot = p, width =7 , height=2*h)




### 10
kval=10
dist = 'normal'
data = subset(df, distribution==dist&k==kval&even==T)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution'))+
  facet_grid(d ~ delta, labeller = label_both)
ggsave("n10even2.pdf", plot = p, width =7 , height=2*h)

dist = 't'
data = subset(df, distribution==dist&k==kval&even==T)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution'))+
  facet_grid(d ~ delta, labeller = label_both)
ggsave("t10even2.pdf", plot = p, width =7 , height=2*h)


data = subset(df, k==kval&d==2&delta==4)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, d=',2,' delta=',4))+
  facet_grid(distribution ~ even, labeller = label_both)
ggsave("10even_uneven2.pdf", plot = p, width =7 , height=2*h)


kval=10
dist = 't (r)'
data = subset(df, distribution==dist&k==kval)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution')) +
  facet_grid(d ~ delta, labeller = label_both)
ggsave("t10evenrand2.pdf", plot = p, width =7 , height=2*h)

dval = 2
kval=10
dist = 'normal (r)'
data = subset(df, d==dval&distribution==dist&k==kval)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution')) +
  facet_grid(d ~ delta, labeller = label_both)
ggsave("n10evenrand2.pdf", plot = p, width =7 , height=h)
