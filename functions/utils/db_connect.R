db_connect <- function(){
  conn <- DBI::dbConnect(RPostgres::Postgres(),
                        host = Sys.getenv("DB_HOST"),
                        dbname = Sys.getenv("DB_NAME"),
                        user = Sys.getenv("DB_USER"),
                        password = Sys.getenv("DB_PASSWORD"),
                        port = Sys.getenv("DB_PORT"))
  conn
}