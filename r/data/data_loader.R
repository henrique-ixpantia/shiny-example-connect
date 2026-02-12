box::use(
  readr
)

#' Loads the sample dataset
#' @export
load_data <- function() {
  readr::read_csv(
    # Use box::file to get a path relative to the project root
    box::file("sample_data.csv"),
    show_col_types = FALSE
  )
}

