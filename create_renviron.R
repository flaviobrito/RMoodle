#' Create .Renviron file
#'
#' @param path
#'
#' @return
#' @export
#'
#' @examples
#' create_renviron("./")

create_renviron <- function(path) {
  user_renviron = path.expand(file.path(path, ".Renviron"))
  if (!file.exists(user_renviron))
    # check to see if the file already exists
    file.create(user_renviron)
  file.edit(user_renviron) # open with another text editor if this fails
}

create_renviron("./")
