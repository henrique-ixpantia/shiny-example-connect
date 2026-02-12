box::use(
  shiny,
  bslib
)

#' @export
ui <- function(id, data) {
  ns <- shiny::NS(id)
  category_choices <- unique(data$category)

  bslib::card(
    bslib::card_header("Controls"),
    bslib::card_body(
      shiny::sliderInput(
        ns("point_size"),
        "Point Size:",
        min = 1,
        max = 10,
        value = 3,
        step = 1
      ),
      shiny::selectInput(
        ns("category"),
        "Filter by Category:",
        choices = c("All", category_choices),
        selected = "All"
      )
    )
  )
}

#' @export
server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    # Return a reactive that bundles the input values
    return(
      shiny::reactive(list(
        size = input$point_size,
        category = input$category
      ))
    )
  })
}