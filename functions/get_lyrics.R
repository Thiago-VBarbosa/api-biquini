get_lyrics <- function(album, musica){
  con <- db_connect()
  
  query <- DBI::sqlInterpolate(con, sql = "SELECT letra FROM lyrics
                               WHERE album = ?album_entry AND
                               musica = ?musica_entry;",
                               album_entry = album,
                               musica_entry = musica)
  
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  result <- DBI::dbGetQuery(con, query)
  stringr::str_trim(result$letra)
  
}