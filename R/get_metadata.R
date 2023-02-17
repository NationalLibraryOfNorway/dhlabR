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
get_metadata <- function(dhlabids = NULL, urns = NULL){
    
    url <- "https://api.nb.no/dhlab/get_metadata"
    
    params <- list("dhlabids" = dhlabids, "urns" = urns)
    query <- POST(url, body = params, encode = "json")
    
    return(content(query))
    
}