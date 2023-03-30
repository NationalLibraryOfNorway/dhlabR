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
get_urn_frequencies <- function(urns = NULL){
    
    url <- "https://api.nb.no/dhlab/urn_frequencies"
    
    params <- list("urns" = urns)
    query <- POST(url, body = params, encode = "json")
    
    return(content(query))
    
}