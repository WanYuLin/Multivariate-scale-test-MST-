# Multivariate-scale-test-MST-
Multivariate scale test (MST) for detecting gene-environment interactions
##########################################################################################
If you use this code to analyze data, please cite the following paper: 
Lin W-Y* (2024). Detecting gene-environment interactions from multiple continuous traits.
Any questions or comments, please contact: Wan-Yu Lin, Institute of Health Data Analytics and Statistics, National Taiwan University College of Public Health
Thank you.
##########################################################################################

The R code to implement Multivariate scale test (MST) (file name: "MST.R")      

Example data (file name: "exampledata.csv")

Suppose you save the source code and the example data under the D disk.

source("D:/MST.R")

aa <- read.csv("D:/exampledata.csv")

MST(aa[,1:3], aa[,4:7], aa[,8:ncol(aa)])
    #  Traits   Covariates     SNPs

Output: the P-values of MST and UST (Univariate scale test) for individual traits.

Thanks for your interest.
