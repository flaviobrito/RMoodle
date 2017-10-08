# connection function
#' Title
#'
#' @param .driver
#' @param .user_name
#' @param .passwd
#' @param .db_name
#' @param .host_name
#' @param .port_number
#'
#' @return
#' @export
#'
#' @examples
#'
#Load VARS

library(DBI)
# .driver    <- Sys.getenv("DRIVER")
# .host_name <- Sys.getenv("DB_HOST")
# .db_name   <- Sys.getenv("DB_MOODLE")
# .dbuser    <- Sys.getenv("USER_NAME")
# .passwd    <- Sys.getenv("PASSWD")
# .port_number      <- Sys.getenv("PORT_NUMER")
#
# .db_connect <- function (.driver, .user_name, .passwd, .db_name, .host_name,.port_number){
#   .con = dbConnect(driver,
#                    username = user_name,
#                    password = passwd,
#                    dbname = db_name,
#                    host = host_name,
#                    port = port_number)
# }
#

dbm <- config::get("moodledata")
dbDriver <- dbDriver("MySQL")
db_connect <- function(dbDriver, dbm$uid, dbm$pwd, dbm$database, dbm$server, dbm$port){
                      con <- DBI::dbConnect(dbDriver,
                                            Server = dbm$server,
                                            UID    = dbm$uid,
                                            PWD    = dbm$pwd,
                                            Port   = dbm$port,
                                            Database = dbm$database)
}

library(RSQ)
dbm <- config::get("moodledata2")
dbDriver <- dbDriver("SQLite")

db_connect <- function(dbDriver, dbm$uid, dbm$pwd, dbm$database, dbm$server, dbm$port){
  con <- DBI::dbConnect(dbDriver,
                        Server = dbm$server,
                        UID    = dbm$uid,
                        PWD    = dbm$pwd,
                        Port   = dbm$port,
                        Database = dbm$database)
}

dbm <- config::get("moodledata2")

database.connection <-
  tryCatch(dbConnect(host = dbm$server,
                     dbname = dbm$database,
                     port = dbm$port,
                     user = dbm$uid,
                     password = dbm$pwd),
           error = function(e) e)

if (inherits(database.connection, 'try-error'))  {
  if (strict) stop(database.connection)
  else return(NULL)
}
if (verbose) message("* SQLite connection loaded...\n")
set_cache(database.connection, 'last_connection')
database.connection
}





## Not run:
SQLServer()
## End(Not run)
# View sql.yaml file bundled in package
file <- system.file("extdata", "sql.yaml", package = "RSQLServer")
readLines(file)
# Connect using ~/sql.yaml file
## Not run:
if (have_test_server()) {
  dbConnect(RSQLServer::SQLServer(), "TEST")
}
# Example where ~/sql.yaml does not exist or where the server
# is not in the YAML file.
dbConnect(RSQLServer::SQLServer(), server="11.1.111.11", port=1434,
          properties=list(useNTLMv2="true", domain="myco", user="me",
                          password="asecret"))
## End(Not run)




