get_albuns_info <- function(album){
  con <- DBI::dbConnect(RPostgres::Postgres(),
                        host = Sys.getenv("DB_HOST"),
                        dbname = Sys.getenv("DB_NAME"),
                        user = Sys.getenv("DB_USER"),
                        password = Sys.getenv("DB_PASSWORD"),
                        port = Sys.getenv("DB_PORT"))
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