#' RiskOfBiasIdentification
#'
#' Identify Risk of Bias in input data within columns 'Title', 'Abstract' and 'PdfRelevantPath'
#'
#' @param searchingData Either a dataset or a link to the dataset to search from
#' @param linkSearchHeaders A list of the headers of the columns to read and search from. A list of character. Default value is empty string
#' @param ignoreCase boolean to decide whether to ignore the case in searching the content in dictionary in the searchingData or not
#' @param cutIntro boolean varible to indicate whether introduction/background should be removed from pdfs
#' @param cutRefs boolean varible to indicate whether reference section should be removed from pdfs
#' @param extractStrings = boolean variable to indicate whether matching strings from full text should be extracted
#' @param conversionSoftware Software used to covert pdf to text. Default value is 'pdftotext'
#' @import dplyr readr
#' @importFrom rlang .data
#' @importFrom magrittr "%>%"
#' @export
#' @return result flags
#'
Extract_RoB <- function(searchingData = NULL
                        ,
                        linkSearchHeaders = ""
                        ,
                        ignoreCase = TRUE
                        ,
                        cutIntro = FALSE
                        ,
                        cutRefs = FALSE
                        ,
                        extractStrings = FALSE
                        ,
                        conversionSoftware = 'pdftotext') {
  dictionary <- readr::read_csv(system.file("extdata", "Preclinical_RoB_regex.csv", package = "RegexRoB"))

  results <-
    AutoAnnotation::CountTermsInStudies(
      searchingData = as.data.frame(searchingData)
      ,
      dictionary = as.data.frame(dictionary)
      ,
      linkSearchHeaders = linkSearchHeaders
      ,
      ignoreCase = ignoreCase
      ,
      cutIntro = cutIntro
      ,
      cutRefs = cutRefs
      ,
      extractStrings = extractStrings
      ,
      conversionSoftware = conversionSoftware
    )

  for(icol in 2:ncol(results)) results[,icol] <- sapply(results[,icol], function(x) ifelse(as.numeric(as.character(x)) >= 1, TRUE, FALSE))

  results <- cbind(searchingData,results)

  return(results)
}

#' Load_RoB_Regex
#'
#' @return a data.frae
#' @export
#' @import readr
#' @examples
#' Load_RoB_Regex()
#'
Load_RoB_Regex <- function(){
  as.data.frame(readr::read_csv(system.file("extdata", "Preclinical_RoB_regex.csv", package = "RegexRoB")))
}

