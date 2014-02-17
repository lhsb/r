## Compare two groups - their proportion of success (or response on treatment)

resp.1 <- 150          # success (response on treatment) in the group 1
no.resp.1 <- 262 - 150 # no-success (no-response on treatment) in the group 1
resp.2 <- 83           # success (response on treatment) in the group 2
no.resp.2 <- 134 - 83  # no-success (no-response on treatment) in the group 2

(p.hat1 <- resp.1 / (resp.1 + no.resp.1)) # proportion of success of the group 1
(p.hat2 <- resp.2 / (resp.2 + no.resp.2)) # proportion of success of the group 2

# Let's estimate 95% confidence interval for individual groups
# This quantity estimates the potential variability in the sample proportion across multiple random samples size n1 all taken from the population of the group1.
(SE.p.hat1 <- sqrt(p.hat1 * (1 - p.hat1) / (resp.1 + no.resp.1)))
(ci95.p.hat1 <- p.hat1 + c(-2,2) * SE.p.hat1) # 95ci for p.hat1
# This quantity estimates the potential variability in the sample proportion across multiple random samples size n1 all taken from the population of the group2.
(SE.p.hat2 <- sqrt(p.hat2 * (1 - p.hat2) / (resp.2 + no.resp.2)))
(ci95.p.hat2 <- p.hat2 + c(-2,2) * SE.p.hat2) # 95ci for p.hat2

# Let's estimate 95% confidence interval for the risk difference
(attributable.risk <- p.hat1 - p.hat2) # risk difference
(SE <- sqrt(p.hat1 * (1 - p.hat1) / (resp.1 + no.resp.1) + p.hat2 * (1 - p.hat2) / (resp.2 + no.resp.2))) # standard error
(attributable.risk.ci <- attributable.risk + c(-2,2) * SE) # CI95 for diffrence of proportion

# Let's estimate 95% confidence interval for the risk ratio
(risk.ratio <- p.hat1 / p.hat2) # or relative risk; risk of success for group 1; risk of success for group 2 = 1-this risk ratio
(log.risk.ratio <- log(risk.ratio))
(SE <- sqrt(1/resp.1 - 1/(resp.1+no.resp.1) + 1/resp.2 - 1/(resp.2+no.resp.2))) # standard error
(log.rr.ci <- log.risk.ratio + c(-2,2) * SE) # CI95 for log.risk.ratio
(rr.ci <- exp(log.rr.ci)) # CI95 for risk.ratio; is significant if complete interval is > 1 or < 1
cat("Interpretation of the risk ratio CI95:\nGroup 1 has",(risk.ratio - 1) * 100,
    '% (+ ... greater, - ... lower) risk of success than group 2. These resutls estimate that this (increased/descreased) risk could be between',
    (rr.ci - 1) * 100,'%')

# Let's estimate 95CI for odds ratio
(odds.ratio <- p.hat1 / (1 - p.hat1) / (p.hat2 / (1 - p.hat2)))
(log.odds.ratio <- log(odds.ratio))
(SE <- sqrt(1/resp.1 + 1/no.resp.1 + 1/resp.2 + 1/no.resp.2))
(log.or.ci <- log.odds.ratio + c(-2,2) * SE) # CI95 for log.or.ci
(or.ci <- exp(log.or.ci)) # CI95 for or.ci; is significant if complete interval is > 1 or < 1

cat('Interpretation of the odds ratio CI95:\nAt the time of starting therapy group 1 has',(odds.ratio - 1) * 100,
    '% (+ ... greater, - ... lower) odds of success (responding to the therapy) compared to group 2. These results esptimate that this (increase/decrease) in success (response) odds could be between',
    (or.ci - 1) * 100,'%')

# Estimates of ci95 in % - recap
cat('Risk Difference:',attributable.risk*100 ,'... and ci95:',attributable.risk.ci * 100) # difference in proportion
cat('Risk Ratio:',(risk.ratio - 1) * 100,'... and ci95:',(rr.ci - 1) * 100) # risk ratio
cat('Odds Ratio:',(odds.ratio - 1) * 100,'... and ci95:',(or.ci - 1) * 100) # odds ratio
