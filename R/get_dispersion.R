#'
#'
#' @description
#'
#' @usage
#'
#' @return
#'
#' |                   |                           |
#' |:------------------|:--------------------------|
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
get_dispersion <- function(urn = NULL, words = NULL, window = 500, pr = 100){
    
    url <- "https://api.nb.no/dhlab/dispersion"
    
    params <- list("urn" = urn, "words" = words, "window" = window, "pr" = pr)
    query <- POST(url, body = params, encode = "json")
    
    return(content(query))
    
}