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
get_document_frequencies <- function(pids, cutoff, words){

    if (is.data.frame(pids)) {
        pids <- unname(pids$urn)
    } else {
        pids <- unname(pids)
    }

    url <- "https://api.nb.no/dhlab/frequencies"

    params <- list("urns" = pids, "cutoff" = cutoff, "words" = words)

    query <- POST(url, body = params, encode = "json")

    return(content(query))

}
