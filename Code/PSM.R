

mydata <- read.csv('c_1009.csv')

library(MatchIt)

#######Siegle
colnames(mydata)

m.out = matchit (中醫 ~ 性別 + Age + 糖尿病 + 高血壓 + siegle0 + 耳鳴 + 暈眩 + time_onset, 
                 data = mydata, method = "nearest", ratio = 1, caliper = 0.2)

# matchit
result = summary (m.out)
# plot (m.out, type = "jitter")
plot (m.out, type = "hist")

m.data1 <- match.data (m.out)
write.csv (m.data1, "match.csv")


## tableone package itself
library(tableone)
## PS matching
library(Matching)
## Weighted analysis
library(survey)
## Reorganizing data
library(reshape2)
## plotting
library(ggplot2)

data1 = read.csv("M_match.csv")
colnames(data1)

## Covariates
vars <- c('time_onset' ,'siegle', 'SDRG', )
fvars = c('sex' ,'hypertension')

## Construct a table
tabUnmatched <- CreateTableOne(vars = vars, strata = "Chinese_med", data = data1, test = TRUE, factorVars = fvars)
## Show table with SMD
x1 = print(tabUnmatched)
x = print(tabUnmatched, smd = TRUE)

write.csv (x, "M_matchT1.csv")