# Power analysis

# H0: The man is not guilty; H1 The man is guilty.

# Error Type I ...  probability of rejecting the null hypothesis when it is true = alfa; typically use 5% as the chance of Error Type I; We sent the man who is not guilty to the prison.
#                   we usually choose 95% significance (certainity) of the test
# Error Type II ... probability of accepting the null hypothesis when it is false = beta; typically use 20% as the chance of Error Type II; We gave to the guilty man the freedom.
#                   we usually choose 80% power of the test

# if we decide for the standard power ... 1-beta = 0.8 and standard alfa = 0.05 (at each side = 0.025 => 2 * 0.025 = 0.05)
ceiling(((qnorm(0.8) + qnorm(0.975)) ^ 2) * 2) # = 2*t^2
# we know that
n <- 2 * t^2 * s^2 / d^2
# where d ... significant difference; effect size; delta
# s ... standard deviation; s^2 ... variance
# t ... two sample t-test

# What is the relation between n and detectable difference?
s <- 2            # standard deviation
n <- 1:60         # n of the one sample
d <- 4*s/sqrt(n)  # detectable 'significant' difference between mean samples
plot(d, n, col='blue', lwd=2, type='l')

# A few built-in function to measure power. Simply calculate the passed parameter.
# 2 samples, 2 means
# We want to know how many observations do we need for each of two samples, with detectable difference mean differeces 3, with power 0.8.
power.t.test(delta=3, sd=2, power=0.8)
power.t.test(n=26, sd=2, power=0.8)

# two-sample test for proportions
power.prop.test(n = 50, p1 = .50, p2 = .75)
power.prop.test(p1 = .50, p2 = .75, power = .90)
power.prop.test(n = 50, p1 = .5, power = .90)

# test for balanced one-way ANOVA tests
power.anova.test(groups = 4, n = 5, between.var = 1, within.var = 3)
power.anova.test(groups = 4, between.var = 1, within.var = 3, power = .80)
groupmeans <- c(120, 130, 140, 150)
power.anova.test(groups = length(groupmeans),
                 between.var = var(groupmeans),
                 within.var = 500, power = .90)
