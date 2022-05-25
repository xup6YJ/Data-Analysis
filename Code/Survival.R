

library("survival")

data("ovarian")

exp(-predict(fit,  type="expected"))
exp(-predict(fit, data = ovarian2, type="expected"))

train = read.csv('D:/File_X/Help/hsu/train.csv')
test = read.csv('D:/File_X/Help/hsu/test.csv')

# event : 30_RA
# time : Acute_LOS

fit <- coxph(Surv(Acute_LOS, X30_RA) ~ ., data = train)

prob = exp(-predict(fit, data = test, type="expected"))
prob <- exp(-predict(fit, newdata = test,type = "expected"))

write.csv(prob, 'D:/File_X/Help/hsu/test_prob.csv')



