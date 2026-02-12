box::use(
  shiny,
  htmltools
)

#' @export
ui <- function(id) {
  ns <- shiny::NS(id)
  htmltools::div(
    class = "d-flex align-items-center",
    htmltools::img(src = "www/placeholder_logo.png", height = "40px", class = "me-3"),
    "My App"
  )
}