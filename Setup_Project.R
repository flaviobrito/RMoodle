library(template)
library(devtools)
source("./RMoodle/R/create_environ.R")
getwd()

# create_renviron <- function(path) {
#   user_renviron = path.expand(file.path(path, ".Renviron"))
#   if (!file.exists(user_renviron))
#     # check to see if the file already exists
#     file.create(user_renviron)
#   file.edit(user_renviron) # open with another text editor if this fails
# }
#Call my function to create .Renviron
create_renviron("~/Desenv_Flavio/")

#Read .Renviron
readRenviron("~/Desenv_Flavio/.Renviron")
#Get Variable from .Renviron



#new_project("RMoodle", github = TRUE, private.repo = FALSE, travis = FALSE)

create("RMoodle")
.atoken<-Sys.getenv("GITHUB_PAT")
#Run twice - bug or ?
use_github(auth_token=.atoken, private = FALSE, pkg="./RMoodle/", host="https://api.github.com",protocol="https", NULL)
####


