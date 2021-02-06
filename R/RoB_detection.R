#' RiskOfBiasIdentification
#'
#' Identify Risk of Bias in input data within columns 'Title', 'Abstract' and 'PdfRelevantPath'
#'
#'
#' @param searchingData Either a dataset or a link to the dataset to search from
#' @param dictionary Either a dictionary dataset, or a link to the dictionary dataset to run the function on.
#'  It should consist two columns: name of the term and search string of the term. Regular expression (Perl) is accepted for the search string.
#'  If there is only one column, that column will be used both as name and regular expression.
#' @param linkSearchHeaders A list of the headers of the columns to read and search from. A list of character. Default value is empty string
#' @param dictionaryNameHeader The header string of name column in dictionary
#' @param dictionaryRegexHeader The header string of regular expression column in dictionary
#' @param ignoreCase boolean to decide whether to ignore the case in searching the content in dictionary in the searchingData or not
#' @param ignoreExistingTextFile ignoreExistingTextFile
#' @param cutIntro boolean varible to indicate whether introduction/background should be removed from pdfs
#' @param cutRefs boolean varible to indicate whether reference section should be removed from pdfs
#' @param extractStrings = boolean variable to indicate whether matching strings from full text should be extracted
#' @param conversionSoftware Software used to covert pdf to text. Default value is 'pdftotext'
#'
#' @return result flags
#'
Extract_RoB <- function(searchingData = NULL
                                      ,
                                      dictionary = "data/Preclinical_RoB_regex.csv"
                                      ,

                                      linkSearchHeaders = ""
                                      ,
                                      dictionaryNameHeader = 'Name'
                                      ,
                                      dictionaryRegexHeader = 'Regex'
                                      ,
                                      ignoreCase = TRUE
                                      ,
                                      ignoreExistingTextFile = TRUE
                                      ,
                                      cutIntro = FALSE
                                      ,
                                      cutRefs = FALSE
                                      ,
                                      extractStrings = FALSE
                                      ,
                                      conversionSoftware = 'pdftotext') {

results <-
  AutoAnnotation::CountTermsInStudies(
    searchingData = searchingData
    ,
    dictionary = dictionary
    ,
    textSearchingHeaders = ""
    ,
    linkSearchHeaders = linkSearchHeaders
    ,
    dictionaryNameHeader = dictionaryNameHeader
    ,
    dictionaryRegexHeader = dictionaryRegexHeader
    ,
    ignoreCase = ignoreCase
    ,
    ignoreExistingTextFile = ignoreExistingTextFile
    ,
    cutIntro = cutIntro
    ,
    cutRefs = cutRefs
    ,
    extractStrings = extractStrings
    ,
    conversionSoftware = conversionSoftware
  )

  results <- cbind(results, searchingData)

  results <- results %>%
    dplyr::mutate(Randomisation = ifelse(as.numeric(Randomisation >= 1), "Reported", "Not Reported")) %>%
    dplyr:: mutate(`Blinded Outcome` = ifelse(as.numeric(`Blinded Outcome` >= 1), "Reported", "Not Reported")) %>%
    dplyr::mutate(`Sample size` = ifelse(as.numeric(`Sample size` >= 1), "Reported", "Not Reported")) %>%
    dplyr::mutate(`Conflict of interest` = ifelse(as.numeric(`Conflict of interest` >= 1), "Reported", "Not Reported")) %>%
    dplyr::mutate(`Compliance with animal welfare` = ifelse(as.numeric(`Compliance with animal welfare` >= 1), "Reported", "Not Reported"))

  return(results)
}
