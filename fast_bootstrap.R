d <- data.frame(V1 = runif(30)) # Create data
head(d); str(d)                 # I will analyze first column of 'd'

require(data.table)

B <- 1000       # the number of bootstrap replicates
nobs <- nrow(d) # the number of observations

dt <- data.table(iter=rep(1:B, each=nobs),                     # prepare table
                 values=sample(d[,1], size=B*nobs, replace=T)) # resample values
dt

# calculate statistics (mean) for each 'iter' group
datas <- dt[, list(mean = mean(values)), by=iter]
datas

quantile(datas$mean, c(0.025, 0.975)) # quantile 95% confidence interval

# parametric 95% confidence interval from Student t distribution
SE <- sqrt(sd(d[,1])^2 / nrow(d)) # standard error
mean(datas$mean) + c(-1,+1) * qt(0.975, nrow(d) - 1) * SE
