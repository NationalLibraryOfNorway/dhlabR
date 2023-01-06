#' Get frequencies in documents
#'
#' @description
#'
#' @usage
#'
#' @return tuple (A,B,C,D) -> A id, B token, C token frequency, D tot token in doc
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
