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
library(devtools)
install_github("shihikoo/AutoAnnotation")
```
## Pdf to text software 
Code calls 'pdftotext' to convert pdf to text.

One may download the Xpdf command line tools at http://www.xpdfreader.com/download.html
And add the software path to parameter 'conversionSoftware'.
