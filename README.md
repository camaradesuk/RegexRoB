# Automatically extract risk of bias (RoB) reporting from research articles 

RegexRoB is an R package for automatic annotation of risk of bias reporting from full-text research articles using a regular expression dictionary. The default dictionary for this package was created for preclinical animal experiments in biomedicine. This was created to assess the  reporting of:
* Random allocation of animals to experimental groups
* Blinded outcome assessment
* Sample size calculations
* Conflict of interest statements 
* Compliance with animal welfare regulations 

The main function is **Extract_RoB()** which takes in a dataframe/ matrix of studies and their associated full text path (e.g. PDF or .txt file) and produces a table of results for each article. 

## Installation:

```{r}
install.packages("devtools")
devtools::install_github("camaradesuk/RegexRoB")
```

## Examples of Usage
 
```{r}
#----- Set up and load packages ------
library(RegexRoB)

#-------- Read in df of articles ------
searchingData <- readr::read_csv(system.file("extdata", "paper_to_assess.csv", package = "RegexRoB"))

#-------- Simple RoB extraction ------

RoB_assessment <- Extract_RoB(
  searchingData = searchingData,
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

```

## Pdf to text software 
Code calls 'pdftotext' to convert pdf to text.

One may download the Xpdf command line tools at http://www.xpdfreader.com/download.html
And add the software path to parameter 'conversionSoftware'.
