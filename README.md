# Data Analysis
Statistical Data Analysis Technique using R

# Generalized Estimating Equation (GEE)
Changing original data to GEE data using code ["GEE.R"](https://github.com/xup6YJ/Data-Analysis/blob/main/Code/GEE.R).
- Remember to read the original format of data ["O.csv"](https://github.com/xup6YJ/Data-Analysis/blob/main/Example%20Data/O.csv).
- You should change your name of repeat measurement variable into variable1, variable2 which means the first measurement of variable and the second measurement of variable.(For example: Mr. Lin got 90 and 95 in the pre-test and post-test, you'll need to set the data format into score1 = 90, score2 = 95...etc.)
- You should modify the code if you have more than 2 repeat measurement variables (2 variables are preset).

# Multi-Linear Regression
["Multi_Regression.R"](https://github.com/xup6YJ/Data-Analysis/blob/main/Code/Multi_Regression.R) is used for linear regression modeling, under the circumstance of analysing the same independent variables but different dependent variables. You could organize the table result in a short time by using our function.
- Remember to read the original format of data ["Regression.csv"](https://github.com/xup6YJ/Data-Analysis/blob/main/Example%20Data/Regression.csv).
- You should enter your dependent and independent variables.
- Our example shows a LR result of "V1~Sex + Age + Group + Hypertension", which contains 'mean_group1', 'sd_group1','mean_group2', 'sd_group2', 'unstandardize_beta', 'p_value', '95% lower bound', '95% upper bound', 'rsquare', 'Adj-rsquare'.

# Batch Data Reading and Concatenating
Read and concatenate all the data in a folder using code ["Folder_data_concat.R"](https://github.com/xup6YJ/Data-Analysis/blob/main/Code/Folder_data_concat.R).
- All the columns(variables) in the folder data should need the same (different columns for different data binding are not allowed).
