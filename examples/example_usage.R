#----- Set up and load packages ------
# install.packages("githubinstall")
# library(githubinstall)
#install_github("camaradesuk/RegexRoB")

library(RegexRoB)
library(readr)

#-------- Read in df of articles ------
papers <- read.csv("data/papers_to_assess.csv")

#-------- Simple RoB extraction ------

RoB_assessment <- Extract_RoB(
  searchingData = papers,
  linkSearchHeaders = "PdfRelativePath",
  ignoreCase = TRUE)


#-------- RoB extraction with strings extracted for manual check  ------

RoB_assessment_with_strings <- Extract_RoB(
  searchingData = papers,
  linkSearchHeaders = "PdfRelativePath",
  ignoreCase = TRUE,
  extractString = TRUE)

#-------- RoB extraction with added functions to remove Introduction/Background and Reference sections of PDFs (experimental feature) ------

RoB_assessment_introrefscut <- Extract_RoB(
  searchingData = papers,
  linkSearchHeaders = "PdfRelativePath",
  cutRefs = TRUE,
  cutIntro = TRUE,
  ignoreCase = TRUE)


#-------- RoB extraction with custom dictionary ------

# RoB_assessment_introrefscut <- CountTermsInStudies(
#   searchingData = papers,
#   dictionary = "data/path_to_custom_dictionary.csv",
#   linkSearchHeaders = "PdfRelativePath",
#   ignoreCase = TRUE)
#




