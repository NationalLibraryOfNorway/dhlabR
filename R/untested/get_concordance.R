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
#' @import httr
#'
#' @export
get_concordance <- function(pids, words, window=20, limit=5000){

    if (is.data.frame(pids)) {
        pids <- unname(pids$urn)
    } else {
        pids <- unname(pids)
    }

    url <- "https://api.nb.no/dhlab/conc"

    params <- list("urns" = pids, "query" = words, "window" = window, "limit" = limit)

    query <- POST(url, body = params, encode = "json")

    return(as.data.frame(do.call(cbind, content(query))))

}
