#----- Set up and load packages ------
# install.packages("githubinstall")
# library(githubinstall)
#install_github("camaradesuk/RegexRoB")

library(RegexRoB)
library(readr)

#-------- Read in df of articles ------
papers <- read.csv("data/papers_to_assess.csv")

#-------- Simple RoB extraction ------

# extract ROB reporting 
# define linksearchHeader - column where PDF path is found
RoB_assessment <- RiskOfBiasIdentification(
  searchingData = papers,
  linkSearchHeaders = "PdfRelativePath",
  ignoreCase = TRUE)


#-------- RoB extraction with added functions to remove Introduction/Background and Reference sections of PDFs (experimental feature) ------

# extract ROB reporting 
# define linksearchHeader - column where PDF path is found
RoB_assessment <- RiskOfBiasIdentification(
  searchingData = papers,
  linkSearchHeaders = "PdfRelativePath",
  cutRefs = TRUE,
  cutIntro = TRUE,
  ignoreCase = TRUE)


#-------- RoB extraction with custom regex dictionary ------

# extract ROB reporting 
# define linksearchHeader - column where PDF path is found
RoB_assessment <- CountTermsInStudies(
  dictionary = "pathtocustomdictionary/regex.csv" 
  searchingData = papers,
  linkSearchHeaders = "PdfRelativePath",
  ignoreCase = TRUE)



