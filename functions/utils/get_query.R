get_query <- function(pais, estado, cidade){
  test <- test_option(pais = pais, estado = estado, cidade = cidade)
  if(test == "nenhum"){
    query <- "SELECT * FROM shows;"
    return(query)
  }
  if(test == "todos"){
    query <- glue::glue("SELECT * FROM shows
                        WHERE pais = ?pais_entry AND
                        estado = ?estado_entry AND
                        cidade = ?cidade_entry;")
    return(query)
  }
  if(test == "p"){
    query <- glue::glue("SELECT * FROM shows
                        WHERE pais = ?pais_entry
                        ?estado_entry
                        ?cidade_entry;")
    return(query)
  }
  if(test == "e"){
    query <- glue::glue("SELECT * FROM shows
                        WHERE estado = ?estado_entry
                        ?pais_entry
                        ?cidade_entry;")
    return(query)
  }
  if(test == "c"){
    query <- glue::glue("SELECT * FROM shows
                        WHERE cidade = ?cidade_entry
                        ?pais_entry
                        ?estado_entry;")
    return(query)
  }
  if(test == "pe"){
    query <- glue::glue("SELECT * FROM shows
                        WHERE pais = ?pais_entry AND
                        estado = ?estado_entry
                        ?cidade_entry;")
    return(query)
  }
  if(test == "pc"){
    query <- glue::glue("SELECT * FROM shows
                        WHERE pais = ?pais_entry AND
                        cidade = ?cidade_entry
                        ?estado_entry;")
    return(query)
  }
  if(test == "ec"){
    query <- glue::glue("SELECT * FROM shows
                        WHERE estado = ?estado_entry AND
                        cidade = ?cidade_entry
                        ?pais_entry;")
    return(query)
  }
}