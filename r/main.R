box::use(
  shiny,
  bslib,
  htmltools,
  . / utils[APP_THEME],
  . / components / header,
  . / components / sidebar,
  . / modules / plot_module,
  . / data / data_loader
)

# Load data once when the app starts
app_data <- data_loader$load_data()

ui <- bslib::page_sidebar(
  title = header$ui("header"),
  theme = APP_THEME,
  sidebar = bslib::sidebar(
    width = 300,
    sidebar$ui("sidebar", app_data)
  ),
  bslib::layout_column_wrap(
    width = 1,
    plot_module$ui("plot")
  )
)

server <- function(input, output, session) {
  # Get reactive filter values from the sidebar module
  filters <- sidebar$server("sidebar")

  # Pass data and filters to the plot module
  plot_module$server("plot", data = app_data, filters = filters)
}

# This is required for shiny::runApp("r/main.R") to work
shiny::shinyApp(ui, server)