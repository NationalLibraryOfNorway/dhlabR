#' Retrieve Token Frequencies in Documents
#'
#' This function obtains token frequencies within specified documents.
#'
#' @param pids A vector or data frame containing document IDs.
#' @param cutoff A numeric value specifying the frequency cutoff for tokens.
#' @param words A vector of words (tokens) to retrieve frequencies for.
#'
#' @return A list containing the following elements for each document:
#' - Document ID
#' - Token
#' - Token frequency in the document
#' - Total tokens in the document
#'
#' @import httr
#' @export
#'
#' @examples
#' \dontrun{
#' document_ids <- c("doc1", "doc2", "doc3")
#' frequency_cutoff <- 10
#' tokens <- c("word1", "word2", "word3")
#' result <- get_document_frequencies(document_ids, frequency_cutoff, tokens)
#' }
get_document_frequencies <- function(pids, cutoff, words){
  if (is.data.frame(pids)) {
    pids <- unname(pids$urn)
  } else {
    pids <- unname(pids)
  }

  url <- "https://api.nb.no/dhlab/frequencies"

  params <- list("urns" = pids, "cutoff" = cutoff, "words" = words)

  query <- POST(url, body = params, encode = "json")

  #return(content(query))
  return(as.data.frame(do.call(cbind, content(query))))
  }
