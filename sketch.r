library(httr)

document_corpus <- function(a,b){
    params <- list("author" = a, "limit" = b)
    query <- POST("https://api.nb.no/dhlab/build_corpus", body = params, encode = "json")
    
    return(as.data.frame(do.call(cbind, content(query))))
}

concordance <- function(urns, words, window, limit){
    params <- list("urns" = urns, "query" = words, "window" = window, "limit" = limit)
    query <- POST("https://api.nb.no/dhlab/conc", body = params, encode = "json")
    
    return(as.data.frame(do.call(cbind, content(query))))
}

concordances_counts <- function(urns, words, window, limit){
    params <- list("urns" = urns, "query" = words, "window" = window, "limit" = limit)
    query <- POST("https://api.nb.no/dhlab/conccount", body = params, encode = "json")
    
    return(as.data.frame(do.call(cbind, content(query))))    
}
