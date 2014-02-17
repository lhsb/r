## Compare two groups - their incident rates, incident ratio and compute ci95 of incidence rate ratio

t1 <- 872.5 # follow-up of the group 1
i1 <- 150   # incidents of the group 1
n1 <- 262   # all observations of the group 1
t2 <- 842.5 # follow-up of the group 2
i2 <- 83    # incidents of the group 2
n2 <- 134   # all observations of the group 2

(ir1 <- i1 / t1) # incidence rate of the group 1; incidences per period
(ir2 <- i2 / t2)

# ir1 <- if you know incident rate, you can put it here and uncomment this row
# ir2 <- if you know incident rate, you can put it here and uncomment this row

(incidence.rate.ratio <- ir1 / ir2) # also known as hazard ratio
cat('Subjects in the group 1 have',(incidence.rate.ratio-1)*100,
    '% (if positive ... higher, negative ... lower) risk of incidence in the follow up period when compared to the subjects in the group 2.')

(log.IRR <- log(incidence.rate.ratio))
(SE <- sqrt(1 / i1 + 1 / i2))          # standard error
(log.IRR.ci <- log.IRR + c(-2,2) * SE) # ci95 of the log.IRR
(IRR.ci <- exp(log.IRR.ci))            # significant (positive/negative) association is there if the complete interval is > 1 or < 1
cat('Interpretation of the incidence rate ratio CI95:\nGroup 1 has',(incidence.rate.ratio - 1) * 100,
    '% (+ ... greater, - ... lower) incidence rate ratio. These results esptimate that "therapy" could (increase/decrease) risk',
    (IRR.ci - 1) * 100,'% at the population level.')
