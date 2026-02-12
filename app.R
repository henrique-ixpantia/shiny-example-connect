# app.R: Entrypoint for Posit Connect Deployment
#
# This file tells Connect how to run the application.
# It uses shiny::runApp() to start the main app module located in `r/main.R`.

shiny::runApp("r/main.R", launch.browser = FALSE)