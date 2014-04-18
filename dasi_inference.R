# numerical discrete  ... whole non divided count (number of siblings)

# randomly assign ... causation
# random sampling ... generalizible

# Is the sample representative? voluntary bias, responsive bias, ...

# Sampling  ... simple random, stratified, cluster
# What is sampled? (sizes or persons, ...)

# Blocking  ... control for variables which can influnece the response; we want all variables to be equally represented in all treatment groups; 1. group subject into blocks, 2 randomize cases in each block

# Probability - marginal and conditional probability
m = matrix(c(78,19,11,23,23,9,13,12,16), nrow=3)
m = cbind(m, rowSums(m))
m = rbind(m, colSums(m))
# What is the probability that a randomly chosen male respondent with blue eyes has a partner with blue eyes?
# Among only males with blue eyes, we're looking for those who have partners with blue eyes.
m[1,1] / m[1,4]

# disjoint ... (mutually exclusive events) connot be independent - if one event occures cannot occure another event; P(A and B) = 0
# complements ... may be mutually exclusive events (H,T ... 0.5 + 0.5 = 1) if there are only 2 outcomes
# independence ... knowing something about A event give me no information about B event

Pr.to.have.a.boy = 0.51
n.children = 3
(Pr.to.have.exactly.two.boys = dbinom(2, n.children, Pr.to.have.a.boy))
(Pr.to.have.at.least.two.boys = sum(dbinom(c(2,3), n.children, Pr.to.have.a.boy)))
pbinom(0.95, 100, prob=0.11)

# Standard deviation ... measures variability in the data
# Standard Error ... measures variability of the sample statistic
SE = sigma / sqrt(n)

# CLT is about the distribution of point estimates
# conditions: ... n >= 30, not extremely skewed or population has normal distribution, independent observation in the sample (must be random sample to prevent of biases, confounders)
# x.bar = N(mean=mu, SE=sigma/sqrt(n))


# Confidence Interval ... "We are XX% confident that the TRUE POPULATION parameter is in this interval"
sample.n = 100
sample.statistic.m = 415 # sample mean
sample.statistic.s = 220 # sample standard deviation
z.score = qnorm(0.975) # for 95% two-sided confidence of the normal distribution
SE = sample.statistic.s / sqrt(sample.n)
ME = z.score * SE
(CI95 = sample.statistic.m + c(-1, 1) * ME)


# Margin of Error ... distance from point estimate to the confidence interval; higher confidence level means a larger margin of error
# Example: I'd like to limit margin of error of 95% confidence interval to 25 points. How many cases should I use?
m = 1500 # mean
s = 300 # standard deviation
ME = 25 # margin of error; ME = z * s / sqrt(n)
z.score = qnorm(0.975) # z-score for 95% CI two-sided
(n = ceiling((z.score * s / ME)^2))


# Hypothesis ... is about population parameter; H0 is usually = 0; HA is two-sided != or one-sided < or >
# conditions for using CLT: sample makes up less than 10% of population; random sampling; independent observations

# p-value ... P(observed or more extreme statistic | H0)

# Type 1 error ... rejecting null hypothesis when the null hypothesis is true (H0: a person is innocent; Type1Err = send an innocent person to the prison); use a smaller α if Type 1 error is relatively riskier
# Type 2 error ... failing to reject null hypothesis when alternative hypothesis is true (H0: a person is innocent; Type2Err = a guilty person stays free); use a larger α if Type 2 error is relatively riskier


# Calculate a p-value as the area under the normal curve
H0.mu = 10 # population mean; HA: mu != 130 at significance level alfa = 0.1
sample.n = 40 # number cases in sample
sample.statistic.m = 9.51 # sample mean
sample.statistic.s = 4.65 # sample standard deviation
two.sided.test = F # False if test is one-sided

(SE = (sample.statistic.s / sqrt(sample.n)))
(z.score = (sample.statistic.m - H0.mu) / SE) # suppose that distribution is normal
if(z.score < 0) { # *2 ... two-sided; 1- ... I am interested in the extrem = beyond the z.score (ends of the tails)
  pom = pnorm(z.score)
} else {
  pom = (1 - pnorm(z.score))
}
ifelse(two.sided.test, p.val = pom * 2, p.val = pom) 
p.val
# p.val > significance level -> there is no convincing evidence to reject null hypothesis


# Bootstrap distribution ... is created by sampling with replacement from the original sample - is not necessarily be centered at the population parameter

# t-distribution ... degrees of freedom df = min(n1 − 1, n2 − 1) for two datasets or n - 1 for one dataset; increase degrees of freedom -> the t-distribution approaches more the normal distribution
# it is usable only for the means
# t-test ... compare sample means (two)
# t-test for dependent groups ... paired t-test
# t-test for independent groups ... no-paired t-test
n = 25
sig.level = 0.05
qt(sig.level, df= n - 1) # t-score; in this case one-tailed .. the lowest 5%
# calculation CI, HT, SE are same as for normal distribution; if compare two groups use SE = sqrt(s1^2 / n1 + s2^2 / n2) 

# F-test ... compare sample means (more than two); ANOVA
# observations should be independent within and across gorups
# the data within each group are nearly normal
# the variability across groups is about equal ... good to use side-by-side box plots
f.score = MSG / MSE
# MSG ... Mean Squared between groups; variability BETWEEN groups; df = number of groups - 1
# MSE ... Mean Squared Error; variability within errors; mean(resid(model)); df = total sample size - number of groups
# H0: mu1 = mu2 = ... muk
# HA: At least one mean is different

# If the original significance level for the ANOVA was 0.05, what should be the adjusted significance level for the pairwise tests to compare all pairs of means to each other?
# Bonferroni correction, α⋆ = α/K, where K is the number of comparisons being considered) to combat inflating this error rate.
alfa = 0.05
number.of.groups = 5
alfa / ((number.of.groups * (number.of.groups - 1)) / 2)



