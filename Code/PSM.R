

mydata <- read.csv('c_1009.csv')

library(MatchIt)
library(tableone)
## PS matching
library(Matching)
## Weighted analysis
library(survey)
## Reorganizing data
library(reshape2)
## plotting
library(ggplot2)

colnames(mydata)

m.out = matchit (chinese_med ~ sex + age + diabetes + hypertension + time_onset, 
                 data = mydata, method = "nearest", ratio = 1, caliper = 0.2) #caliper = tolerance

# matchit
result = summary (m.out)
# plot (m.out, type = "jitter")
plot (m.out, type = "hist")

m.data1 <- match.data (m.out)
# write.csv (m.data1, "match.csv")

# m.data1 = read.csv("match.csv")
colnames(data1)

## Covariates
#continuous var
vars <- c('time_onset' ,'siegle', 'SDRG', )
#factorial var
fvars = c('sex' ,'hypertension')

## Construct a table
tabUnmatched <- CreateTableOne(vars = vars, strata = "Chinese_med", data = m.data1, test = TRUE, factorVars = fvars)
## Show table with SMD
x1 = print(tabUnmatched)
x = print(tabUnmatched, smd = TRUE)

write.csv (x, "M_matchT1.csv")
