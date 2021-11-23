


library(data.table)

#Point to your file folder path
path = 'F:/test' 

files = list.files(path)
files = as.data.frame(files)

all_data = NA

for (i in 1:nrow(files)) {
  
  # i = 1
  print(i)
  filename = paste0(path, '\\',files[i,])
  
  tryCatch(
    expr = {
      data1 = read.table(filename, header = TRUE)
    },
    error = function(e){ 
      file.remove(filename)
    }
  )
  
  data1$filename = files[i,]
  all_data = rbind(all_data, data1)
}

all_data = all_data[-1,]

write.csv(all_data, 'data_concat.csv')