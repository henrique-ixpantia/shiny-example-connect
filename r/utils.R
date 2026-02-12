box::use(
  bslib,
  sass
)

#' @export
APP_THEME <- bslib::bs_theme(
  version = 5,
  primary = "#007bff",
  bg = "#f8f9fa",
  fg = "#212529"
) |>
  bslib::bs_add_rules(
    sass::sass_file(
      # Use an absolute path relative to the app's root
      normalizePath(file.path("styles", "main.scss"))
    )
  )