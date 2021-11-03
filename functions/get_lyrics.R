get_lyrics <- function(album, musica){
  con <- DBI::dbConnect(RPostgres::Postgres(),
                        host = Sys.getenv("DB_HOST"),
                        dbname = Sys.getenv("DB_NAME"),
                        user = Sys.getenv("DB_USER"),
                        password = Sys.getenv("DB_PASSWORD"),
                        port = Sys.getenv("DB_PORT"))
  
  query <- DBI::sqlInterpolate(con, sql = "SELECT letra FROM lyrics
                               WHERE album = ?album_entry AND
                               musica = ?musica_entry;",
                               album_entry = album,
                               musica_entry = musica)
  
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  result <- DBI::dbGetQuery(con, query)
  stringr::str_trim(result$letra)
  
}