#' Get concordances from corpus definition
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
#' @import httr jsonlite
#'
#' @export
get_collocations <- function(pids, word, before=10, after=10, sample_size=5000){

    if (is.data.frame(pids)) {
        pids <- unname(pids$urn)
    } else {
        pids <- unname(pids)
    }

    url <- "https://api.nb.no/dhlab/urncolldist_urn"

    params <- list("urn" = pids, "word" = word, "before" = before, "after" = after, "samplesize" = sample_size)

    query <- POST(url, body = params, encode = "json")

    return(fromJSON(content(query)))

}
