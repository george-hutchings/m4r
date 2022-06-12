rm(list = ls())
## Install a package manager and packages
if (!require("pacman")) {
  install.packages("pacman")
}
pacman::p_load(ggplot2)

#########n3even
dist = 'normal'
kval = 3
##
x = c(1, 69, 26, 4, 0, 0, 0, 11, 10, 10)
d = 2
delta = 2
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- data.frame(
  Count = x,
  prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
  order  = rep(seq(5), 2),
  Method = rep(c("RHC", "SHC"), each = 5),
  d = d,
  delta = delta, distribution = dist, k =kval
)
x = c(0, 0, 94, 5, 0, 0, 0, 89, 3, 8)
d = 2
delta = 4
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta,
              distribution = dist, k =kval
            ))
x = c(0, 88, 12, 0, 0, 0, 0, 23, 5, 72)
d = 8
delta = 1
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta,distribution = dist, k =kval
            ))
x = c(0, 0, 100, 0, 0, 0, 0, 86, 7, 7)
d = 8
delta = 8
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
###
dist = 't'
###
x = c(12, 42, 38, 7, 0, 9, 53, 20, 4, 7)
d = 2
delta = 2
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(33, 31, 16, 18, 0, 0, 0, 94, 6, 0)
d = 2
delta = 4
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(1, 1, 78, 20, NA, 0, 0, 0, 3, NA)
d = 8
delta = 1
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(1, 59, 16, 14, NA, 0, 0, 1, 10, NA)
d = 8
delta = 2
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(12, 15, 0, 65, NA, 0, 0, 3, 14, NA)
d = 8
delta = 8
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))




###################
dist= 'normal'
kval = 10
##
x = c(100, 0, 0, 0, NA, 39, 16, 8, 19, NA)
d = 2
delta = 1
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(98, 2, 0, 0, NA, 0, 0, 91, 8, NA)
d = 2
delta = 6
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(100, 0, 0, 0, NA, 0, 2, 5, 12, NA)
d = 8
delta = 1
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(100, 0, 0, 0, NA, 0, 0, 90, 7, NA)
d = 8
delta = 6
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))

### t dist
dist='t'
x = c(100, 0, 0, 0, NA, 96, 2, 2, 0, NA)
d = 2
delta = 1
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(100, 0, 0, 0, NA, 0, 0, 87, 12, NA)
d = 2
delta = 6
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(100, 0, 0, 0, NA, 0, 0, 0, 2, NA)
d = 8
delta = 1
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(100, 0, 0, 0, NA, 0, 0, 0, 0, NA)
d = 8
delta = 6
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))


###################
dist= 'normal (r)'
kval = 10
##
x = c(97, 2, 1, 0, NA, 20, 15, 27, 17, NA)
d = 2
delta = 20
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(36, 8, 56, 0, NA, 0, 3, 81, 15, NA)
d = 2
delta = 200
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
dist= 't (r)'
##
x = c(100, 0, 0, 0, NA, 49, 19, 14, 8, NA)
d = 2
delta = 20
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(47, 12, 40, 1, NA, 0, 0, 41, 36, NA)
d = 2
delta = 200
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(50, 33, 15, 2, NA, 0, 0, 0, 0, NA)
d = 8
delta = 20
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))
x = c(1, 9, 76, 14, NA, 0, 0, 0, 0, NA)
d = 8
delta = 200
x[5] = 100 - sum(x[1:4])
x[10] = 100 - sum(x[6:9])
df <- rbind(df,
            data.frame(
              Count = x,
              prediction = rep(c(paste0("<",kval-1), kval-1, kval, kval+1, paste0(">",kval+1)), 2),
              order  = rep(seq(5), 2),
              Method = rep(c("RHC", "SHC"), each = 5),
              d = d,
              delta = delta, distribution = dist, k =kval
            ))


############# PLOTTING
h = 2.5 # height
dval = 2
kval=3
dist = 'normal'
##
data = subset(df, d==dval&distribution==dist&k==kval)
p <-ggplot(data,                                     
       aes(x = reorder(prediction, order),
           y = Count,
           fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution')) +
  facet_grid(d ~ delta, labeller = label_both)
ggsave("n3evena.pdf", plot = p, width =7 , height=h)

dval = 8
kval=3
dist = 'normal'
data = subset(df, d==dval&distribution==dist&k==kval)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution')) +
  facet_grid(d ~ delta, labeller = label_both)
ggsave("n3evenb.pdf", plot = p, width =7 , height=h)


dval = 2
kval=3
dist = 't'
data = subset(df, d==dval&distribution==dist&k==kval)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution')) +
  facet_grid(d ~ delta, labeller = label_both)
ggsave("t3evena.pdf", plot = p, width =7 , height=h)

dval = 8
kval=3
dist = 't'
data = subset(df, d==dval&distribution==dist&k==kval)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution')) +
  facet_grid(d ~ delta, labeller = label_both)
ggsave("t3evenb.pdf", plot = p, width =7 , height=h)
####
#k=10
kval=10
dist = 'normal'
##
data = subset(df, distribution==dist&k==kval)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution')) +
  facet_grid(d ~ delta, labeller = label_both)
ggsave("n10even.pdf", plot = p, width =7 , height=2*h)

kval=10
dist = 't'
##
data = subset(df, distribution==dist&k==kval)
p <-ggplot(data,                                     
           aes(x = reorder(prediction, order),
               y = Count,
               fill = Method)) +
  geom_bar(stat = "identity",
           position = "dodge")+ labs(x = "Predicted k")+
  ggtitle(paste0('Comparison of predictions of k, ', dist,' distribution')) +
  facet_grid(d ~ delta, labeller = label_both)
ggsave("t10even.pdf", plot = p, width =7 , height=2*h)

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
ggsave("t10evenrand.pdf", plot = p, width =7 , height=2*h)

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
ggsave("n10evenrand.pdf", plot = p, width =7 , height=h)





