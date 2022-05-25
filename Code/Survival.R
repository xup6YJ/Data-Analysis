

library("survival")

data("ovarian")

#calculate censoring data(days)
mydata[i, 61] = difftime(as.Date(mydata[i, 50]), as.Date(mydata[i, 41]), units = "days")

exp(-predict(fit,  type="expected"))
exp(-predict(fit, data = ovarian2, type="expected"))

train = read.csv('train.csv')
test = read.csv('test.csv')

# event : 30_RA
# time : Acute_LOS

fit <- coxph(Surv(Acute_LOS, X30_RA) ~ ., data = train)

#probability of model prediction
prob = exp(-predict(fit, data = test, type="expected"))
prob <- exp(-predict(fit, newdata = test,type = "expected"))

write.csv(prob, 'test_prob.csv')



