#' Get frequencies of concordances
#'
#' @description
#'
#' @usage
#'
#' @return A data frame of concordances:
#'
#' |                   |                           |
#' |:------------------|:--------------------------|
#' |                   |			   |
#' |                   |                           |
#' |                   |                           |
#' |                   |                           |
#' |                   |                           |
#'
#' @md
#'
#' @seealso 
#'
#' @examples
#'
#' @import httr
#'
#' @export
get_document_frequencies <- function(urns, cutoff, words){

    url <- "https://api.nb.no/dhlab/frequencies"

    params <- list("urns" = urns, "cutoff" = cutoff, "words" = words)

    query <- POST(url, body = params, encode = "json")

    return(content(query))

}