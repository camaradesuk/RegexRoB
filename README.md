# Automatically extract risk of bias reporting from research articles 

RegexRoB is an R package for automatic annotation of risk of bias reporting from full-text research articles using a regular expression dictionary. The default dictionary for this package was created for preclinical animal experiments in biomedicine.  

The main function is RiskOfBiasIdentification() which takes in a dataframe/ matrix of studies and their associated full text path (e.g. PDF or .txt file). 

# Installation
install.packages("devtools")
library(devtools)
install_github("camaradesuk/RegexRoB")
