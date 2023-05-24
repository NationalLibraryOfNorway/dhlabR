get_ngram_from_newspapers <- function(city = NULL, ddk = NULL, lang = NULL, period = list(), publisher = NULL, title = NULL, topic = NULL, word = list("hus", "blokk")){

  ngram_newspapers <- "https://api.nb.no/dhlab/ngram_newspapers"

  params <- list("city" = city, "ddk" = ddk, "lang" = lang, "period" = period, "publisher" = publisher, "title" = title, "topic" = topic, "word" = word)
  query <- POST(ngram_newspapers, body = params, encode = "json")

  return(stack(content(query)))
}
