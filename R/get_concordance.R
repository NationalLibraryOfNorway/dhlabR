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
get_concordance <- function(urns, words, window, limit){

    url <- "https://api.nb.no/dhlab/conc"

    params <- list("urns" = urns, "words" = words, "window" = window, "limit" = limit)

    query <- POST(url, body = params, encode = "json")

    return(as.data.frame(do.call(cbind, content(query))))

}