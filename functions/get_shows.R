get_shows <- function(pais, estado, cidade){
  con <- db_connect()
  
  query <- DBI::sqlInterpolate(con, sql = get_query(pais = pais, estado = estado, cidade = cidade),
                               pais_entry = pais,
                               estado_entry = estado,
                               cidade_entry = cidade)
  
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  result <- DBI::dbGetQuery(con, query)
  result
  
}