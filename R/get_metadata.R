#' Get National Library Metadata for identifiers
#'
#' This function retrieves metadata for objects from the National Library API based on either a vector of dhlabids or a vector of National Library URNs.
#'
#' @param dhlabids A vector of dhlabids (default is NULL). When provided, the function will use dhlabids to fetch metadata.
#' @param urns A vector of National Library URNs (default is NULL). When provided, the function will use URNs to fetch metadata.
#' @return A dataframe containing the National Library metadata for the specified objects.
#' @examples
#' \dontrun{
#'   dhlabids_example <- c("dhlabid1", "dhlabid2", "dhlabid3")
#'   urns_example <- c("URN1", "URN2", "URN3")
#'   metadata_dhlabids <- get_metadata(dhlabids = dhlabids_example)
#'   metadata_urns <- get_metadata(urns = urns_example)
#' }
#' @export
get_metadata <- function(dhlabids = NULL, urns = NULL){

  url <- "https://api.nb.no/dhlab/get_metadata"

  params <- list("dhlabids" = dhlabids, "urns" = urns)
  query <- POST(url, body = params, encode = "json")

  return(do.call(cbind, content(query)))

}