get_musicas <- function(album){
  con <- db_connect()
  
  query <- DBI::sqlInterpolate(con, "SELECT musica FROM lyrics
                               WHERE album = ?album_entry;", album_entry = album)
  on.exit(DBI::dbDisconnect(con))
  result <- DBI::dbGetQuery(con, query)
  result$musica
}