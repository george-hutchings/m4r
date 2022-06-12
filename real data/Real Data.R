# real life example
alpha=0.05
K=10
ds = c(25,50,75,100,125,150)

n = nrow(dat_mat)
set.seed(18)
dat_mat = dat_mat[sample.int(n),]


### PCA
pca.dat = prcomp(dat_mat, center = TRUE, scale = TRUE)
pca_estimates = matrix(NA, 8, length(ds))
mad_estimates = matrix(NA, 8, length(ds))
for (j in 1:length(ds)) {
d = ds[j]
print(sum(pca.dat$sdev[1:d]^2)/sum(pca.dat$sdev^2))
data = pca.dat$x[,1:d]
D1 = data[1:floor(n / 2), ]
D2 = data[(floor(n / 2) + 1):n, ]
# Estimate no.clusters
Cluster_numbers = estimate.cluster.all(D1, D2, alpha=alpha, K=K)
sigclust_h = sum(shc(data, alpha = alpha)$nd_type == "sig") +1L
pca_estimates[,j] = unlist(c(Cluster_numbers, shc = sigclust_h))


### MAD
#Calculate MAD about median of the genes
Median.dat = apply(dat_mat, 2, mad)
Median.dat.order = order(Median.dat, decreasing = T)
data = dat_mat[,Median.dat.order[1:d]]
D1 = data[1:floor(n / 2), ]
D2 = data[(floor(n / 2) + 1):n, ]

# Estimate no.clusters
Cluster_numbers = estimate.cluster.all(D1, D2, alpha=alpha, K=K)
sigclust_h = sum(shc(data, alpha = alpha)$nd_type == "sig") +1L
mad_estimates[,j] = unlist(c(Cluster_numbers, shc = sigclust_h))
}
names = c(
  "meanEstimate",
  "medianEstmate",
  "meanEstimatel2",
  "medianEstimatel2",
  "BICEstimate",
  "AICEstimate",
  "heirEstimateMedian",
  "shc"
)
pca_df = as.data.frame(pca_estimates)
rownames(pca_df)=names
colnames(pca_df)=paste0(as.character(ds),"d")
mad_df = as.data.frame(mad_estimates)
rownames(mad_df)=names
colnames(mad_df)=paste0(as.character(ds),"d")

print(pca_df)
print(mad_df)

