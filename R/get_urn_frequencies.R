#' Get word count frequencies for a list of URNs or dhlabids
#'
#' This function takes a list of National Library of Norway (NB) identifiers,
#' either URNs or dhlabids, and returns the word count for each object.
#' It queries the National Library's API to fetch the word count data.
#'
#' @param urns A list or data frame of URNs from the National Library of Norway.
#'        If a data frame, it should have a column named 'urn'.
#' @param dhlabids A list of 'dhlabid' ids from National Library DHLAB.
#'
#' @return A data frame with two columns: 'dhlabid' and 'frequencies'.
#'         Each row represents a library text resource with its corresponding word count.
#'
#' @examples
#' # Example usage with a list of URNs
#' \dontrun{
#' urn_list <- c("URN1", "URN2", "URN3")
#' word_counts <- get_urn_frequencies(urn_list)
#' print(word_counts)
#'}
#' # Example usage with a data frame of URNs
#' \dontrun{
#' urn_dataframe <- data.frame(urn = c("URN1", "URN2", "URN3"))
#' word_counts <- get_urn_frequencies(urn_dataframe)
#' print(word_counts)
#'}
#' @import httr
#' @export
get_urn_frequencies <- function(urns = NULL, dhlabids = NULL){

  if (is.data.frame(urns)) {
    urns <- unname(urns$urn)
  } else {
    urns <- unname(urns)
  }


  url <- "https://api.nb.no/dhlab/urn_frequencies"

  # params <- list("urns" = urns)
  params <- list("dhlabid" = dhlabids, "urns" = urns)
  query <- POST(url, body = params, encode = "json")

  result <- as.data.frame(do.call(rbind, content(query)))

  colnames(result) <- c("dhlabid", "tokens")

  return(result)
}
