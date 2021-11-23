

data = read.csv(file = 'O.csv')

id = levels(as.factor(data[,'ID'])) #id column
colnames(data)

variables = c('ID','Group', 'Time', 'V1', 'V2')
#nrow = test times, ncol = number of variables
GEE_function = function(data = data, test_times, variables = variables){
  
  sub_data = matrix(NA, nrow = test_times, ncol = length(variables))
  colnames(sub_data) = variables
  
  data_info = NULL
  
  for (i in 1:length(id)) {
    
    subdat = data[data[,'ID']==id[i],]
    #colnames(subdat)
    
    #'ID'
    sub_data[,'ID'] = id[i]
    #'GROUP'
    sub_data[,'Group'] = subdat[,'Group']
    
    #Change 0~1 or 1~2
    #Add codes if u've got other variables(V3, V4...)
    for (j in 1:test_times) {
      
      #'V1'
      sub_data[j,'V1'] = subdat[,paste0('V1', j)]
      
      #'V2'
      sub_data[j,'V2'] = subdat[,paste0('V2', j)]
      
      #'V3'
      # sub_data[j,'V3'] = subdat[,paste0('V3', j)]
      #'V4'
      # sub_data[j,'V4'] = subdat[,paste0('V4', j)]

      #'Time'
      sub_data[j,'Time'] = as.numeric(j)
    }
    
    data_info = rbind(sub_data, data_info)
  }
  
  return(data_info)

}

#Change your times and variables your own
GEE_function(test_times = 2, variables = variables)

write.csv(data_info, file = 'O_GEE.csv')

