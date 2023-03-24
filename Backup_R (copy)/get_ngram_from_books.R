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
get_ngram_from_books <- function(city = NULL, ddk = NULL, lang = NULL, period = list(), publisher = NULL, title = NULL, topic = NULL, word = list("hus", "blokk")){
    
    ngram_book <- "https://api.nb.no/dhlab/ngram_book"
    
    params <- list("city" = city, "ddk" = ddk, "lang" = lang, "period" = period, "publisher" = publisher, "title" = title, "topic" = topic, "word" = word)
    query <- POST(ngram_book, body = params, encode = "json")
    
    return(stack(content(query)))
    
}