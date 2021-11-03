get_albuns_info <- function(album){
  con <- db_connect()

  if(album == "" || is.null(album)){
    query <- DBI::sqlInterpolate(con, sql = "SELECT nome, ano, produzido_por, gravadora FROM albuns_info;")
  }else{
    query <- DBI::sqlInterpolate(con, sql = "SELECT nome, ano, produzido_por, gravadora FROM albuns_info
                                 WHERE nome = ?name_entry;", name_entry = album)
  }
  
  on.exit(DBI::dbDisconnect(con))
  result <- DBI::dbGetQuery(con, query)
  result
}