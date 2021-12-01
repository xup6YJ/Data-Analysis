

library(stringr)

data <- read.csv('Regression.csv')

#Enter your y & x
independent_var = str_c('Sex', 'Age',	'Group', 'Hypertension', sep = " + ")
dependent_var = c('V1', 'V2', 'V3')

standard_error <- function(x) sd(x) / sqrt(length(x))

db_reg = function(data1 = data, x = independent_var, y = dependent_var){
  
  result_matrix = matrix(0, nrow = length(y), ncol = 10)
  colnames(result_matrix) = c('mean_group1', 'sd_group1',
                              'mean_group2', 'sd_group2',
                              'beta', 'p_value','95% lower bound','95% upper bound', 'rsquare',
                              'Adj-rsquare')
  
  rownames(result_matrix) = y
  
  for (i in 1:length(y)) {
    Formula1 = paste0(y[i], '~' , x)
    Result1 = lm(Formula1, data = data1)
    summary(Result1)
    
    modelSummary <- summary(Result1)  # capture model summary as an object
    modelCoeffs <- modelSummary$coefficients  # model coefficients
    beta.estimate <- modelCoeffs["Group", "Estimate"]  # get beta estimate for speed
    std.error <- modelCoeffs["Group", "Std. Error"]  # get std.error for speed
    
    p_value <- modelCoeffs[2,4]  # calc p Value
    
    rsquare = modelSummary$r.squared
    adj_rsquare = modelSummary$adj.r.squared
    mean_group1 = mean(data1[data1[,'Group'] == 1,][,y[i]])
    sd_group1 = standard_error(data1[data1[,'Group'] == 1,][,y[i]])
    mean_group2 = mean(data1[data1[,'Group'] == 0,][,y[i]])
    sd_group2 = standard_error(data1[data1[,'Group'] == 0,][,y[i]])
    
    result_matrix[i,1] = mean_group1
    result_matrix[i,2] = sd_group1
    result_matrix[i,3] = mean_group2
    result_matrix[i,4] = sd_group2
    result_matrix[i,5] = beta.estimate
    result_matrix[i,6] = p_value
    result_matrix[i,7] = confint(Result1)[2,1]
    result_matrix[i,8] = confint(Result1)[2,2]
    result_matrix[i,9] = rsquare
    result_matrix[i,10] = adj_rsquare
    
  }
  
  return(result_matrix)
}

final_result = db_reg(data1 = data, x = independent_var, y = dependent_var)
write.csv(final_result, 'Reg_table.csv')
