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
get_frequencies <- function(urns = NULL, words = NULL, cutoff = 1){
    
    url <- "https://api.nb.no/dhlab/frequencies"
    
    params <- list("urns" = urns, "words" = words, "cutoff" = cutoff)
    query <- POST(url, body = params, encode = "json")
    
    return(content(query))
    
}