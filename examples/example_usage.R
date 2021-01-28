library(readr)

papers <- read.csv("data/papers_to_assess.csv")#
pdftotext <- "S:/Regex_Dev/xpdfbin-win-3.04/bin64/pdftotext.exe"

RoB_assessment <- RiskOfBiasIdentification(
  searchingData = papers,
  linkSearchHeaders = "PdfRelativePath",
  ignoreCase = TRUE ,
  conversionSoftware = pathtotext)
