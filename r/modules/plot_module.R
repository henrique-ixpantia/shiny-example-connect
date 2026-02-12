box::use(
  shiny,
  bslib,
  ggplot2,
  dplyr
)

#' @export
ui <- function(id) {
  ns <- shiny::NS(id)
  bslib::card(
    bslib::card_header("Data Visualization"),
    bslib::card_body(
      shiny::plotOutput(ns("main_plot"))
    )
  )
}

#' @export
server <- function(id, data, filters) {
  shiny::moduleServer(id, function(input, output, session) {
    filtered_data <- shiny::reactive({
      df <- data
      selected_cat <- filters()$category

      if (selected_cat != "All") {
        df <- df |> dplyr::filter(category == selected_cat)
      }
      df
    })

    output$main_plot <- shiny::renderPlot({
      point_size <- filters()$size

      ggplot(filtered_data(), aes(x = x_value, y = y_value, color = category)) +
        geom_point(size = point_size) +
        theme_minimal(base_size = 16) +
        labs(
          title = "Sample Data Scatter Plot",
          x = "X Value",
          y = "Y Value"
        )
    })
  })
}