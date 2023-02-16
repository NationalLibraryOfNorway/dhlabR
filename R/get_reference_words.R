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
get_reference_words <- function(doctype = NULL, from_year = NULL, to_year = NULL, words = NULL){
    
    url <- "https://api.nb.no/dhlab/reference_words"
    
    params <- list("doctype" = doctype, "from_year" = from_year, "to_year" = to_year, "words" = words)
    query <- POST(url, body = params, encode = "json")
    
    return(content(query))
    
}