#' Define a corpus 
#'
#' @description
#'
#' @usage
#'
#' @return A data frame of metadata:
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
get_document_corpus <- function(author, ddk, doctype, freetext, from_timestamp, from_year, fulltext, lang, limit, order_and_limit_by_rank, publisher, subject, title, to_timestamp, to_year){

    url <- "https://api.nb.no/dhlab/build_corpus"

    params <- list("author" = author, "ddk" = ddk, "doctype" = doctype, "freetext" = freetext, "from_timestamp" = from_timestamp, "from_year" = from_year, "fulltext" = fulltext, "lang" = lang, "limit" = limit, "order_and_limit_by_rank" = order_and_limit_by_rank, "publisher" = publisher, "subject" = subject, "title" = title, "to_timestamp" = to_timestamp, "to_year" = to_year)

    query <- POST(url, body = params, encode = "json")

    return(as.data.frame(do.call(cbind, content(query))))

}
