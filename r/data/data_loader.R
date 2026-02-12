box::use(
  readr
)

#' Loads the sample dataset
#' @export
load_data <- function() {
  readr::read_csv(
    # Use an absolute path relative to the app's root
    normalizePath("data/sample_data.csv"),
    show_col_types = FALSE
  )
}