get_shows <- function(pais, estado, cidade){
  con <- DBI::dbConnect(RPostgres::Postgres(),
                        host = Sys.getenv("DB_HOST"),
                        dbname = Sys.getenv("DB_NAME"),
                        user = Sys.getenv("DB_USER"),
                        password = Sys.getenv("DB_PASSWORD"),
                        port = Sys.getenv("DB_PORT"))
  query <- DBI::sqlInterpolate(con, sql = get_query(pais = pais, estado = estado, cidade = cidade),
                               pais_entry = pais,
                               estado_entry = estado,
                               cidade_entry = cidade)
  
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  result <- DBI::dbGetQuery(con, query)
  result
  
}