# CLT and proportions
# the observations in the sample are independent
# the sample size is sufficiently large ... success.failure.condition
success.failure.condition = function(n, p) {
  ifelse(n * p >= 10 & n * (1 - p) >= 10, return(cat('\nPass\n\n')), return(cat('\nFailure\n\n')))
}

n = 3226; p = 0.24
success.failure.condition(n, p)
(SE = sqrt(p * (1 - p) / n))

# chi-squared test of goodness of fit: evaluate if the distribution of levels of a single categorical variable follows a hypothesized distribution
# chi-square test of independence: evaluating the independence of two categorical variables where at least one has more than two levels
# H0: factors are independent


# Simulation
# When sample size isn't sufficiently large, and the parameter of interest is a proportion or a difference between two proportions, we need to use simulation.
# In hypothesis:
# for one categorical variable, generate simulated samples based on the null hypothesis, and then calculate the number of samples that are at least as extreme as the observed data
# for two categorical variables, use a randomization test


# Association between two numerical variables evaluate:
# direction: positive (x ↑, y ↑), negative (x ↓, y ↑)
# form: linear or not
# strength: determined by the scatter around the underlying relationship

# The correlation coefficient is unitless and so does not change if the units of the involved variables change.
# the correlation coefficient is always between -1 and 1, -1 indicating perfect negative linear association, +1 indicating perfect positive linear association, and 0 indicating no linear relationship
# the correlation of X with Y is the same as of Y with X
# the correlation coefficient is sensitive to outliers (Pearson, use Spearman if you want robust correlation coefficinet)
# if you change units the absolute value of the slope can change, but correlation coefficient stays same

# least square line as the line that minimizes the sum of the squared residuals
# condition for fitting:
# linearity
# nearly normal residuals
# constatn variability

# R.squared = percentage of the variability in the response variable explained by the the explanatory variable
# sqrt(R.squared) = correlation coefficient - careful with sign

# R.squared.adj = 1 - SSE/(n - k - 1) / SST/(n - 1)
# applies a penalty for the number of predictors included in the regression model.
# Suppose you have performed forward selection using adjusted R2 as the criterion and have chosen a model with 6 predictors. Your final model has a higher adjusted R2 than any of the smaller models you tried.

# Define a leverage point as a point that lies away from the center of the data in the horizontal direction.
# Define an influential point as a point that influences (changes) the slope of the regression line. This is usually a leverage point that is away from the trajectory of the rest of the data.

# Interpretation of slope estimate; estim = beta0 + beta1 * var
# when x is numerical: For each unit increase in x, we would expect y to be lower/higher on average by |b1| units
# when x is categorical: The value of the response variable is predicted to be |b1| units higher/lower between the baseline level and the other level of the explanatory variable.
# the response variable increases or decreases is determined by the sign of b1

# SST; Sum of squares total is the total variability in the response variable.


# Multiple linear regression
# df = n - k - 1
# List the conditions for multiple linear regression
# linear relationship between each (numerical) explanatory variable and the response - checked using scatterplots of y vs. each x, and residuals plots of residuals vs. each x
# nearly normal residuals with mean 0 - checked using a normal probability plot and histogram of residuals
# constant variability of residuals - checked using residuals plots of residuals vs. y^, and residuals vs. each x
# independence of residuals (and hence observations) - checked using a scatterplot of residuals vs. order of data collection (will reveal non-independence if data have time series structure)

# parsimonious model ... The simplest model with the highest predictive power.

# collinearity ... A high correlation between two explanatory variables such that the two variables contribute redundant information to the model



# Inference function
load(url('http://s3.amazonaws.com/assets.datacamp.com/course/dasi/inference.Rdata'))
# Do you need to know all possible parameters of the fucntion? If you use RStudio click on the function name and press F2

# load data
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/dasi/nc.Rdata"))

# Confidence interval for mean
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.9, est = "mean", 
          boot_method = "perc")
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95, est = "mean", 
          boot_method = "perc")

# Standard Error method
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95, est = "mean", 
          boot_method = "se")

# Estimate interval for median
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95, est = "median", 
          boot_method = "se")

# Difference between two means - hypothesis
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0, 
          alternative = "twosided", method = "theoretical", order=c('smoker','nonsmoker'))

# Load the 'gss' data frame
load(url('http://s3.amazonaws.com/assets.datacamp.com/course/dasi/gss.Rdata'))
str(gss)
table(gss$class)

# ANOVA test
# alternative hypothesis is set to greater because F-tests are always onesided
inference(y = gss$wordsum, x = gss$class, est = "mean", method = "theoretical", 
          type = "ht", alternative = "greater")


# Load in the atheism data set with the help of the provided function.
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/dasi/atheism.RData"))

# The subset for India for 2012:
india <- subset(atheism, nationality == 'India' & year == '2012')
# Single proportion; Calculate the confidence intervals for the proportion of atheists in India (2012).
inference(india$response, est='proportion', type='ci', method='theoretical',success='atheist')

# Take the 'spain' subset:
spain = spain <- subset(atheism, nationality == "Spain")
# Difference between two proportions grouped by variable year
inference(spain$response, spain$year, est='proportion', type="ci",
          method='theoretical',success='atheist')
# check confidence interval
# There is NO convincing evidence that Spain has seen a change in its atheism index between 2005 and 2012.

# Take the 'us' subset:
us <- subset(atheism, nationality == 'United States')
# Difference between two proportions grouped by variable year
inference(us$response, us$year, est='proportion', type='ci', method='theoretical', success='atheist')
# check confidence interval
# There is convincing evidence that Spain has seen a change in its atheism index between 2005 and 2012.
