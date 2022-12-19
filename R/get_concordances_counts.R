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
get_concordances_counts <- function(urns, words, window, limit){

    url <- "https://api.nb.no/dhlab/conccount"
    
    params <- list("urns" = urns, "query" = words, "window" = window, "limit" = limit)
    
    query <- POST(url, body = params, encode = "json")
    
    return(as.data.frame(do.call(cbind, content(query))))    
}