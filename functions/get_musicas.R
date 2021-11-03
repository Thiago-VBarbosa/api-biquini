get_musicas <- function(album){
  con <- DBI::dbConnect(RPostgres::Postgres(),
                        host = Sys.getenv("DB_HOST"),
                        dbname = Sys.getenv("DB_NAME"),
                        user = Sys.getenv("DB_USER"),
                        password = Sys.getenv("DB_PASSWORD"),
                        port = Sys.getenv("DB_PORT"))
  
  query <- DBI::sqlInterpolate(con, "SELECT musica FROM lyrics
                               WHERE album = ?album_entry;", album_entry = album)
  on.exit(DBI::dbDisconnect(con))
  result <- DBI::dbGetQuery(con, query)
  result$musica
}